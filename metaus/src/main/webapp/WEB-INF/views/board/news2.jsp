<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>메타버스 관련 소식</h2>
                </div>
            </div>
            <!-- End of Page Title -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->





    <!-- ===== Start of Blog Listing Section ===== -->
    <section class="blog-listing ptb80" id="version1">
        <div class="container">
            <div class="row">

                <!-- Start of Blog Posts -->
                <div class="col-md-12 col-xs-12 blog-posts-wrapper">
                
                
                
					<c:forEach var="vo" items="${list }">
                    <!-- Start of Blog Post Article 1 -->
                    <article class="col-md-12 blog-post">

                        <!-- Blog Post Thumbnail -->
                        <div class="col-md-4 blog-thumbnail">
                        	
                            <a href="${vo.url }" class="hover-link"><img src="${vo.imageUrl }" class="img-responsive" alt="" onerror="this.onerror=null; this.src='<c:url value='/images/board/white.png'/>'"></a>
                            
                            <div class="date">
                                <span class="day">${vo.day }</span>
                                <span class="publish-month">${vo.month }</span>
                            </div>
                        </div>

                        <!-- Blog Post Description -->
                        <div class="col-md-8 blog-desc">
                            <h5><a href="blog-post-right-sidebar.html">${vo.title }</a></h5>
                            <div class="post-detail pt10 pb20">
                                <span><i class="fa fa-user"></i>${vo.newsCom }</span>
                                <span><i class="fa fa-clock-o"></i>${vo.date }</span>
                            </div>

                            <p>${vo.description }</p>
                            <a href="${vo.url }" class="btn btn-blue btn-effect mt10">read more</a>
                        </div>
                    </article>
                    <!-- End of Blog Post Article 1 -->
					</c:forEach>


                    <!-- Start of Pagination -->
                    <div class="col-md-12">
                        <ul class="pagination list-inline text-center">
                        	<c:if test="${curPage <11 }">
                        		<c:forEach var="i" begin="1" end="${curPage-1 }" >
                        			<li><a href="<c:url value='/board/news2?page=${i }'/>">${i }</a></li>
                        		</c:forEach>
                        			<li class="active"><a href="javascript:void(0)">${curPage }</a></li>
                        		<c:forEach var="i" begin="${curPage+1 }" end="10" >
                        			<li><a href="<c:url value='/board/news2?page=${i }'/>">${i }</a></li>
                        		</c:forEach>
		                            <li><a href="<c:url value='/board/news2?page=11'/>">Next</a></li>
                        	</c:if>
                        	<c:if test="${curPage >10 }">
		                            <li><a href="<c:url value='/board/news2?page=10'/>">prev</a></li>
                        		<c:forEach var="i" begin="11" end="${curPage-1 }" >
                        			<li><a href="<c:url value='/board/news2?page=${i }'/>">${i }</a></li>
                        		</c:forEach>
                        			<li class="active"><a href="javascript:void(0)">${curPage }</a></li>
                        		<c:forEach var="i" begin="${curPage+1 }" end="19" >
                        			<li><a href="<c:url value='/board/news2?page=${i }'/>">${i }</a></li>
                        		</c:forEach>
                        	</c:if>
                            
                        </ul>
                    </div>
                    <!-- End of Pagination -->

                </div>
                <!-- End of Blog Posts -->

            </div>
        </div>
    </section>
    <!-- ===== End of Blog Listing Section ===== -->







<%@ include file="../inc/footer.jsp"%>