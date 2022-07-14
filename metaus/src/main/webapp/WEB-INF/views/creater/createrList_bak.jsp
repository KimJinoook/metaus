<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>


    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" id="find-candidate">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>크리에이터 찾기</h2>
                </div>
            </div>
            <!-- End of Page Title -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->





    <!-- ===== Start of Main Wrapper Section ===== -->
    <section class="find-candidate ptb80">
        <div class="container">

            <!-- Start of Form -->
            <form class="row" action="<c:url value='/creater/createrList'/>" method="post">

                <!-- Start of keywords input -->
                <div class="col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2 col-xs-8">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="searchKeyword" id="search-keywords" class="form-control" placeholder="Keywords">
                </div>

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-2 col-xs-4">
                    <button type="submit" class="btn btn-blue btn-effect"><i class="fa fa-search"></i>검색</button>
                </div>

            </form>
            <!-- End of Form -->

            
            <!-- Start of Row -->
            <div class="row mt60">

                <!-- Start of Candidate Main -->
                <div class="col-md-12 candidate-main">

                    <!-- Start of Candidates Wrapper -->
                    <div class="candidate-wrapper">
                    
						<c:if test="${empty list }">
							<img alt="게시글 내용이 없습니다"
								src="<c:url value='/images/board/no_board.gif'/>"
								style="width: 800px;">
						</c:if>
				
						<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list }">		
                        <!-- ===== Start of Single Candidate 1 ===== -->
                        <div class="single-candidate row nomargin">

                            <!-- Candidate Image -->
                            <div class="col-md-2 col-xs-3">
                                <div class="candidate-img" >
                                        <img src="<c:url value='/mem_profile/${vo.memPic}'/>" class="img-responsive" alt="" onerror="this.onerror=null; this.src='<c:url value='/images/createrProfile/user.png'/>'">
                                </div>
                            </div>

                            <!-- Start of Candidate Name & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">

                                <!-- Candidate Name -->
                                <div class="candidate-name">
                                    <a href="<c:url value='/creater/createrDetail?memNo=${vo.memNo}'/>"><h5>${vo.memNick }</h5></a>
                                </div>

                                <!-- Candidate Info -->
                                <div class="candidate-info mt5">
                                    <ul class="list-inline">
                                        <li>
                                            <span><i class="fa fa-envelope"></i>${vo.memId }</span>
                                        </li>

                                        <li>
                                            <span><i class="fa fa-inbox"></i>${vo.memItem } items</span>
                                        </li>

                                        <li>
                                            <span><i class="fa fa-handshake-o"></i>${vo.memComplete } contracts</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End of Candidate Name & Info -->

                            <!-- CTA -->
                            <div class="col-md-2 col-xs-3">
                                <div class="candidate-cta ptb30">
                                    <a href="<c:url value='/creater/createrDetail?memNo=${vo.memNo}'/>" class="btn btn-blue btn-small btn-effect">상세보기</a>
                                </div>
                            </div>

                        </div>
                        <!-- ===== End of Single Candidate 1 ===== -->
                        </c:forEach>
                        </c:if>


                    </div>
                    <!-- End of Candidates Wrapper -->

                    <!-- Start of Pagination -->
                    <div class="col-md-12 mt10">
                        <ul class="pagination list-inline text-center">
                        	<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#"
									onclick="boardList(${pagingInfo.firstPage-1})">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${pagingInfo.firstPage }"
								end="${pagingInfo.lastPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<li class="active"><a>${i }</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<li><a href="#" onclick="boardList(${i})">${i } </a></li>
								</c:if>
							</c:forEach>

							<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
								<li><a href="#"
									onclick="boardList(${pagingInfo.lastPage+1})">다음</a></li>
							</c:if>
                        </ul>
                    </div>
                    <!-- End of Pagination -->

                </div>
                <!-- End of Candidate Main -->

            </div>
            <!-- End of Row -->

        </div>
    </section>
    <form name="frmPage" method="post"
		action="<c:url value='/creater/createrList'/>">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword" value="${searchVo.searchKeyword }">
		<input type="hidden" name="recNo" value="${recNo}">
	</form>
    <!-- ===== End of Main Wrapper Section ===== -->
    
<script type="text/javascript">
	function boardList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<%@ include file="../inc/footer.jsp" %>