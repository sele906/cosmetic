package com.example.cosmetic.model.member;

import java.util.Date;

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
public class MemberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String nickname;
	private String email;
	private String address1;
	private String address2;
	private String zipcode;
	private int birth;
	private String phone;
	private Date date;
	private String skin;
	private int level;
	private int point;
}

