package com.metaus.crawling.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CrawlingNews {

    private static final Logger log = LoggerFactory.getLogger(CrawlingNews.class);

    public List<CrawlingVO> getNews(int page) {
    	List<CrawlingVO> list = new ArrayList<CrawlingVO>();
        try {

        	
            for (int i = page; i <= page; i++) {
                final String inflearnUrl = "https://search.seoul.co.kr/index.php?scope=title&sort=&cpCode=seoul;nownews&period=&sDate=&eDate=&keyword=%EB%A9%94%ED%83%80%EB%B2%84%EC%8A%A4&iCategory=&pCategory=undefined&pageNum=" + i;
                Connection conn = Jsoup.connect(inflearnUrl);
                Document document = conn.get();

                System.out.println("페이지="+i);
                
                Elements group = document.select("dl.article");



                for (int j = 0; j < group.size(); j++) {
                	
                	Element imageUrlElements = group.get(j).select("dd > a > img").first();
                    Element titleElements = group.get(j).select("dt > a").first();
                    Element descriptionElements = group.get(j).select("dl > dd.sub").first();
                    Element linkElements = group.get(j).select("dt > a").first();
                    Element dates = group.get(j).select("span[id=date]").first();
                	
                    final String title = titleElements.text();
                    final String url = linkElements.attr("abs:href");
                    
                    
                    
                    final String description = descriptionElements.text();
                    final String date = dates.text();
                    final String sdate = date.substring(0,date.indexOf("|"));
                    final String newsCom = date.substring(date.indexOf("|")+1);
                    
                    String[] dateRepl = sdate.split("\\. ");
                    System.out.println(dateRepl[1]);
                    System.out.println(dateRepl[2]);
                    
                    String month = "";
                    switch(dateRepl[1]) {
                    case "01" : month="Jan"; break;
                    case "02" : month="Feb"; break;
                    case "03" : month="Mar"; break;
                    case "04" : month="Apr"; break;
                    case "05" : month="May"; break;
                    case "06" : month="Jun"; break;
                    case "07" : month="Jul"; break;
                    case "08" : month="Aug"; break;
                    case "09" : month="Sep"; break;
                    case "10" : month="Oct"; break;
                    case "11" : month="Nov"; break;
                    case "12" : month="Dec"; break;
                    }


                    System.out.println("기사 제목: " + title);
                    System.out.println("기사 링크: " + url);
                    System.out.println("기사 프리뷰: " + description);
                    
                    
                    CrawlingVO vo = new CrawlingVO();
                    
                    if(imageUrlElements != null) {
                    	final String imageUrl = imageUrlElements.attr("abs:src");
                    	System.out.println("썸네일: " + imageUrl);
                    	vo.setImageUrl(imageUrl);
                    }
                    
                    vo.setTitle(title);
                    vo.setUrl(url);
                    vo.setDescription(description);
                    
                    vo.setDate(sdate);
                    vo.setNewsCom(newsCom);
                    vo.setDay(dateRepl[2].substring(0,2));
                    vo.setMonth(month);
                    list.add(vo);

                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return list;
    }


}