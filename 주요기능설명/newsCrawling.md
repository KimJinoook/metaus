# 기사 페이지의 크롤링
- 서울뉴스의 메타버스 검색결과를 크롤링
- 반복문을 통해 검색결과의 페이지를 순회
- 원하는 html태그를 element로 추출
- element를 string으로 변환 후 vo에 담아 view페이지로 전송   

![2](https://user-images.githubusercontent.com/99188096/180385780-72b803d7-9b3d-47b9-83f1-a488d3ac1eba.PNG)   


## 크롤링 class   

```java
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

        	
            // page를 파라미터로 서울뉴스 검색결과의 페이지를 순회한다
            for (int i = page; i <= page; i++) {
                final String inflearnUrl = "https://search.seoul.co.kr/index.php?scope=title&sort=&cpCode=seoul;nownews&period=&sDate=&eDate=&keyword=%EB%A9%94%ED%83%80%EB%B2%84%EC%8A%A4&iCategory=&pCategory=undefined&pageNum=" + i;
                Connection conn = Jsoup.connect(inflearnUrl);
                Document document = conn.get();

                System.out.println("페이지="+i);
                
                
                //서울뉴스 검색결과 내 반복되는 아티클을 elements 로 추출, 아티클 수만큼 반복문을 돌린다
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

```

- 크롤링 결과를 담을 vo   

```java
package com.metaus.crawling.model;

import org.jsoup.select.Elements;

import lombok.Data;

@Data
public class CrawlingVO {
    String[] imageUrls;
    
    String title;
    String url;
    String description;
    String imageUrl;
    String date;
    String newsCom;
    String month;
    String day;
}

```

- 컨트롤러에서 크롤링 클래스의 호출   

```java
@RequestMapping("/news")
	public String news(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("news 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("news 페이지, searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);

		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("news 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("news 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("news 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("news 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);

		return "/board/news";
	}
```
