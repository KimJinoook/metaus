package com.metaus.crawling.model;

import java.io.IOException;
import java.util.Objects;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Crawling {

    private static final Logger log = LoggerFactory.getLogger(Crawling.class);
    private static final int FIRST_PAGE_INDEX = 1;
    private static final int LAST_PAGE_INDEX = 32;
    private static final String PLATFORM = "Inflearn";

    public static void main(String[] args) {
        try {
            // 개발 강의 모든 페이징 순회
            for (int i = FIRST_PAGE_INDEX; i <= LAST_PAGE_INDEX; i++) {
                final String inflearnUrl = "https://www.inflearn.com/courses?order=seq&skill=metaverse" + i;
                Connection conn = Jsoup.connect(inflearnUrl);
                Document document = conn.get();

                // 크롤링 항목 필요 리스트
                //   - 썸네일 링크, 강의 제목, 가격(할인가격), 평점, 강의자, 강의 링크, 수강자 수, 플랫폼, 강의 세션 개수 + 시간
                Elements imageUrlElements = document.getElementsByClass("swiper-lazy");
                Elements titleElements = document.select("div.card-content > div.course_title");
                Elements priceElements = document.getElementsByClass("price");
                Elements instructorElements = document.getElementsByClass("instructor");
                Elements linkElements = document.select("a.course_card_front");
                Elements descriptionElements = document.select("p.course_description");
                Elements skillElements = document.select("div.course_skills > span");
                String[] imageUrls = new String[imageUrlElements.size()];

                int setIndex = 0;
                int getIndex = 0;

                for (Element e : imageUrlElements) {
                    imageUrls[setIndex++] = e.attr("abs:src");
                }

                for (int j = 0; j < titleElements.size(); j++) {
                    final String title = titleElements.get(j).text();
                    final String price = priceElements.get(j).text();
                    final String realPrice = getRealPrice(price);
                    final String salePrice = getSalePrice(price);
                    final int realIntPrice = toInt(removeNotNumeric(realPrice));
                    final int saleIntPrice = toInt(removeNotNumeric(salePrice));
                    final String currency = String.valueOf(price.charAt(0));
                    final String instructor = instructorElements.get(j).text();
                    final String url = linkElements.get(j).attr("abs:href");
                    final String description = descriptionElements.get(j).text();
                    final String skills = removeWhiteSpace(skillElements.get(j).text());

                    System.out.println("썸네일: " + imageUrls[j]);
                    System.out.println("강의 제목: " + title);
                    System.out.println("가격: " + realIntPrice);
                    System.out.println("할인 가격: " + saleIntPrice);
                    System.out.println("원화: " + currency);
                    System.out.println("강의자: " + instructor);
                    System.out.println("강의 링크: " + url);
                    System.out.println("강의 설명: " + description);
                    System.out.println("기술 스택: " + skills);

                    /* 강의 링크 내부 */
                    Connection innerConn = Jsoup.connect(url);
                    Document innerDocument = innerConn.get();

                    /* 평점 */
                    Element ratingElement = innerDocument.selectFirst("div.dashboard-star__num");
                    final float rating = Objects.isNull(ratingElement)
                            ? toFloat("0")
                            : toFloat(ratingElement.text());
                    System.out.println("평점: " + rating);

                    /* 수강자 수 */
                    Element listenerElement = innerDocument.selectFirst("div.cd-header__info-cover");
                    final String listener = Objects.isNull(listenerElement)
                            ? innerDocument.selectFirst("span > strong").text()
                            : innerDocument.select("div.cd-header__info-cover > span > strong").get(1).text();
                    System.out.println("수강자 수: " + removeNotNumeric(listener));
                    final int viewCount = Integer.parseInt(removeNotNumeric(listener));

                    /* 강의 세션 개수 */
                    final String course = innerDocument.selectFirst("span.cd-curriculum__sub-title").text();
                    System.out.println("강의 세션 개수: " + getSessionCount(course));
                    final int sessionCount = Integer.parseInt(getSessionCount(course));
                    System.out.println();

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getRealPrice(final String price) {
        final String[] pricesArray = price.split(" ");
        return pricesArray[0];
    }

    private static String getSalePrice(final String price) {
        final String[] pricesArray = price.split(" ");
        return (pricesArray.length == 1) ? price : pricesArray[1];
    }

    // html 태그 제거
    private static String stripHtml(final String html) {
        return Jsoup.clean(html, Whitelist.none());
    }

    // 맨 앞, 맨 뒤 소괄호 제거
    private static String removeBracket(final String str) {
        return str.replaceAll("^[(]|[)]$", "");
    }

    private static String getSessionCount(final String course) {
        return removeNotNumeric(course.substring(0, course.indexOf("개")));
    }

    private static String removeNotNumeric(final String str) {
        return str.replaceAll("\\W", "");
    }

    private static String removeWhiteSpace(final String str) {
        return str.replaceAll("\\s", "");
    }

    private static int toInt(final String str) {
        return Integer.parseInt(str);
    }

    private static float toFloat(final String str) {
        return Float.parseFloat(str);
    }

}