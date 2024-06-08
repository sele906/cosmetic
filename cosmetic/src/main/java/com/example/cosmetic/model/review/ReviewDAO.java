package com.example.cosmetic.model.review;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.example.cosmetic.util.UploadFileUtils;

@Repository
public class ReviewDAO {

	String upload_path="src/main/webapp/resources/admin/img";
	
	@Autowired
	SqlSession sqlSession;
	
	// 리뷰 리스트
	public List<ReviewDTO> review_list(int p_id) {
		return sqlSession.selectList("review.review_list",p_id);
	}

	
	// 리뷰 등록
	public void review_insert(ReviewDTO dto) {
		sqlSession.insert("review.review_insert", dto);
	}
	
	// 리뷰 삭제
	public void review_delete(int r_id) {
		sqlSession.delete("review.review_delete", r_id);
	}
	
	// 리뷰 수정
	public void review_update(ReviewDTO dto){
		sqlSession.update("review.review_update",dto);
	}
	
	
	
	// 첨부파일
	public List<String> list_attach(int r_id) {
		return sqlSession.selectList("review.list_attach", r_id);
	}
	
	public void insert_attach(@Param("filenames") String[] filenames, @Param("userid") String userid, @Param("r_id") int r_id) {
	    
		
		
		Map<String, Object> map = new HashMap<>();

//	    String[] arr = new String[filenames.length];
//	    for (int i = 0; i < filenames.length; i++) {
//	        int underscoreIndex = filenames[i].lastIndexOf("_");
//	        if (underscoreIndex != -1) {
//	            arr[i] = filenames[i].substring(underscoreIndex + 1);
//	        } else {
//	            arr[i] = filenames[i];  
//	        }
//	    }

		if (filenames != null) {
			map.put("filenames", filenames);
		} else {
			map.put("filenames", "");
		}
	    
	    map.put("userid", userid);
	    map.put("r_id", r_id);
	    sqlSession.insert("review.insert_attach", map);
	}

	
	public void update_attach(String file_name,int r_id){
		Map<String,Object> map=new HashMap<>();
		map.put("file_name",file_name);
		map.put("r_id",r_id);
		sqlSession.insert("review.update_attach",map);
	}
	
	public void delete_attach(String file_name){
		sqlSession.delete("review.delete_attach",file_name);
	}
	
	public int r_id() {
		return sqlSession.selectOne("review.r_id");
	}
	
	public List<Map<String, Object>> list(String userid, int pageCnt, int start) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pageCnt", pageCnt);
		map.put("start", start);
		List<Map<String, Object>> list = sqlSession.selectList("review.r_list", map);
		return list;
	}
	
	public int list_count(String userid) {
		return sqlSession.selectOne("review.r_list_count", userid);
	}
	
	public void r_delete(int r_id) {
		sqlSession.delete("review.r_delete", r_id);
	}
	
	public List<String> r_list_img(int r_id) {
		return sqlSession.selectList("review.r_list_img", r_id);
	}
}
