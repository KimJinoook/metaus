<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- ======== Start of Main Menu ======== -->
<div class="col-md-10 col-sm-6 col-xs-4 nopadding">
    <div class="navbar-header page-scroll">
        <button type="button" class="navbar-toggle toggle-menu menu-right push-body" data-toggle="collapse" data-target="#main-nav" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>

    <!-- Start of Main Nav -->
    <div class="collapse navbar-collapse cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="main-nav">
        <ul class="nav navbar-nav pull-right">

            <!-- Mobile Menu Title -->
            <li class="mobile-title">
                <h4>main menu</h4></li>

            

            <!-- Simple Menu Item -->
            <li class="dropdown simple-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">기업 찾기<i class="fa fa-angle-down"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="<c:url value='/request/search'/>">기업 의뢰 게시판</a></li>
                    <li><a href="<c:url value='/request/post'/>">의뢰 등록</a></li>
                </ul>
            </li>

            <!-- Simple Menu Item -->
            <li class="dropdown simple-menu">
                <a href="<c:url value='/creater/createrList'/>" class="dropdown-toggle" data-toggle="dropdown" role="button">크리에이터 찾기</a>
     
            </li>

            <!-- Mega Menu Item -->
            <li class="dropdown mega-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">게시판<i class="fa fa-angle-down"></i></a>
                <ul class="dropdown-menu" role="menu" >
                    <li>
                        <!-- Start of Mega Menu Inner -->
                        <div class="mega-menu-inner">
                            <div class="row">
                                <ul class="col-md-4">
                                    <li class="menu-title">공지사항</li>
                                    <li><a href="<c:url value='/board/notice?btypeNo=1'/>">공지사항</a></li>
                                    <li><a href="<c:url value='/board/faq?btypeNo=2'/>"> F A Q</a></li>
                                    <li><a href="<c:url value='/board/qna?btypeNo=3'/>"> Q N A</a></li>
                                    <li><a href="<c:url value='/board/news2'/>">기  사</a></li>
                                </ul>

                                <ul class="col-md-4">
                                    <li class="menu-title">커뮤니티</li>
                                    <li><a href="<c:url value='/board/freeBoard?btypeNo=8'/>">자유 게시판</a></li>
                                    <li><a href="<c:url value='/board/QuestionBoard?btypeNo=5'/>">질문 게시판</a></li>
                                    <li><a href="<c:url value='/board/shareBoard?btypeNo=6'/>">공유/정보 게시판</a></li>
                                 </ul>

                                <ul class="col-md-4">
                                    <li class="menu-title">실시간 채팅</li>
                                    <li><a href="<c:url value='/chatting/Chatting'/>">일반회원 채팅</a></li>
                                    <li><a href="<c:url value='/chatting/Chatting'/>">기업회원 채팅</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End of Mega Menu Inner -->
                    </li>
                </ul>
            </li>
            <!-- End of Mega Menu Item -->

            <!-- Simple Menu Item -->
            <li class="dropdown simple-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">3D Model<i class="fa fa-angle-down"></i></a>
                 <ul class="dropdown-menu">
                    <!--  Dropdown Submenu-->
                    <!-- <li class="dropdown-submenu">
                        <a href="#">headers<i class="fa fa-angle-right"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="header1.html">header 1 - default</a></li>
                            <li><a href="header2.html">header 2 - logo top</a></li>
                            <li><a href="header3.html">header 3 - top bar</a></li>
                            <li><a href="header4.html">header 4 - sticky</a></li>
                        </ul>
                    </li> -->

                    <!--  Dropdown Submenu-->
                    <!-- <li class="dropdown-submenu">
                        <a href="#">footers<i class="fa fa-angle-right"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="footer1.html">default</a></li>
                            <li><a href="footer2.html">light</a></li>
                            <li><a href="footer3.html">dark</a></li>
                            <li><a href="footer4.html">simple</a></li>
                        </ul>
                    </li> -->

                    <!-- Dropdown Submenu-->
                     <li class="dropdown-submenu">
                        <a href="#">3D Model 목록<i class="fa fa-angle-right"></i></a>
                        <ul class="dropdown-menu">
                            <%-- <li><a href="<c:url value='/pd/pd'/>">전체 목록</a></li> --%>
                            <li><c:import url="/pd/categoryList"></c:import></li>
                        </ul>
                    </li>

                    <%-- <li><a href="<c:url value='/pd/pd'/>">3D Model 목록</a></li> --%>
                    <%-- <li><a href="<c:url value='/pd/pdPost'/>">3D Model 등록</a></li> --%>
                    <li><a href="<c:url value='/etc/create'/>">3D Model 제작</a></li>
                    <!-- <li><a href="typography.html">typography</a></li> -->
                         </ul>
                     </li>

			 <c:if test="${!empty sessionScope.isLogin }">
	             <!-- Simple Menu Item -->
	             <li class="dropdown simple-menu">
	                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">마이페이지<i class="fa fa-angle-down"></i></a>
	                 <ul class="dropdown-menu" role="menu">
	                 
	                 <!-- Dropdown Submenu -->
	                     <li class="dropdown-submenu">                               
	                         <a href="<c:url value='/ModifyInfo/UpdateInfo'/>">내 정보 변경</a>                                      
	                     </li>
	                     <li class="dropdown-submenu">                               
	                         <a href="<c:url value='/cart/cart'/>">장바구니</a>                                      
	                     </li>
	                     <li class="dropdown-submenu">                               
	                         <a href="<c:url value='/resume/resumeDetail'/>">이력서</a>                                      
	                     </li>
	
	                     <!-- Dropdown Submenu -->
	                     <li class="dropdown-submenu">
	                         <a href="#">의뢰<i class="fa fa-angle-right"></i></a>
	                         <ul class="dropdown-menu">
	                             <li><a href="<c:url value='/commission/commissionList'/>">의뢰목록</a></li>
	                             <li><a href="<c:url value='/commission/progressSchedule'/>">의뢰진행상황</a></li>
	                         </ul>
	                     </li>
	
	                     <!-- Dropdown Submenu -->
	                     <li class="dropdown-submenu">
	                         <a href="#">메세지<i class="fa fa-angle-right"></i></a>
	                         <ul class="dropdown-menu">
	                             <li><a href="<c:url value='/mailbox/mailbox'/>">메세지 목록</a></li>
	                             <li><a href="<c:url value='/mailbox/compose'/>">메세지 작성</a></li>
	                         </ul>
	                     </li>
	
	                     <!-- Dropdown Submenu -->
	                     <li class="dropdown-submenu">
	                         <a href="#">3D모델<i class="fa fa-angle-right"></i></a>
	                         <ul class="dropdown-menu">
	                             <li><a href="<c:url value='/lecture/lectureList'/>">모델목록</a></li>
	                             <li><a href="<c:url value='/lecture/salesChart'/>">모델매출</a></li>
	                         </ul>
	                     </li>
	                 </ul>
	             </li>
			 </c:if>

                     <!-- Login Menu Item -->
            <c:if test="${empty sessionScope.isLogin }">
             <li class="menu-item login-btn">
                 <a id="modal_trigger" href="javascript:void(0)" role="button"><i class="fa fa-lock"></i>login</a>
             </li>
         </c:if>
         <c:if test="${!empty sessionScope.isLogin }">
             <li class="menu-item logout-btn">
                 <a id="logoutBtn"  href="#" role="button"><i class="fa fa-lock"></i>logout</a>
             </li>
         </c:if>

        </ul>
    </div>
    <!-- End of Main Nav -->
</div>
<!-- ======== End of Main Menu ======== -->