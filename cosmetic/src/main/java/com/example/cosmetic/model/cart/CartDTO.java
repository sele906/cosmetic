package com.example.cosmetic.model.cart;

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
public class CartDTO {
	private int c_id;
	private int p_id;
	private String userid;
	private int amount;
	private String o_name;
	
	//조인 목록
	
	private String p_name;
	private int p_price;
	private int money;
	private String ctg_big;
	private String file_name;
}
