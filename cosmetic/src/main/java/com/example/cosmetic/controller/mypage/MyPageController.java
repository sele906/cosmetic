package com.example.cosmetic.controller.mypage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.cosmetic.model.member.MemberDAO;
import com.example.cosmetic.model.mypage.MypageDAO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {
	
	@Autowired
	MypageDAO mypageDao;
	
	@GetMapping("/")
	public String mypage(
			HttpSession session,
			Model model
			) {
		
		String userid = (String) session.getAttribute("userid");
		Map<String, Object> map = mypageDao.get_member_info(userid);
		
		int order_int = mypageDao.orderlist_count(userid);
		int cart_int = mypageDao.cart_count(userid);
		int zzim_int = mypageDao.zzim_count(userid);
		int review_int = mypageDao.review_count(userid);
		
		model.addAttribute("order_int", order_int);
		model.addAttribute("cart_int", cart_int);
		model.addAttribute("zzim_int", zzim_int);
		model.addAttribute("review_int", review_int);
		
		model.addAttribute("map", map);
		
		return "/mypage/index";
	}
	
	@GetMapping("member_edit.do")
	public String member_edit() {
		return "/login/edit";
	}
	
	@GetMapping("member_delete.do")
	public String member_delete() {
		return "/login/delete";
	}
	

}
