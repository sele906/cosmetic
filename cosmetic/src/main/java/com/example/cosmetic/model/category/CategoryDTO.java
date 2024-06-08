package com.example.cosmetic.model.category;

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
public class CategoryDTO {
	private int ctg_idx;
	private String ctg_big;
	private int ctg_b_no;
	private String ctg_small;
	private int ctg_s_no;
}
