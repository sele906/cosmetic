package com.example.cosmetic.model.product;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_stock;
	private String p_detail;
	private Date p_date;
	private int p_delivery;
	private int p_hit;
	private int p_sel;
	private int p_cate;
	
	//카테고리 조인
	private String ctg_big;
	private int ctg_b_no;
	private String ctg_small;
	private int ctg_s_no;
	
	//옵션 조인
	private int idx;
	private int o_id;
	private String o_name;
	private int o_p_id;
	private int o_price;
	private int o_amount;
	
	//찜때문에 만듬
	private int p_like;
	
	//첨부파일
	private MultipartFile[] files;
		
	//
	private int file_id;
	private String file_name;
	
	
}
