package com.example.cosmetic.model.order;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {

	private long orderid;
	private String userid;

	private Date orderDate;

	private int price;
	private int deliverCost;
	private int totalPrice;

	private String method;

	private String username;
	private String zipcode;
	private String address1;
	private String address2;
	private String tel;
	private int userPoint;

	// item
	private int orderItemId;
	private int p_id;
	private int amount;
	private String orderStatus;
	private String o_name;

	// 조인
	private String p_name;
	private int total_amount;
	private String option_amount;
	private int o_price;
	private String phone;
	private String cancelreason;
	private String file_name;
	private int p_price;
}
