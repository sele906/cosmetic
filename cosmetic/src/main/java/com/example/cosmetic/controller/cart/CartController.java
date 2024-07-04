package com.example.cosmetic.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.cart.CartDAO;
import com.example.cosmetic.model.cart.CartDTO;
import com.example.cosmetic.model.member.MemberDAO;

import jakarta.servlet.http.HttpSession;
 
@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	CartDAO cartDao;
	@Autowired
	MemberDAO memberDao;

	// 장바구니에서 상품 하나 삭제
	@GetMapping("delete/{c_id}")
	public String delete(@PathVariable(name = "c_id") int c_id) {
		cartDao.delete(c_id);
		return "redirect:/cart/list";
	}

	// 장바구니 선택 상품 삭제
	@ResponseBody
	@PostMapping("select_delete")
	public String select_delete(@RequestParam("nums") String[] nums) {
		if (nums != null && nums.length > 0) {
			for (String num : nums) {
				cartDao.delete(Integer.parseInt(num));
			}
			return "삭제되었습니다"; // 또는 다른 성공 메시지
		} else {
			return "선택된 상품이 없습니다"; // 선택된 상품이 없는 경우에 대한 메시지
		}
	}

	// 장바구니 상품 전체 삭제
	@GetMapping("deleteAll")
	public String deleteAll(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			cartDao.delete_all(userid);
		}
		return "redirect:/cart/list";
	}

	// 수량 변경
	@PostMapping("amount_update")
	public String amount_update(@RequestParam(name = "amount") int amount, @RequestParam(name = "c_id") int c_id,
			HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		CartDTO dto = new CartDTO();
		dto.setUserid(userid);
		dto.setC_id(c_id);
		dto.setAmount(amount);
		;
		cartDao.amount_update(dto);
		return "redirect:/cart/list";
	}

	// 옵션 변경
	@ResponseBody
	@PostMapping("o_name_update")
	public Map<String, String> o_name_update(HttpSession session, @RequestBody Map<String, String> requestData) {
		String o_name = requestData.get("o_name");
		int c_id = Integer.parseInt(requestData.get("c_id"));
		String userid = (String) session.getAttribute("userid");
		CartDTO dto = new CartDTO();
		dto.setUserid(userid);
		dto.setC_id(c_id);
		dto.setO_name(o_name);
		int quantity = cartDao.amount(c_id);

		// 기존 장바구니에 해당 옵션이 존재하는지 확인
		List<CartDTO> existingCartItems = cartDao.exist_cart(dto);

		boolean exists = false;

		for (CartDTO cart : existingCartItems) {
			if (cart.getO_name().equals(o_name)) {
				int newAmount = cart.getAmount() + quantity; // 기존 수량에 추가할 수량을 더함
				cart.setAmount(newAmount); // 수량을 업데이트
				cartDao.delete(c_id);
				cartDao.exist_amount_update(existingCartItems); // 업데이트된 장바구니 정보를 DB에 반영
				exists = true;
				break;
			}
		}
		if (!exists) {
			cartDao.o_name_update(dto);
		}
		Map<String, String> response = new HashMap<>();
		response.put("status", "success");
		return response;
	}

	// 장바구니 리스트
	@GetMapping("list")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			List<CartDTO> list = cartDao.list_cart(userid);
			int sumMoney = cartDao.sum_money(userid);
			int fee = sumMoney >= 30000 ? 0 : 2500;
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney + fee);
			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("product/cart");
			mav.addObject("map", map);
			return mav;
		} else {
			return new ModelAndView("/member/page_login");
		}
	}

	@PostMapping("insert")
	@ResponseBody
	public String insert(@RequestBody Map<String, Object> requestMap, HttpSession session) {
		String userid = (String) session.getAttribute("userid");

		if (userid == null) {
			return "null";
		}
		int p_id = (int) requestMap.get("p_id");

		List<Map<String, Object>> selectedOptions = (List<Map<String, Object>>) requestMap.get("options");
		System.out.println(selectedOptions);

		for (Map<String, Object> option : selectedOptions) {
			System.out.println(option);
			String optionName = (String) option.get("o_name");

			// 옵션이 null인 경우 처리
			if (optionName == null || optionName.equals("")) {
				optionName = "없음";
			}

			//int money = (int) option.get("p_price");
			int quantity = (int) option.get("amount");

			CartDTO dto = new CartDTO();
			dto.setP_id(p_id);
			dto.setO_name(optionName);
			dto.setAmount(quantity);
			dto.setUserid(userid);

			List<CartDTO> existCartList = cartDao.exist_cart(dto);
			boolean exists = false;

			for (CartDTO cart : existCartList) {
				if (cart.getO_name().equals(optionName) && cart.getP_id() == p_id) {
					int newAmount = cart.getAmount() + quantity; // 기존 수량에 추가할 수량을 더함

					cart.setAmount(newAmount); // 수량을 업데이트
					cartDao.exist_amount_update(existCartList); // 업데이트된 장바구니 정보를 DB에 반영
					exists = true;
					break;
				}
			}
			if (!exists) {
				cartDao.insert(dto); // 장바구니에 존재하지 않으면 새로 추가
			}
		}
		return "success";
	}

}
