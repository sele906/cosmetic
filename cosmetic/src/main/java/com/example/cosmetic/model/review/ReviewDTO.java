package com.example.cosmetic.model.review;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int r_id;
	private int p_id;
	private String userid;
	private String nickname;
	private String r_contents;
	private Date r_date;
	private int r_rate;
	
	//첨부파일
	private MultipartFile[] files;
	//
	private int file_id;
	private String file_name;
	

}
