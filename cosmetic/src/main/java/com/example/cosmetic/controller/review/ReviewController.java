package com.example.cosmetic.controller.review;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.cosmetic.model.review.PageUtil;
import com.example.cosmetic.model.review.ReviewDAO;
import com.example.cosmetic.model.review.ReviewDTO;
import com.example.cosmetic.model.review.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	private static final Logger log = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("index.do")
	public String index(
				@RequestParam(name = "curPage", defaultValue = "1") int curPage,
				HttpSession session,
				Model model
			) {
		
		String userid = (String) session.getAttribute("userid");
		
		List<Map<String, Object>> list = null;
		
		// 페이지
		int count = reviewService.list_count(userid);

		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;

		list = reviewService.r_list(userid, pageCnt, start);
		
		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count);
		
		return "/review/index";
	}
	
	@ResponseBody
	@GetMapping("get_img/{r_id}")
	public List<String> get_img(@PathVariable(name = "r_id") int r_id) {
		List<String> path = reviewService.r_list_img(r_id);
		return path;
	}
	
	
	
	//리뷰 리스트
		 @GetMapping("list")
		 @ResponseBody
		 public List<ReviewDTO> list(@RequestParam(name="p_id", required=true) int p_id) {
			 //System.out.println("Received p_id: " + p_id);
		     List<ReviewDTO> list = reviewService.list(p_id);
		     //System.out.println(list);
		     return list;
		    }
		 
		 
		 @PostMapping("insert")
		 public String writeReview(
				 @RequestParam(name = "rate") int rate,
				 @RequestParam(name="p_id")int p_id,
				 ReviewDTO dto,
				 @RequestParam(name="file", required = false) String[] file,
				 HttpSession session) {

		     // 세션에서 사용자 ID 가져오기
		     String userid = (String) session.getAttribute("userid");
		     if (userid == null) {
		         // 사용자 ID가 세션에 없는 경우 예외 처리
		         // 여기서는 간단히 로그인 페이지로 리다이렉트하도록 설정합니다.
		         return "redirect:/member/page_login";
		     }
		     dto.setP_id(p_id);
		     dto.setUserid(userid);
		     dto.setR_rate(rate);
		     //System.out.println("아이디"+userid);
		     //System.out.println("디티오"+dto);
		     reviewService.insertReview(dto,file);

		     // 리뷰 등록 후 리다이렉트할 페이지 설정
		     return "redirect:/product/detail/" + p_id;
		 }

		 
//		 @PostMapping("/write/{p_id}")
//		 public String writeReview(
//		         @PathVariable(name="p_id", required=true) int p_id,
//		         @RequestParam(name="r_contents") String r_contents,
//		         HttpSession session) {
//
//		     // 세션에서 사용자 ID 가져오기
//		     String userid = (String) session.getAttribute("userid");
//		     if (userid == null) {
//		         // 사용자 ID가 세션에 없는 경우 예외 처리
//		         // 여기서는 간단히 로그인 페이지로 리다이렉트하도록 설정합니다.
//		         return "redirect:/login";
//		     }
//
//		     // 디버깅을 위한 로그 출력
//		     log.info("Product ID: {}", p_id);
//
//		     // 이미지와 제목, 내용을 서비스에 전달하여 리뷰 등록
//		     reviewService.insertReview(p_id, userid, r_contents);
//
//		     // 리뷰 등록 후 리다이렉트할 페이지 설정
//		     return "redirect:/product/detail/" + p_id;
//		 }
		 
		 @GetMapping("list_attach/{r_id}")
		 @ResponseBody
		 public List<String> list_attach(@PathVariable(name="r_id") int r_id) {
			 return reviewService.list_attach(r_id);
		 }
		 
		 @GetMapping("review_delete.do")
		 @ResponseBody
		 public String review_delete(@RequestParam(name = "r_id") int r_id) {
			 reviewService.r_delete(r_id);
			 
		 	return "success";
		 }
		 
}
