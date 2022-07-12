<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name ="google-signin-client_id" content="386529770600-22sjdk23dmt8g9lgdcheujm6ciugjevo.apps.googleusercontent.com">
<!-- Mobile viewport optimized -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">

    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- fullCalendar 2.2.5-->
    <link href="${pageContext.request.contextPath}/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />

	<!-- header -->
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_mypage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/responsive_mypage.css">
    <script src="https://kit.fontawesome.com/a88f4debe0.js" crossorigin="anonymous"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css">
    <script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=550605189855072" nonce="SiOBIhLG"></script>
	<script>
	$(function(){
		$('#logoutBtn').click(function(){
			console.log("click");
			var loginType = '${sessionScope.isLogin}';
			if(loginType=='kakao'){
				Kakao.init('48fd685b6c1070cc71f894be6653d843');
				if (Kakao.Auth.getAccessToken()) {
				      Kakao.API.request({
				    	  
				        url: '/v1/user/unlink',
				        success: function(response) {
				        	console.log(response);
				        	console.log('성공');
				        	Kakao.Auth.setAccessToken(undefined);
							location.href="<c:url value='/login/logout'/>";
				        },
				        fail: function(error) {
				          console.log(error);
				        }
				      });
			    }
			}else if(loginType=='naver'){
				location.href="<c:url value='/login/logout'/>";
			}else if(loginType=='facebook'){
		
			        FB.login(function(response) {
			            if (response.status === 'connected') {
			                FB.logout(function(response) {
	
			                		location.href="<c:url value='/login/logout'/>";
			                    });
			                }
			     
			        });
			}else{
				location.href="<c:url value='/login/logout'/>";
			}
		});
	
	});
	</script>
  </head>
  <!-- ADD THE CLASS sidedar-collapse TO HIDE THE SIDEBAR PRIOR TO LOADING THE SITE -->
  <!-- <body class="skin-blue sidebar-collapse fixed"> -->
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      <header class="sticky">
	    <nav class="navbar navbar-default navbar-static-top fluid_header centered">
            <!-- Logo -->
            <div class="col-md-2 col-sm-6 col-xs-8 nopadding logo">
                <a class="navbar-brand nomargin" href="<c:url value='/'/>"><img src="${pageContext.request.contextPath}/images/metaus_logo2.png" alt="logo"></a>
                <!-- INSERT YOUR LOGO HERE -->
            </div>
            <div class="left three-line-btn">
            	<a role="button" data-toggle="offcanvas" class="sidebar_menu_btn"><i class="fa-solid fa-bars"></i></a>
            </div>
	        <div class="container right width-header-menu">
	        	<!-- Main Menu -->
				<%@ include file="../inc/mainMenu.jsp" %>	
	        </div>
	        <div class="clear"></div>
	    </nav>
	</header>

      <!-- =============================================== -->

      <!-- Left side column. contains the sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="treeview">
              <a href="<c:url value='/ModifyInfo/UpdateInfo'/>">
                <i class="fa-solid fa-pen"></i> <span>내 정보 변경</span>
              </a>
            </li>
            <c:if test="${ 'company' ne sessionScope.isLogin }">
	            <li class="treeview">
	              <a href="<c:url value='/cart/cart'/>">
	                <i class="fa-solid fa-cart-shopping"></i> <span>장바구니</span>
	              </a>
	            </li>
            </c:if>
            <c:if test="${ 'company' ne sessionScope.isLogin }">
	            <li class="treeview">
	              <a href="<c:url value='/resume/resumeDetail'/>">
	                <i class="fa-solid fa-id-badge"></i>&nbsp;
	                <span>이력서</span>
	              </a>
	            </li>
            </c:if>
            
            
            <c:if test="${ 'company' ne sessionScope.isLogin }">
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-user-tie"></i>&nbsp;
                <span>의뢰</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="<c:url value='/commission/commissionList'/>"><i class="fa fa-circle-o"></i> 의뢰목록</a></li>
                <li><a href="<c:url value='/commission/progressSchedule'/>"><i class="fa fa-circle-o"></i> 의뢰진행상황</a></li>
              </ul>
            </li>
            </c:if>
            
            <c:if test="${ 'company' eq sessionScope.isLogin }">
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-user-tie"></i>&nbsp;
                <span>의뢰</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="<c:url value='/commission/commissionList'/>"><i class="fa fa-circle-o"></i> 의뢰목록</a></li>
                <li><a href="<c:url value='/commission/progressSchedule'/>"><i class="fa fa-circle-o"></i> 의뢰진행상황</a></li>
              </ul>
            </li>
            </c:if>
            
            
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-envelope"></i><span>메세지</span>
              </a>
            </li>
            <c:if test="${ 'company' ne sessionScope.isLogin }">
	            <li class="treeview">
	              <a href="#">
	                <i class="fa-solid fa-cube"></i></i> <span>3D모델</span>
	                <i class="fa fa-angle-left pull-right"></i>
	              </a>
	              <ul class="treeview-menu">
	                <li><a href="<c:url value='/lecture/lectureList'/>"><i class="fa fa-circle-o"></i> 3D모델목록</a></li>
	                <li><a href="<c:url value='/lecture/salesChart'/>"><i class="fa fa-circle-o"></i> 3D모델매출</a></li>
	              </ul>
	            </li>
            </c:if>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- =============================================== -->

