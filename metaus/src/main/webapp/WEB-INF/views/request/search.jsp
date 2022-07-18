<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/request.css'/>">
 <script type="text/javascript">
 function boardList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	$(function(){
		$('#writeRequest').click(function(){
			if($('#comId').val()=="" || $('#comId').val()==null){
				alert('기업회원 로그인 후 이용가능합니다!');
				event.preventDefault();
			}
		});
	});
	

	
function recpre(recNo){
	
		if($('#memId').val()=="" || $('#memId').val()==null){
			alert('일반회원 로그인 후 이용가능합니다!');
			event.preventDefault();
		}else{
			var memNo = $('#memNo').val();
			$.ajax({
				url: "<c:url value='/request/recpreCheck'/>"+"?memNo="+memNo+"&recNo="+recNo,
				type:"get",
				async:false,
				success:function(data){
					if(data==1){
						location.href="<c:url value='/request/recpreWrite?recNo='/>"+recNo;
						
					}else if(data==2){
						alert('이미 지원완료한 의뢰입니다.');
					}else{
						alert('지원여부 확인 체크에 실패했습니다.');
					}
				}
			});
		}
	
}	
</script>
 
<br>
<br>
<br>
<br>

    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>의뢰 게시판</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">for metaus</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
    </section>
       <input type="hidden" id="comId" name="comId" value="${comId }">
       <input type="hidden" id="memId" name="memId" value="${memId }">
       <input type="hidden" id="memNo" name="memNo" value="${sessionScope.memNo }">
    <!-- =============== End of Page Header 1 Section =============== -->





    <!-- ===== Start of Main Wrapper Section ===== -->
    <section class="search-jobs ptb80" id="version4">
        <div class="container">

            <!-- Start of Form -->
            <form class="job-search-form row" action="<c:url value='/request/search'/>" method="post">

                <!-- Start of keywords input -->
                <div class="col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2 col-xs-8">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="searchKeyword" id="search-keywords"  class="form-control" placeholder="키워드">
                </div>

                <!-- Start of category input -->
                <!-- <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-categories">Category</label>
                    <select name="search-categories" class="selectpicker" id="search-categories" data-live-search="true" title="모든 카테고리" data-size="5" data-container="body">
                        <option value="1">Accountance</option>
                        <option value="2">Banking</option>
                        <option value="3">Design & Art</option>
                        <option value="4">Developement</option>
                        <option value="5">Insurance</option>
                        <option value="6">IT Engineer</option>
                        <option value="7">Healthcare</option>
                        <option value="8">Marketing</option>
                        <option value="9">Management</option>
                    </select>
                </div> -->

                <!-- Start of location input -->
               <!--  <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-location">Location</label>
                     <select name="search-location" class="selectpicker" id="search-location" data-live-search="true" title="모든 지역" data-size="5" data-container="body">
                        <option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">인천</option>
                        <option value="4">대전</option>
                        <option value="5">세종</option>
                        <option value="6">충남</option>
                        <option value="7">충북</option>
                        <option value="8">광주</option>
                        <option value="9">전남</option>
                        <option value="10">전북</option>
                        <option value="11">대구</option>
                        <option value="12">걍븍</option>
                        <option value="13">부산</option>
                        <option value="14">울산</option>
                        <option value="15">경남</option>
                        <option value="16">강원</option>
                        <option value="17">제주</option>
                    </select>
                </div> -->

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-12 search-submit">
                    <button type="submit" class="btn btn-blue btn-effect"><i class="fa fa-search"></i>검색</button>
                </div>

            </form>
            <!-- End of Form -->


            <!-- Start of Row -->
            <div class="row mt60">

                <div class="col-md-12" id="writeRequest">
                <a href="<c:url value='/request/post'/>" id="writeRequest" class="btn btn-blue btn-effect" style="float: right;">의뢰 작성</a>
                    <h4></h4>
                    
                </div>
                <!-- ===== Start of Job Post Column 1 ===== -->
                <c:if test="${empty reclist }">
                	<img alt="게시글 내용이 없습니다"
						src="<c:url value='/images/board/no_board.gif'/>"
						style="width: 800px; margin-left: 50px;">
                </c:if>
                <c:if test="${!empty reclist }">
                 <c:forEach var="vo" items="${reclist }">
                <div class="col-md-12 mt20">
             		<c:forEach var="cvo" items="${comlist }">
             		<c:if test="${vo.comNo == cvo.comNo }">
                    <div class="item-block shadow-hover">
                        <!-- Start of Job Post Header -->
                        <!-- 반복문 시작 -->
                      
                        <div class="job-post-header clearfix">
                            <a href="company-page-1.html"><img src="<c:url value='/com_profile/${cvo.comPic }'/>" alt=""></a>
                            <div>
                                <a href="<c:url value='/request/detail?recNo=${vo.recNo }'/>"><h4>${vo.recTitle }</h4></a>
                                <h5><small>${cvo.comName }</small></h5>
                            </div>

                            <ul class="pull-right">
                                <li>
                                    <h6 class="time">등록일: <fmt:formatDate pattern="yyyy-MM-dd" value="${vo.recRegdate }"/></h6></li>
                                <li>
                                <div id="recpreWrite" >
                                    <a href="javascript:recpre(${vo.recNo })" class="btn btn-green btn-small btn-effect" id="recpreWrite">즉시 지원</a>
                                 </div>
                                </li>
                            </ul>

                        </div>
                        <!-- End of Job Post Header -->

                        <!-- Start of Job Post Body -->
                        <div class="job-post-body">
                            <ul class="list mt10">
                                <!-- <li>Designing modern and minimal PSD Templates</li>

                                <li>Converting PSD into HTML5 & CSS3</li>

                                <li>WordPress Theme Development</li>

                                <li>Troubleshooting, testing and maintaining web Themes</li> -->
                                <a>${vo.recContent3 }</a>
                            </ul>
                        </div>
                        <!-- End of Job Post Body -->

                        <!-- Start of Job Post Footer -->
                        <div class="job-post-footer row" style="height: 50px;">

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <i class="fa fa-user"></i><span>대표자: ${cvo.comCeo }</span>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <i>pay:</i>
                                <span><fmt:formatNumber value = "${vo.recPay }" pattern="#,###"/>원</span>                          
                            </div>
                        </div>
                        <!-- End of Job Post Footer -->

                    </div>
                </div>
                </c:if>
                </c:forEach>
                </c:forEach>
                </c:if>
                <!-- ===== End of Job Post Column 1 ===== -->             

                <!-- Start of Pagination -->
                <div class="col-md-12">
						<ul class="pagination list-inline text-center">
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#"
									onclick="boardList(${pagingInfo.firstPage-1})">prev</a></li>
							</c:if>

							<!-- [1][2][3][4][5][6][7][8][9][10] -->
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
									onclick="boardList(${pagingInfo.lastPage+1})">Next</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
						</ul>
					</div>
                <!-- End of Pagination -->
                

            </div>
            <!-- End of Row -->

        </div>
    <form name="frmPage" method="post" action="<c:url value='/request/search'/>">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword" value="${searchVo.searchKeyword }">
	</form>
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->






  



<%@ include file="../inc/footer.jsp"%>
    <!-- ===== Start of Login Pop Up div ===== -->
    