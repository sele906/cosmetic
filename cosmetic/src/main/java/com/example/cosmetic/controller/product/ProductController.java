package com.example.cosmetic.controller.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.admin.AdminDao;
import com.example.cosmetic.model.category.CategoryDTO;
import com.example.cosmetic.model.product.PageUtil;
import com.example.cosmetic.model.product.ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductDAO productDao;

	@Autowired
	AdminDao adminDao;

	// 카테고리별 리스트
	@GetMapping("list.do")
	public String list(@RequestParam(name = "no", required = false) int no, Model model) {
		model.addAttribute("no", no);
		return "product/list";
	}

	@GetMapping("main_view")
	public ModelAndView main_view(
			@RequestParam(name = "ctg_b_no") int ctg_b_no, 
			ModelAndView mav) {
		
		String name = productDao.big_name(ctg_b_no);
		List<CategoryDTO> items = productDao.main_list(ctg_b_no);
		List<Map<String, Object>> hitList = productDao.p_list_hit(ctg_b_no);
		List<Map<String, Object>> sellList = productDao.p_list_sell(ctg_b_no);
		mav.setViewName("product/main_category");
		mav.addObject("items", items);
		mav.addObject("name", name);
		
		mav.addObject("hitList", hitList);
		mav.addObject("sellList", sellList);
		
		return mav;
	}

	// 소분류 카테고리 리스트
	@GetMapping("sub_view.do")
	public String sub(@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@RequestParam(name = "no", required = false) int no,
			@RequestParam(name = "order", required = false, defaultValue = "best") String order, Model model,
			HttpSession session) {

		List<Map<String, Object>> list = null;

		// 카테고리 정보 가져오기
		Map<String, Object> ctg = productDao.get_cate_name(no);
		int ctg_b_no = (int) ctg.get("ctg_b_no");
		List<CategoryDTO> items = productDao.main_list(ctg_b_no);

		// 페이지
		int count = productDao.sub_count(no); // 모든 체품 수

		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;
		String userid = (String) session.getAttribute("userid");

		list = productDao.sub_list(start, pageCnt, no, order, userid);

		model.addAttribute("ctg", ctg);
		model.addAttribute("ctg_items", items);
		model.addAttribute("list", list);

		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count);

		return "product/sub_category";
	}
	
	@GetMapping("/detail/{p_id}")
	public String detail(@PathVariable(name = "p_id") int p_id, Model model, HttpServletRequest request,
			HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		ProductDTO dto = productDao.detail(p_id, userid);
		
		//조회수 +1
		productDao.update_hit(p_id);
		//리뷰 수
		int count_review =  productDao.count_review(p_id);

		// Cookie => 여기서 r_list로 p_id를 쿠키 저장
		Cookie[] cookies = request.getCookies();
		List<ProductDTO> r_list = new ArrayList<ProductDTO>();
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("recent")) {
					String no = cookies[i].getValue();
					ProductDTO r_dto = productDao.detail(Integer.parseInt(no), userid);
					r_list.add(r_dto);
				}
			}
		}
		model.addAttribute("count_review", count_review);
		model.addAttribute("r_list", r_list);
		model.addAttribute("dto", dto);

		return "product/detail";
	}

	// detail로 가기전에 쿠키를 만들어서 p_id와 함께 디테일 화면으로 리다이렉트
	@GetMapping("detail_before")
	public String detail_before(@RequestParam(name = "p_id") int p_id, HttpServletResponse response) {
		// 쿠키의 단점 : 클라이언트(=브라우저)에 저장이 되는데, 문자열만 저장할 수 있다.
		Cookie cookie = new Cookie("recent" + p_id, String.valueOf(p_id));
		cookie.setPath("/"); // root에 저장
		cookie.setMaxAge(60 * 60 * 24); // 저장하는 시간 => 하루동안 저장(24시간)
		response.addCookie(cookie); // 전송!
		return "redirect:/product/detail/" + p_id; // 여기서 디테일 화면으로!
	}

	// 최근 본 상품
	@ResponseBody
	@GetMapping("recent_cookie")
	public List<ProductDTO> recent_cookie(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		Cookie[] cookies = request.getCookies();
		List<ProductDTO> r_list = new ArrayList<>();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().startsWith("recent")) {
					int no = Integer.parseInt(cookie.getValue());
					ProductDTO recent = productDao.detail(no, userid);
					String file_name = recent.getFile_name().replace("src/main/webapp", "");
	                recent.setFile_name(file_name); // 가공된 파일 이름 설정
	                r_list.add(recent);
				}
			}
		}
		return r_list;
	}

	// 최근 본 상품 삭제 (쿠키 한개씩 삭제)
	@ResponseBody
	@GetMapping("cookie_delete")
	public String cookie_delete(@RequestParam(name = "p_id") int p_id, HttpServletRequest request,
			HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		// 지금은 cookies가 null이 아님.
		for (int i = cookies.length - 1; i >= 0; i--) {
			if (cookies[i].getName().equals("recent" + p_id)) {
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0); // 이 MaxAge만 0으로 설정하면 시간이 0이라 바로 삭제됌
				response.addCookie(cookies[i]);
				break;
			}
		}
		return "success";
	}

	// 최근 본 상품 전체 삭제 (쿠키 전체삭제)
	@ResponseBody
	@GetMapping("cookie_all_delete")
	public String cookie_all_delete(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		for (int i = cookies.length - 1; i >= 0; i--) {
			if (cookies[i].getName().startsWith("recent")) {
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		return "success";
	}

	// 디테일화면에서 상품을 선택하세요 누르면 드롭메뉴 뜸, 옵션을 가져옴
	@ResponseBody
	@GetMapping("detail_option/{p_id}")
	public List<ProductDTO> detail_option(@PathVariable(name = "p_id") int p_id) {
		List<ProductDTO> list = productDao.detail_option(p_id);
		// System.out.println(list);
		return list;
	}

	// p_id에 따른 o_name 가지고 오기
	@ResponseBody
	@GetMapping("o_name/{p_id}")
	public List<ProductDTO> get_o_name(@PathVariable(name = "p_id") int p_id) {
		List<ProductDTO> o_name = productDao.get_o_name(p_id);
		return o_name;
	}
	
	@GetMapping("list_p_attach/{p_id}")
	@ResponseBody
	public List<String> list_p_attach(@PathVariable(name = "p_id") int p_id) {
		return productDao.list_p_attach(p_id);
	}

}
