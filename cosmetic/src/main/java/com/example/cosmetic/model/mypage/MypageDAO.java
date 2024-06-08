package com.example.cosmetic.model.mypage;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSession session;
	
	//멤버 정보 요약
	public Map<String, Object> get_member_info(String userid) {
		return session.selectOne("mypage.get_member_info", userid);
	}
	
	//주문배송 수
	public int orderlist_count(String userid) {
		return session.selectOne("mypage.orderlist_count", userid);
	}
	
	//장바구니 수
	public int cart_count(String userid) {
		return session.selectOne("mypage.cart_count", userid);
	}
	
	//찜한 수
	public int zzim_count(String userid) {
		return session.selectOne("mypage.zzim_count", userid);
	}
	
	//리뷰 수
	public int review_count(String userid) {
		return session.selectOne("mypage.review_count", userid);
	}
	
}
