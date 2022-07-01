package com.metaus.category.model;

import com.metaus.common.SearchVO;

import lombok.Data;

@Data
/* 모델링카테고리 */
public class CategoryVO extends SearchVO {
	private int cateNo; /* 카테고리번호 */
	private String cateName; /* 카테고리명 */
}
