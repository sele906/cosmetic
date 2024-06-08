package com.example.cosmetic.model.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;

	// 로그인
	public String login(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		return session.selectOne("member.login", map);
	}

	// 회원가입
	public void join(MemberDTO dto) {
		session.insert("member.join", dto);
	}

	// 아이디 중복확인
	public String id_check(String userid) {
		return session.selectOne("member.id_check", userid);
	}
	
	//멤버 정보 가져오기
	public MemberDTO get_member_info(String userid) {
		return session.selectOne("member.get_member_info", userid);
	}
	
	//멤버 정보 업데이트
	public void update_member_info(MemberDTO dto) {
		session.update("member.update_member_info", dto);
	}
	
	//멤버 탈퇴
	public void delete_member(String userid) {
		session.delete("member.delete_member", userid);
	}
}
