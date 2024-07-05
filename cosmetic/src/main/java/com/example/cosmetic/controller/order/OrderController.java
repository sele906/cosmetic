package com.example.cosmetic.controller.order;

import java.awt.*;
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

	//포트원 api 키
	private static final String KEY = "6746882717766507";
	private static final String SECRET = "wwGfcjpUcw74nxulMRj9ZKMeT3h8tZtiytjDoc9XDjlhrXUyrB9vvY7vDalSFvrT5ciMw5REpV0IZlGK";
	
	@Autowired
	OrderDAO orderDAO;
	
	// 장바구니 주문하기 > 주문서 작성페이지
	@PostMapping("orderform.do")
	public String orderform(
			@RequestParam(name = "cartid", required = false) String[] cIds,
			@RequestParam(name = "optiontxt", defaultValue = "") String[] options,
			@RequestParam(name = "pOrderId") String[] productIds,
			@RequestParam(name = "amount") String[] amounts,
			@RequestParam(name = "price") int price, 
			@RequestParam(name = "delfee") int delfee,
			@RequestParam(name = "totalPrice") int totalPrice, 
			HttpSession session, Model model) {
		
		for (int i = 0; i < options.length; i++) {
            if (options[i].equals("없음")) { // 옵션이 있는지 확인
                options[i] = ""; // 옵션 배열 값을 빈 문자열로 변경
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

			int pid = Integer.parseInt(productIds[i]);
			int amount = Integer.parseInt(amounts[i]);
			int cid = Integer.parseInt(cIds[i]);
			String option = options[i];

			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String pName = (String) orderDAO.orderedProducts(pid).get("p_name");
			String filePath = (String) orderDAO.orderedProducts(pid).get("file_name");
			String fileName = filePath.replace("src/main/webapp", "");
			int pPrice = (int) orderDAO.orderedProducts(pid).get("p_price");

			// 정보를 map으로 합치기
			Map<String, Object> map = new HashMap<>();
			map.put("pid", pid);
			map.put("cid", cid);
			map.put("option", option);
			map.put("fileName", fileName);
			map.put("pPrice", pPrice);
			map.put("amount", amount);
			map.put("pName", pName);
			list.add(map); //개별 상품 정보를 리스트에 넣기
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

	// 개별 주문 > 주문서 작성페이지
	@PostMapping("orderform_item.do")
	public String orderform_item(
			@RequestParam(name = "option", defaultValue = "") String[] options,
			@RequestParam(name = "cartid", required = false) String[] cartids,
			@RequestParam(name = "pOrderId") String[] pOrderIds,
			@RequestParam(name = "amount") String[] amounts,

			@RequestParam(name = "pOPrice") int price,
			@RequestParam(name = "delfee") int delfee,
			@RequestParam(name = "totalPrice") int totalPrice,
			HttpSession session, Model model) {

		//상품 옵션 처리
		if (options.length == 0) { //바로구매 > 주문페이지
			options = new String[]{""}; //빈 옵션 배열 생성
		} else {
			for (int i = 0; i < options.length; i++) { //장바구니 개별구매 > 주문페이지
				if (options[i].equals("없음")) { // 옵션이 있는지 확인
					options[i] = ""; // 옵션 배열 값을 빈 문자열로 변경
				}
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
		
		for (int i=0; i<amounts.length; i++) {
			int pid = Integer.parseInt(pOrderIds[i]);
			int amount = Integer.parseInt(amounts[i]);
			String option = options[i];
			
			//p_id값으로 상품정보 가져오기 //이미지, 상품명, 상품가격 
			String pName = (String) orderDAO.orderedProducts(pid).get("p_name");
			String filePath = (String) orderDAO.orderedProducts(pid).get("file_name");
			String fileName = filePath.replace("src/main/webapp", "");
			int pPrice = (int) orderDAO.orderedProducts(pid).get("p_price");
			  
			//정보를 map으로 합치기
			Map<String, Object> map = new HashMap<>();
			map.put("pid", pid);
			map.put("amount", amount);
			map.put("option", option);
			map.put("pName", pName);
			map.put("fileName", fileName);
			map.put("pPrice", pPrice);
			  
			if (cartids != null) {
				int cid = Integer.parseInt(cartids[i]);
				map.put("cid", cid);
			}
			  
			list.add(map);
		}
		  
		//포인트
		int currentPoint = orderDAO.showPoint(userid); //보유한 포인트
		int addPoint = (int) Math.round(price * 0.01); //포인트 비율 설정

		//다음페이지로 전달
		//주문 정보 표현
		model.addAttribute("list", list);
		model.addAttribute("options", options);

		//결제시 합계금액 및 포인트 전달
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
			
			@RequestParam(name = "pid") String[] productIds,
			@RequestParam(name = "cid", required = false) String[] cartIds,
			@RequestParam(name = "amount") String[] amounts,
			@RequestParam(name = "optionName", defaultValue = "") String[] options,
			
			@RequestParam(name = "price") int price, 
			@RequestParam(name = "deliverCost") int deliverCost,
			@RequestParam(name = "totalPrice") int totalPrice, 
			@RequestParam(name = "method") String method,
			@RequestParam(name = "username") String username, 
			@RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "address1") String address1, 
			@RequestParam(name = "address2") String address2,
			@RequestParam(name = "tel") String tel, 
			@RequestParam(name = "addPoint") int addPoint,
			@RequestParam(name = "usedPoint") int usedPoint,

			HttpSession session, Model model) {
		
		//옵션 없을경우 빈 배열 생성
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
			map.put("oName", options[i]);
			map.put("pid", productIds[i]);
			map.put("amount", amounts[i]);
			map.put("orderstatus", "결제완료");
			map.put("orderid", IMPCode);
			
			orderDAO.orderItemInsert(map); //주문 아이템 테이블에 insert

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
		pointinfo.put("npoint", newPoint);
		pointinfo.put("userid", userid);
		orderDAO.pointUpdate(pointinfo); //주문테이블에 포인트 업데이트

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
			int pid = (int) orderDAO.orderItems(itemId).get("p_id");
			int amount = (int) orderDAO.orderItems(itemId).get("amount");
			String orderStatus = (String) orderDAO.orderItems(itemId).get("orderStatus");
			String oname = (String) orderDAO.orderItems(itemId).get("o_name");
			
			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String pName = (String) orderDAO.orderedProducts(pid).get("p_name");
			String filePath = (String) orderDAO.orderedProducts(pid).get("file_name");
			String fileName = filePath.replace("src/main/webapp", "");
			int pPrice = (int) orderDAO.orderedProducts(pid).get("p_price");

			//상품 테이블에서 수량 감소
			//옵션 있을 경우
			if (oname != null && !oname.equals("없음") && !oname.equals("")) {

				int PAmount = 0;
				int PItemAmount = 0;
				
				Map<String, Object> amountInfo = new HashMap<>();
				
				amountInfo.put("pid", pid);
				amountInfo.put("oName", oname);
				amountInfo.put("orderItemId", itemId);

				//수량 가져오기
				PAmount = orderDAO.pAmount(amountInfo);
				PItemAmount = orderDAO.pItemAmount(amountInfo);

				//수량 감소
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

				//상품 및 옵션 테이블에 수량 입력
				orderDAO.pItemUpdateAmount(amountInfo);
				orderDAO.pUpdateAmount(amountInfo);
				
			} else { //옵션 없을 경우

				int PAmount = 0;
				
				Map<String, Object> amountInfo = new HashMap<>();
				
				amountInfo.put("p_id", pid);
				amountInfo.put("p_stock", amount);

				//수량 가져오기
				PAmount = orderDAO.pNoOptionAmount(pid);
				
				PAmount -= amount;
				
				if (PAmount <= 0) {
					PAmount = 0;
				}

				amountInfo.put("PAmount", PAmount);

				//상품 테이블에 수량 입력
				orderDAO.pNoOptionAmountUpdate(amountInfo);
			}
			
			//판매수량 업데이트
			orderDAO.pSellUpdate(pid);

			//결과 페이지에서 출력할 데이터
			// 정보를 map으로 합친 후 orderitems 리스트에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("pid", pid);
			map.put("fileName", fileName);
			map.put("pPrice", pPrice);
			map.put("amount", amount);
			map.put("oName", oname);
			map.put("orderStatus", orderStatus);
			map.put("pName", pName);

			orderitems.add(map);
		}

		// 주문확인된 제품 cart에서 지우기
		if (cartIds != null && cartIds.length > 0 && cartIds[0] != null && !cartIds[0].equals("")) {
			for (String cid : cartIds) {
				int id = Integer.parseInt(cid.trim());
				orderDAO.cartDelete(id);
			}
		}

		// dto로 전달
		OrderDTO dto = new OrderDTO();

		dto.setOrderid(IMPCode);
		dto.setUserid(userid);

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

		// 주문 테이블에 데이터 삽입
		orderDAO.orderInsert(dto);

		// 데이터 불러오기
		long idx = orderDAO.getOrderId(); // 추가된 데이터의 기본키 값 가져오기
		OrderDTO order = orderDAO.orderSelect(idx); //주문정보 가져오기

		// 데이터 전달
		model.addAttribute("order", order); // 주문 정보
		model.addAttribute("orderitems", orderitems); // 주문 아이템 정보
		model.addAttribute("userPoint", userPoint); // 보유한 포인트
		model.addAttribute("usedPoint", usedPoint); // 사용한 포인트
		
		return "/product/order/order_result";
	}

	// 주문 목록
	@GetMapping("orderlist.do")
	public String orderlist(
			@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@RequestParam(name = "f_date", defaultValue = "") String  Fdate,
			@RequestParam(name = "l_date", defaultValue = "") String Ldate,
			@RequestParam(name = "status", defaultValue = "") String status,
			HttpSession session, Model model
			) {
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");
		
		// 주문목록 가져오기
		List<Map<String, Object>> list = null;
		
		String fDate = "";
		String lDate = "";
		
		//날짜 설정
		if (!Fdate.equals("") && !Ldate.equals("")) {
			fDate = Fdate.toString() + " 00:00:00";
			lDate = Ldate.toString() + " 23:59:59";
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
		PageUtil pageInfo = new PageUtil(count, curPage);
		int start = pageInfo.getPageBegin() - 1;
		int pageCnt = pageInfo.PAGE_SCALE;
		
		listInfo.put("start", start);
		listInfo.put("pageCnt", pageCnt);
		
		//목록 출력
		list = orderDAO.orderList(listInfo);
		
		//주문 상태 세기
		Map<String, Object> Scount = new HashMap<>();
		Scount.put("userid", userid);
		Scount.put("startDate", fDate);
		Scount.put("endDate", lDate);
		
		int [] statusArray = new int[5];
		
		for (int i=0; i<5; i++) {
			Scount.put("status", i+1);
			int num = orderDAO.countStatus(Scount);
			statusArray[i] = num;
		}

		// 데이터 보내기
		model.addAttribute("list", list);
		model.addAttribute("page_info", pageInfo);
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
		status.put("status", 3); //반품요청 > 결제완료로 변경
		orderDAO.updateStatus(status);

        return "success";
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
		
		Map<String, Object> map = new HashMap<>();
		map.put("orderid", orderid);
		map.put("reason", reason);
		orderDAO.cancelReason(map); //반품 사유 주문 테이블에 넣기

        //주문상태 업데이트
        Map<String, Object> status = new HashMap<>();
        status.put("itemid", itemid);
        status.put("status", 4); //결제 완료 > 반풍요청
        orderDAO.updateStatus(status);
		
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
        
        Map<String, Object> costs = orderDAO.chooseCosts(orderid); //주문 테이블에서 총 합계와 배송비 가져오기
		int price = (int) costs.get("price");
        int totalPrice = (int) costs.get("totalPrice");
        int deliverCost = (int) costs.get("deliverCost");
        
        //환불할 금액 제외
        int updatePrice = price - delprice;
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
		
		if (payinfo.get("confirm") != null) { // 결제취소시
        	status.put("status", 6);
        	orderDAO.updateStatus(status);
        } else { // 반품요청 > 관리자 > 반품완료
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
