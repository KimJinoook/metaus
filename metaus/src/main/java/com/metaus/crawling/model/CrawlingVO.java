package com.metaus.crawling.model;

import org.jsoup.select.Elements;

import lombok.Data;

@Data
public class CrawlingVO {
//  - 썸네일 링크, 강의 제목, 가격(할인가격), 평점, 강의자, 강의 링크, 수강자 수, 플랫폼, 강의 세션 개수 + 시간
	Elements imageUrlElements;
    Elements titleElements;
    Elements priceElements;
    Elements instructorElements;
    Elements linkElements;
    Elements descriptionElements;
    Elements skillElements;
    String[] imageUrls;
    
    
   
}
