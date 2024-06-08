package com.example.cosmetic.model.review;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@Service
public class ReviewService {
	
	
	@Autowired 
	ReviewDAO reviewDao;
	
	
	public List<ReviewDTO> list(int p_id) {
		//System.out.println(reviewDao.review_list(p_id));
		return reviewDao.review_list(p_id);
	}
	
	public List<Map<String, Object>> r_list(String userid, int pageCnt, int start) {
		return reviewDao.list(userid, pageCnt, start);
	}
	
	public int list_count(String userid) {
		return reviewDao.list_count(userid);
	}

	

	// 리뷰 등록
	@Transactional
	public void insertReview(ReviewDTO dto,String[] files ) {
	    // 리뷰 정보 저장
	    reviewDao.review_insert(dto);
	
	    //MultipartFile[] files = dto.getFiles();
	    if (files == null) return;

	    for (String file : files) {
	            // 리뷰의 ID를 가져옵니다.
	            int r_id = reviewDao.r_id();
	            
	            // 파일을 저장하는 메서드 호출
	            reviewDao.insert_attach(new String[] { file }, dto.getUserid(), r_id);
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
    
    public List<String> list_attach(int r_id){
    	return reviewDao.list_attach(r_id);
    }

    public void r_delete(int r_id) {
    	reviewDao.r_delete(r_id);
    }
    
    public List<String> r_list_img(int r_id) {
    	return reviewDao.r_list_img(r_id);
	}
    
	
	
}
