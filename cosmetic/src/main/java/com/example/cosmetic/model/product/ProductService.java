package com.example.cosmetic.model.product;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cosmetic.model.admin.AdminDao;


@Service
public class ProductService {
	
	
	@Autowired 
	AdminDao adminDao;
	
	
	/*
	 * public List<ReviewDTO> list(int p_id) {
	 * //System.out.println(reviewDao.review_list(p_id)); return
	 * reviewDao.review_list(p_id); }
	 */
	

	// 상품 등록
	@Transactional
	public void insertProduct(ProductDTO dto, String[] files ) {
		
	    if (files == null) return;

	    for (String file : files) {
	            // 리뷰의 ID를 가져옵니다.
	            int p_id = adminDao.p_id();
	            
	            // 파일을 저장하는 메서드 호출
	            adminDao.insert_p_attach(new String[] { file }, p_id);
	    }	    
	    
	    
//	    MultipartFile[] files = dto.getFiles();
//	    if (files == null) return;
//
//	    for (MultipartFile file : files) {
//	        String file_name = file.getOriginalFilename();
//	        if (file_name != null && !file_name.isEmpty()) {
//	            // 리뷰의 ID를 가져옵니다.
//	            int r_id = reviewDao.r_id();
//	            
//	            // 파일을 저장하는 메서드 호출
//	            reviewDao.insert_attach(new String[] { file_name }, dto.getUserid(), r_id);
//	        }
//	    }
	}
    
	/*
	 * public List<String> list_attach(int r_id){ return
	 * reviewDao.list_attach(r_id); }
	 */
    
    
    
    
	
	
}
