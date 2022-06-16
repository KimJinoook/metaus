<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile viewport optimized -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">

    <!-- Meta Tags - Description for Search Engine purposes -->
    <meta name="description" content="Cariera - Job Board HTML Template">
    <meta name="keywords" content="cariera job board, HTML Template, job board html, job listing, job portal, job postings, jobs, recruiters, recruiting, recruitment">
    <meta name="author" content="GnoDesign">

    <!-- Website Title -->
    <title>Cariera - Job Board HTML Template</title>
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,400i,700,800|Varela+Round" rel="stylesheet">

    <!-- CSS links -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/font-awesome.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/responsive.css'/>">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

    <!-- =============== Start of Header 4 Navigation =============== -->
    <header class="sticky">
        <nav class="navbar navbar-default navbar-static-top fluid_header centered">
            <div class="container">
                
                <!-- Logo -->
                <div class="col-md-2 col-sm-6 col-xs-8 nopadding">
                    <a class="navbar-brand nomargin" href="<c:url value='/'/>"><img src="<c:url value='/images/metaus_small_logo.png'/>" alt="logo"></a>
                    <!-- INSERT YOUR LOGO HERE -->
                </div>

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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">home<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="<c:url value='/'/>">home 1</a></li>
                                    <li><a href="index-02.html">home 2 - slider</a></li>
                                    <li><a href="index-03.html">home 3</a></li>
                                    <li><a href="index-04.html">boxed version</a></li>
                                </ul>
                            </li>

                            <!-- Simple Menu Item -->
                            <li class="dropdown simple-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">기업 찾기<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="search-jobs-1.html">search jobs 1</a></li>
                                    <li><a href="search-jobs-2.html">search jobs 2</a></li>
                                    <li><a href="search-jobs-3.html">search jobs 3</a></li>
                                    <li><a href="search-jobs-4.html">search jobs 4</a></li>
                                    <li><a href="submit-resume.html">submit resume</a></li>
                                </ul>
                            </li>

                            <!-- Simple Menu Item -->
                            <li class="dropdown simple-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">크리에이터 찾기<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="find-candidate-1.html">find a candidate 1</a></li>
                                    <li><a href="find-candidate-2.html">find a candidate 2</a></li>
                                    <li><a href="post-job.html">post a job</a></li>
                                </ul>
                            </li>

                            <!-- Mega Menu Item -->
                            <li class="dropdown mega-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">커뮤니티<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <!-- Start of Mega Menu Inner -->
                                        <div class="mega-menu-inner">
                                            <div class="row">
                                                <ul class="col-md-4">
                                                    <li class="menu-title">공지사항</li>
                                                    <li><a href="<c:url value='/board/notice'/>">공지사항</a></li>
                                                    <li><a href="<c:url value='/board/faq'/>"> F A Q</a></li>
                                                    <li><a href="<c:url value='/board/qna'/>"> Q N A</a></li>
                                                    <li><a href="<c:url value='/board/news'/>">기  사</a></li>
                                                </ul>

                                                <ul class="col-md-4">
                                                    <li class="menu-title">커뮤니티</li>
                                                    <li><a href="<c:url value='/board/freeBoard'/>">자유 게시판</a></li>
                                                    <li><a href="<c:url value='/board/QuestionBoard'/>">질문 게시판</a></li>
                                                    <li><a href="<c:url value='/board/shareBoard'/>">공유/정보 게시판</a></li>
                                                    <li><a href="<c:url value='/board/requestBoard'/>">개인의뢰 게시판</a></li>
	                                                </ul>

                                                <ul class="col-md-4">
                                                    <li class="<c:url value='/board/realTimeChatting'/>">실시간 채팅</li>
                                                    <li><a href="<c:url value='/board/individualChatting'/>">개인회원 채팅</a></li>
                                                    <li><a href="<c:url value='/board/EnterChatting'/>">기업회원 채팅</a></li>
                                                    <li><a href="<c:url value='/board/managerChatting'/>">관리자 채팅</a></li>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">VOD강의<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">headers<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="header1.html">header 1 - default</a></li>
                                            <li><a href="header2.html">header 2 - logo top</a></li>
                                            <li><a href="header3.html">header 3 - top bar</a></li>
                                            <li><a href="header4.html">header 4 - sticky</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">footers<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="footer1.html">default</a></li>
                                            <li><a href="footer2.html">light</a></li>
                                            <li><a href="footer3.html">dark</a></li>
                                            <li><a href="footer4.html">simple</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">page headers<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="page-header1.html">default</a></li>
                                            <li><a href="page-header2.html">light</a></li>
                                            <li><a href="page-header3.html">dark</a></li>
                                            <li><a href="page-header4.html">parallax</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="buttons.html">buttons</a></li>
                                    <li><a href="pricing-tables.html">pricing tables</a></li>
                                    <li><a href="typography.html">typography</a></li>
                                </ul>
                            </li>

                            <!-- Simple Menu Item -->
                            <li class="dropdown simple-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">마이페이지<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu">

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">blog right sidebar<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog-right-sidebar-v1.html">version 1</a></li>
                                            <li><a href="blog-right-sidebar-v2.html">version 2</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">blog left sidebar<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog-left-sidebar-v1.html">version 1</a></li>
                                            <li><a href="blog-left-sidebar-v2.html">version 2</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">blog fullwidth<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog-fullwidth-v1.html">version 1</a></li>
                                            <li><a href="blog-fullwidth-v2.html">version 2</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">masonry<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog-masonry-4col.html">4 columns</a></li>
                                            <li><a href="blog-masonry-3col.html">3 columns</a></li>
                                            <li><a href="blog-masonry-2col.html">2 columns</a></li>
                                        </ul>
                                    </li>

                                    <!-- Dropdown Submenu -->
                                    <li class="dropdown-submenu">
                                        <a href="#">single post<i class="fa fa-angle-right"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="blog-post-right-sidebar.html">post - right sidebar</a></li>
                                            <li><a href="blog-post-left-sidebar.html">post - left sidebar</a></li>
                                            <li><a href="blog-post.html">post - fullwidth</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            

                            <!-- Login Menu Item -->
                            <li class="menu-item login-btn">
                                <a id="modal_trigger" href="javascript:void(0)" role="button"><i class="fa fa-lock"></i>login</a>
                            </li>

                        </ul>
                    </div>
                    <!-- End of Main Nav -->
                </div>
                <!-- ======== End of Main Menu ======== -->

            </div>
        </nav>
    </header>
    <!-- =============== End of Header 4 Navigation =============== -->
