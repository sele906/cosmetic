package com.example.cosmetic.model.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;

	// 카트 리스트
	public List<CartDTO> list_cart(String userid) {
		List<CartDTO> list = null;
		list = sqlSession.selectList("cart.cart_list", userid);
		return list;
	}

	// 장바구니가 추가
	public void insert(CartDTO dto) {
		sqlSession.insert("cart.cart_insert", dto);
	
	}

	// 카트 옵션 변경
	public void o_name_update(CartDTO dto) {
		sqlSession.update("cart.o_name_update", dto);
	}
	
	//카트 수량 변경
	public void amount_update(CartDTO dto) {
		sqlSession.update("cart.amount_update", dto);
	}

	// 장바구니 합계
	public int sum_money(String userid) {
		int total = 0;
		total = sqlSession.selectOne("cart.cart_sum_money", userid);
		return total;
	}

	// 장바구니 상품 한개 삭제
	public void delete(int c_id) {
		sqlSession.delete("cart.cart_delete", c_id);
	}

	// 장바구니 전체 삭제
	public void delete_all(String userid) {
		sqlSession.delete("cart.cart_delete_all", userid);
	}
	
	// 장바구니 추가할 때 존재하는지 확인
	public List<CartDTO> exist_cart(CartDTO dto) {
	    List<CartDTO> exist_cart = sqlSession.selectList("cart.exist_cart", dto);
	    return exist_cart;
	}
	
	//상품이 존재 하면 수량만 증가
	public void exist_amount_update(List<CartDTO> cart) {
	    for (CartDTO cartItem : cart) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("amount", cartItem.getAmount());
	        map.put("c_id", cartItem.getC_id()); // 상품 ID를 사용하여 장바구니 항목 식별
	        map.put("userid", cartItem.getUserid()); // 사용자 ID를 사용하여 장바구니 항목 식별
	        sqlSession.update("cart.update_amount", map);
	    }
	}
	
	//c_id에 따른 수량
	public int amount(int c_id) {
		int amount = sqlSession.selectOne("cart.amount",c_id);
		return amount;
	}
	
	//장바구니 리스트에 있는 블랙을 브라운으로 변경할 때 블랙의 c_id는 삭제되고 브라운의 수량 증가
	public void c_id_delete(int c_id) {
		sqlSession.delete("cart.c_id_delete",c_id);
	}
}
