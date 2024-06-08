package com.example.cosmetic.controller.order;

import java.awt.event.ItemEvent;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Console;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.http.HttpClient;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.net.ssl.HttpsURLConnection;

import org.apache.ibatis.javassist.tools.framedump;
import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cosmetic.model.order.OrderDAO;
import com.example.cosmetic.model.order.OrderDTO;
import com.example.cosmetic.model.product.PageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/order/")
public class OrderController {
	
	private static final String KEY = "6746882717766507";
	private static final String SECRET = "wwGfcjpUcw74nxulMRj9ZKMeT3h8tZtiytjDoc9XDjlhrXUyrB9vvY7vDalSFvrT5ciMw5REpV0IZlGK";
	
	@Autowired
	OrderDAO orderDAO;
	
	// 장바구니의 주문하기 버튼 > 주문서 작성페이지
	@PostMapping("orderform.do")
	public String orderform(
			@RequestParam(name = "cart_id", required = false) String[] c_ids,
			@RequestParam(name = "option_txt", defaultValue = "") String[] options,
			@RequestParam(name = "p_order_id") String[] productIds, 
			@RequestParam(name = "amount") String[] amounts,

			@RequestParam(name = "price") int price, 
			@RequestParam(name = "delfee") int delfee,
			@RequestParam(name = "totalPrice") int totalPrice, 
			HttpSession session, Model model) {
		
		Pattern pattern = Pattern.compile("\\d");

        for (int i = 0; i < options.length; i++) {
            if (pattern.matcher(options[i]).find()) { // 숫자가 있는지 확인
                options[i] = ""; // 배열 값을 빈 문자열로 변경
            }
        }
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		List<Map<String, Object>> list = new ArrayList<>();

		for (int i = 0; i < amounts.length; i++) {

			int p_id = Integer.parseInt(productIds[i]);
			int amount = Integer.parseInt(amounts[i]);
			int c_id = Integer.parseInt(c_ids[i]);
			String option = options[i];

			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String file_name = (String) orderDAO.orderedProducts(p_id).get("file_name");
			
			String split_str = "src/main/webapp";
			String[] parts = file_name.split(split_str);
			if (parts.length > 1) {
			    file_name = "/" + (parts[1].startsWith("/") ? parts[1].substring(1) : parts[1]);
			} else {
			    file_name = parts[0];
			}
			
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");
			// 정보를 map으로 합치기
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", p_id);
			map.put("c_id", c_id);
			map.put("option", option);
			map.put("file_name", file_name);
			map.put("p_price", p_price);
			map.put("amount", amount);
			map.put("p_name", p_name);
			list.add(map);
		}

		// 포인트
		int currentPoint = orderDAO.showPoint(userid); // 보유한 포인트
		int addPoint = (int) Math.round(price * 0.01); // 포인트 비율 설정

		// 다음페이지로 전달
		model.addAttribute("list", list);
		model.addAttribute("options", options);
		model.addAttribute("price", price);
		model.addAttribute("delfee", delfee);
		model.addAttribute("totalPrice", totalPrice);

		model.addAttribute("currentPoint", currentPoint);
		model.addAttribute("addPoint", addPoint);

		return "/product/order/order_form";
	}

	// 바로 구매시
	@PostMapping("orderform_item.do")
	public String orderform_item(
			@RequestParam(name = "option", defaultValue = "") String[] options,
			@RequestParam(name = "cart_id", required = false) String[] c_id1,
			@RequestParam(name = "p_order_id") String[] productId1, 
			@RequestParam(name = "amount") String[] amount1,

			@RequestParam(name = "p_o_price") String price1,
			@RequestParam(name = "delfee") String delfee1,
			@RequestParam(name = "totalPrice") String totalPrice1, 
			HttpSession session, Model model) {
		
		Pattern pattern = Pattern.compile("\\d");
		
		for (int i = 0; i < options.length; i++) {
            if (pattern.matcher(options[i]).find()) { // 숫자가 있는지 확인
                options[i] = ""; // 배열 값을 빈 문자열로 변경
            }
        }
		
		if (options.length == 0) {
			 options = new String[]{""};
		}
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		List<Map<String, Object>> list = new ArrayList<>();
		
		for (int i=0; i<amount1.length; i++) {
			int p_id = Integer.parseInt(productId1[i]); 
			int amount = Integer.parseInt(amount1[i]);
			String option = options[i];
			
			//p_id값으로 상품정보 가져오기 //이미지, 상품명, 상품가격 
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name"); 
			String file_name = (String) orderDAO.orderedProducts(p_id).get("file_name");
			
			String split_str = "src/main/webapp";
			String[] parts = file_name.split(split_str);
			if (parts.length > 1) {
			    file_name = "/" + (parts[1].startsWith("/") ? parts[1].substring(1) : parts[1]);
			} else {
			    file_name = parts[0];
			}
			
			  int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");
			  
			  //정보를 map으로 합치기 
			  Map<String, Object> map = new HashMap<>(); 
			  map.put("p_id", p_id); 
			  map.put("amount", amount); 
			 map.put("option", option);
			  map.put("p_name", p_name);
				map.put("file_name", file_name); 
				map.put("p_price", p_price);
			  
			if (c_id1 != null) {
					int c_id = Integer.parseInt(c_id1[i]);
					map.put("c_id", c_id);  
				}
			  
			  list.add(map);
		}
		int price = Integer.parseInt(price1);
		int delfee = Integer.parseInt(delfee1);
		int totalPrice = Integer.parseInt(totalPrice1);
		  
		   
		  
		  //포인트 
		  int currentPoint = orderDAO.showPoint(userid); //보유한 포인트 
		  int addPoint = (int) Math.round(price * 0.5); //포인트 비율 설정
		  
		  //다음페이지로 전달 
		  model.addAttribute("list", list);
		  model.addAttribute("options", options);
		  model.addAttribute("price", price);
		  model.addAttribute("delfee", delfee);
		  model.addAttribute("totalPrice", totalPrice);
		  
		  model.addAttribute("currentPoint", currentPoint);
		  model.addAttribute("addPoint", addPoint);
		 
		return "/product/order/order_form";
	}

	// 주문서 작성완료시 > 주문완료 페이지
	@PostMapping("order.do")
	public String order(
			@RequestParam(name = "IMPCode", required = false) long IMPCode,
			
			@RequestParam(name = "p_id") String[] productIds,
			@RequestParam(name = "c_id", required = false) String[] cartIds,
			@RequestParam(name = "amount") String[] amounts,
			@RequestParam(name = "option_name", defaultValue = "") String[] options,
			
			@RequestParam(name = "price") int price, @RequestParam(name = "deliverCost") int deliverCost,
			@RequestParam(name = "totalPrice") int totalPrice, @RequestParam(name = "method") String method,
			@RequestParam(name = "username") String username, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "address1") String address1, @RequestParam(name = "address2") String address2,
			@RequestParam(name = "tel") String tel, @RequestParam(name = "addPoint") int addPoint,
			@RequestParam(name = "usedPoint") int usedPoint,

			HttpSession session, Model model) {
		
		if (options.length == 0) {
			 options = new String[]{""};
		}
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 주문 아이템 배열 생성
		int len = productIds.length;
		int[] orderItemIds = new int[len];

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		for (int i = 0; i < productIds.length; i++) {

			Map<String, Object> map = new HashMap<>();
			map.put("o_name", options[i]);
			map.put("p_id", productIds[i]);
			map.put("amount", amounts[i]);
			map.put("orderstatus", "결제완료");
			map.put("orderid", IMPCode);
			orderDAO.orderItemInsert(map);

			// 주문 아이템 테이블의 primary key값을 배열로 담아 가져오기
			int idx = orderDAO.getId();
			orderItemIds[i] = idx;
		}

		// 포인트 계산
		Map<String, Object> pointinfo = new HashMap<>();
		int newPoint = addPoint - usedPoint;
		if (newPoint < 0) {
			newPoint = 0;
		}
		pointinfo.put("point", newPoint);
		pointinfo.put("userid", userid);
		orderDAO.pointUpdate(pointinfo);

		// 총합계 계산
		totalPrice = totalPrice - usedPoint;
		
		if (totalPrice < 0) {
			totalPrice = 0;
		}
		
		// 적립된 포인트 불러오기
		int userPoint = orderDAO.showPoint(userid);
		
		// 주문 테이블과 주문 아이템 테이블 출력하기
		List<Map<String, Object>> orderitems = new ArrayList<>();

		// 주문 아이템 기본키 값을 토대로 상품정보 출력하기
		for (int itemId : orderItemIds) {
			
			// 주문 아이템 테이블에서 p_id, amount, 주문상태 꺼내오기
			int p_id = (int) orderDAO.orderItems(itemId).get("p_id");
			int amount = (int) orderDAO.orderItems(itemId).get("amount");
			String orderStatus = (String) orderDAO.orderItems(itemId).get("orderStatus");
			String o_name = (String) orderDAO.orderItems(itemId).get("o_name");
			
			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String file_name = (String) orderDAO.orderedProducts(p_id).get("file_name");
			//System.out.println("원본="+file_name);
			String split_str = "src/main/webapp";
			String[] parts = file_name.split(split_str);
			if (parts.length > 1) {
			    file_name = "/" + (parts[1].startsWith("/") ? parts[1].substring(1) : parts[1]);
			} else {
			    file_name = parts[0];
			}
			//System.out.println("replace="+file_name);
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");

			
			
			//옵션 있을 경우
			if (!o_name.equals("없음") && !o_name.equals("")) {
				
				//주문시 상품테이블에서 수량 감소
				int PAmount = 0;
				int PItemAmount = 0;
				
				Map<String, Object> amountInfo = new HashMap<>();
				
				amountInfo.put("p_id", p_id);
				amountInfo.put("o_name", o_name);
				amountInfo.put("orderItemId", itemId);
				
				PAmount = orderDAO.pAmount(amountInfo);
				PItemAmount = orderDAO.pItemAmount(amountInfo);
				
				PItemAmount -= amount;
				PAmount -= amount;
				
				if (PItemAmount <= 0) {
					PItemAmount = 0;
				}
				if (PAmount <= 0) {
					PAmount = 0;
				}

				amountInfo.put("PItemAmount", PItemAmount);
				amountInfo.put("PAmount", PAmount);
				
				orderDAO.pItemUpdateAmount(amountInfo);
				orderDAO.pUpdateAmount(amountInfo);
				
			} else { //옵션 없을 경우
				
				//주문시 상품테이블에서 수량 감소
				int PAmount = 0;
				
				Map<String, Object> amountInfo = new HashMap<>();
				
				amountInfo.put("p_id", p_id);
				amountInfo.put("p_stock", amount);
				
				PAmount = orderDAO.p_no_option_amount(p_id);
				
				PAmount -= amount;
				
				if (PAmount <= 0) {
					PAmount = 0;
				}

				amountInfo.put("PAmount", PAmount);
				
				orderDAO.p_no_o_amount_update(amountInfo);
			}
			
			
			//판매수량 업데이트
			orderDAO.p_sell_update(p_id);
			
			// 정보를 map으로 합친 후 orderitems 리스트에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", p_id);
			map.put("file_name", file_name);
			map.put("p_price", p_price);
			map.put("amount", amount);
			map.put("o_name", o_name);
			map.put("p_id", p_id);
			map.put("orderStatus", orderStatus);
			map.put("p_name", p_name);

			orderitems.add(map);
		}

		// 주문 테이블 출력하기
		// 주문 아이템 id 배열을 json 문자열 배열로 만들기
//		ObjectMapper mapper = new ObjectMapper();
//		String itemIds_JSON = null;
//		int[] itemIdsArray = null;
//
//		try {
//			itemIds_JSON = mapper.writeValueAsString(orderItemIds);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		//orderItemId 사용안할경우
//		itemIds_JSON = null;
		
		// dto로 전달
		OrderDTO dto = new OrderDTO();

		dto.setOrderid(IMPCode);
		dto.setUserid(userid);
//		dto.setOrderItemId(0); // json 배열 값 넣기

		dto.setPrice(price);
		dto.setDeliverCost(deliverCost);
		dto.setTotalPrice(totalPrice);
		dto.setMethod(method);

		dto.setUsername(username);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setTel(tel);
		dto.setUserPoint(addPoint);

		// 데이터 삽입
		orderDAO.orderInsert(dto);

		// 데이터 불러오기
		long idx = orderDAO.getOrderId(); // 추가된 데이터의 기본키 값 가져오기
		
		OrderDTO order = orderDAO.orderSelect(idx);

		// 데이터 전달
		model.addAttribute("order", order); // 주문 테이블
		model.addAttribute("orderitems", orderitems); // 주문 아이템 테이블
		model.addAttribute("userPoint", userPoint); // 보유한 포인트
		model.addAttribute("usedPoint", usedPoint); // 사용한 포인트
		
		
		// 주문확인된 제품 cart에서 지우기
		if (cartIds != null && cartIds.length > 0 && cartIds[0] != null && !cartIds[0].equals("")) {
			for (String c_id : cartIds) {
				int id = Integer.parseInt(c_id.trim());
				orderDAO.cartDelete(id);
			}
		} 

		return "/product/order/order_result";
	}

	// 주문 목록
	@GetMapping("orderlist.do")
	public String orderlist(
			@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@RequestParam(name = "f_date", defaultValue = "") String  f_date,
			@RequestParam(name = "l_date", defaultValue = "") String l_date,
			@RequestParam(name = "status", defaultValue = "") String status,
			HttpSession session, Model model
			) {
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");
		
		
		// 주문목록 가져오기
		List<OrderDTO> list = null;
		
		String fDate = "";
		String lDate = "";
		
		//날짜 설정
		if (!f_date.equals("") && !l_date.equals("")) {
			fDate = f_date.toString() + " 00:00:00";
			lDate = l_date.toString() + " 23:59:59";
		}
		
		//주문 목록에 조건 추가
		Map<String, Object> listInfo = new HashMap<>();
		listInfo.put("userid", userid);
		listInfo.put("startDate", fDate);
		listInfo.put("endDate", lDate);
		listInfo.put("status", status);
		
		//주문 수 세기
		int count = orderDAO.orderCount(listInfo);
		
		//페이지 계산
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;
		
		listInfo.put("start", start);
		listInfo.put("pageCnt", pageCnt);
		
		//목록 출력
		list = orderDAO.orderList(listInfo);
		//중복 없는 주문 id 가져오기
		Set<Long> getIds = new HashSet<>();
		
		//주문 상태 세기
		Map<String, Object> s = new HashMap<>();
		s.put("userid", userid);
		s.put("startDate", fDate);
		s.put("endDate", lDate);
		
		int [] statusArray = new int[5];
		
		for (int i=0; i<5; i++) {
			s.put("status", i+1);
			int num = orderDAO.countStatus(s);
			statusArray[i] = num;
		}

		//상품정보 가져오기
		List<Map<String, Object>> orderitemlist = new ArrayList<>();

		for (OrderDTO item : list) {
			int p_id = item.getP_id();

			Map<String, Object> order = new HashMap<>();

			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String file_name = (String) orderDAO.orderedProducts(p_id).get("file_name");
			//System.out.println("원본="+file_name);
			String split_str = "src/main/webapp";
			String[] parts = file_name.split(split_str);
			if (parts.length > 1) {
			    file_name = "/" + (parts[1].startsWith("/") ? parts[1].substring(1) : parts[1]);
			} else {
			    file_name = parts[0];
			}
			//System.out.println("replace="+file_name);
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");

			
			// 정보를 map으로 합친 후 orderitems 리스트에 넣기
			Map<String, Object> map = new HashMap<>();
			
			map.put("idx", item.getOrderItemId());
			map.put("orderDate", item.getOrderDate());
			map.put("p_id", p_id);
			map.put("file_name", file_name);
			map.put("p_price", p_price);
			map.put("amount", item.getAmount());
			map.put("o_name", item.getO_name());
			map.put("orderStatus", item.getOrderStatus());
			map.put("p_name", p_name);

			order.put("orderid", item.getOrderid());
			order.put("totalPrice", item.getTotalPrice());
			order.put("map", map);
			
			//중복제거된 id전달
			getIds.add(item.getOrderid());
			
			orderitemlist.add(order);
		}

		// 데이터 보내기
		model.addAttribute("page_info", page_info);
		model.addAttribute("order", orderitemlist);
		model.addAttribute("list", list); // 모델에 배열 추가
		model.addAttribute("getIds", getIds);
		model.addAttribute("count", count);
		
		//날짜 보내기
		model.addAttribute("f_date", fDate.toString());
		model.addAttribute("l_date", lDate.toString());
		
		//주문상태
		model.addAttribute("statusArray", statusArray);

		return "/product/order/ordered_list";
	}

	// 주문자 정보 불러오기
	@ResponseBody
	@GetMapping("memberInfo.do")
	public Map<String, Object> memberInfo(@RequestParam(name = "userid") String userid, HttpSession session) {
		Map<String, Object> map = orderDAO.memberInfo(userid);
		return map;
	}
	
	//반품요청취소
	@ResponseBody
	@PostMapping("status_redo.do")
	public String status_redo(
			@RequestBody Map<String, Object> redoinfo
			) {
		int itemid = Integer.parseInt(redoinfo.get("itemid").toString());
		
		//주문상태 업데이트
		Map<String, Object> status = new HashMap<>();
		status.put("itemid", itemid);
		status.put("status", 3);
		orderDAO.updateStatus(status);
		
		String result = "success";
		return result;
	}
	
	//반품요청
	@ResponseBody
	@PostMapping("refund_request.do")
	public String refund_request(
			@RequestBody Map<String, Object> refundinfo
	) {
		long orderid = Long.parseLong(refundinfo.get("orderid").toString());
		int itemid = Integer.parseInt(refundinfo.get("itemid").toString());
		String reason = refundinfo.get("reason").toString();
		
		//주문상태 업데이트
		Map<String, Object> status = new HashMap<>();
		status.put("itemid", itemid);
		status.put("status", 4);
		orderDAO.updateStatus(status);
		
		Map<String, Object> map = new HashMap<>();
		map.put("orderid", orderid);
		map.put("reason", reason);
		
		orderDAO.cancelReason(map);
		
		String result = "success";
		return result;
	}
	
	//주문 취소
	@ResponseBody
	@PostMapping("delete_order.do")
	public String delete_order(
			@RequestBody Map<String, Object> payinfo
	) throws IOException {
		
		long orderid = Long.parseLong(payinfo.get("orderid").toString());
        int itemid = Integer.parseInt(payinfo.get("itemid").toString());
		int delprice = Integer.parseInt(payinfo.get("delPrice").toString());
        String reason = payinfo.get("reason").toString();
        
        Map<String, Object> costs = orderDAO.chooseCosts(orderid);
        
        int totalPrice = (int) costs.get("totalPrice");
        int deliverCost = (int) costs.get("deliverCost");
        
        //총 금액에서 환불할 금액 제외
        int updatePrice = totalPrice - deliverCost - delprice;
        if (updatePrice < 0) {
			updatePrice = 0;
		}
		
		int updateTotalPrice = totalPrice - delprice;
		if (updateTotalPrice < 0) {
			updateTotalPrice = 0;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("orderid", orderid);
		map.put("price", updatePrice);
		map.put("totalPrice", updateTotalPrice);
		
		//주문상태 업데이트
		Map<String, Object> status = new HashMap<>();
		status.put("itemid", itemid);
		
		if (payinfo.get("confirm") != null) {
        	status.put("status", 6);
        	orderDAO.updateStatus(status);
        } else {
        	status.put("status", 5);
        	orderDAO.updateStatus(status);
        }
		
		//주문내역서에서 금액 업데이트
		orderDAO.updatePrice(map);
		
		//포트원 환불
		String token = Refund.getToken(KEY, SECRET); 
		Refund.refundRequest(token, orderid, reason, delprice);
		
		String result = "success";
		return result;
	}
	
	
	
}
