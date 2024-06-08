package com.example.cosmetic.model.zzim;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//찜기능
@Repository
public class ZzimDAO {

   @Autowired
   SqlSession sqlSession;

   // 찜취소하기
   public void zzim_clear(String userid, int p_id) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("userid", userid);
      map.put("p_id", p_id);
      sqlSession.delete("zzim.zzim_clear", map);
   }

   // 찜하기
   public void zzim_apply(String userid, int p_id) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("userid", userid);
      map.put("p_id", p_id);
      sqlSession.insert("zzim.zzim_apply", map);
   }

   // 찜 갯수
   public int zzim_count(int p_id) {
      Map<String, Object> map = new HashMap<>();
      map.put("p_id", p_id);
      return sqlSession.selectOne("zzim.zzim_count", map);
   }
   
   public int check_zzim(String userid, int p_id) {
       HashMap<String, Object> map = new HashMap<>();
       map.put("userid", userid);
       map.put("p_id", p_id);

       int count = sqlSession.selectOne("zzim.check_zzim", map);
       return count;
   }


   // 마이페이지에서 찜리스트 삭제 가능
   public void zzim_delete(int p_id) {
      sqlSession.delete("zzim.zzim_delete", p_id);
   }

   public int zzim_Check(String userid, int p_id) {
      Map<String, Object> map = new HashMap<>();
      map.put("userid", userid);
      map.put("p_id", p_id);
      return sqlSession.selectOne("zzim.zzim_check", map);
   }

   public List<ZzimDTO> zzim_z_id(String userid) {
      List<ZzimDTO> zzimlist = sqlSession.selectList("zzim.zzim_z_id", userid);
   //   System.out.println(zzimlist);
      return zzimlist;
   }
   
   // 소분류에 따른 찜목록
   public List<Map<String, Object>> sub_list_zzim(int no, String userid, String order, int pageCnt, int start) {
       Map<String, Object> paramMap = new HashMap<>();
       paramMap.put("no", no);
       paramMap.put("userid", userid);
       paramMap.put("order", order);
       paramMap.put("pageCnt", pageCnt);
       paramMap.put("start", start);
       return sqlSession.selectList("zzim.sub_list_zzim", paramMap);
   }
   
   public List<Map<String, Object>> zzim_list(int start, int pageCnt, String userid) {

	   Map<String, Object> map = new HashMap<>();
	   map.put("start", start);
	   map.put("pageCnt", pageCnt);
	   map.put("userid", userid);
	   
	   return sqlSession.selectList("zzim.zzim_list", map);
   }
   
   public int zzim_list_count(String userid) {
	   
	   return sqlSession.selectOne("zzim.zzim_list_count", userid);
   }
   
   public void zzim_list_delete(int idx) {
	   sqlSession.delete("zzim.zzim_list_delete", idx);
   }

}