package com.example.cosmetic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.cosmetic.model.product.ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

@Controller
public class MainController {
	
	@Autowired
	ProductDAO productDao;

	@GetMapping("/")
	public String main(Model model) {
		List<ProductDTO> list =productDao.hit_product();
		List<ProductDTO> List =productDao.hit2_product();
		model.addAttribute("list",list);
		model.addAttribute("List",List);
		return "main/main";
	}
	
	
	
}


