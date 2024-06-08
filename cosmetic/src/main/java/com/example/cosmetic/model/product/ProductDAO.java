package com.example.cosmetic.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cosmetic.model.category.CategoryDTO;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession sqlSession;

	public List<ProductDTO> list(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		return sqlSession.selectList("product.product_list", map);
	}

	// 대분류 번호에 따른 소분류 제목 리스트
	public List<CategoryDTO> main_list(int ctg_b_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("ctg_b_no", ctg_b_no);
		return sqlSession.selectList("product.main_category", map);
	}

	// 대분류 번호에 따른 대분류 제목
	public String big_name(int ctg_b_no) {
		String name = sqlSession.selectOne("product.big_name", ctg_b_no);
		return name;
	}

	// 대분류 제품 리스트
	public List<Map<String, Object>> p_list_hit(int p_cate) {
		return sqlSession.selectList("sub_menu.hit", p_cate);
	}

	public List<Map<String, Object>> p_list_sell(int p_cate) {
		return sqlSession.selectList("sub_menu.sell", p_cate);
	}

	// 소분류
	// 상품수 출력
	public int sub_count(int no) {
		return sqlSession.selectOne("product.sub_count", no);
	}

	// 리스트
	public List<Map<String, Object>> sub_list(int start, int pageCnt, int no, String order, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("start", start);
		map.put("no", no);
		map.put("order", order);
		map.put("pageCnt", pageCnt);
		return sqlSession.selectList("product.sub_list", map);
	}

	// 소분류 카테고리 코드 > 소분류 카테고리 이름으로 변환
	public Map<String, Object> get_cate_name(int no) {
		return sqlSession.selectOne("product.get_cate_name", no);
	}

	// 디테일
	public ProductDTO detail(int p_id, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("userid", userid);
		return sqlSession.selectOne("product.detail", map);
	}

	// 디테일 화면에서 상품을 선택해주세요 클릭할때 옵션 조회
	public List<ProductDTO> detail_option(int p_id) {
		return sqlSession.selectList("product.detail_option", p_id);
	}

	// o_name 가지고 오기
	public List<ProductDTO> get_o_name(int p_id) {
		return sqlSession.selectList("product.get_o_name", p_id);
	}

	// 첨부파일
	public List<String> list_p_attach(int p_id) {
		return sqlSession.selectList("product.list_p_attach", p_id);
	}

	// 조회수
	public void update_hit(int p_id) {
		sqlSession.update("product.update_hit", p_id);
	}

	// 리뷰수
	public int count_review(int p_id) {
		return sqlSession.selectOne("product.count_review", p_id);
	}

	// 메인화면에 띄우는 인기상품
	public List<ProductDTO> hit_product() {
		return sqlSession.selectList("product.hit_product");
	}

	public List<ProductDTO> hit2_product() {
		return sqlSession.selectList("product.hit2_product");
	}

}
