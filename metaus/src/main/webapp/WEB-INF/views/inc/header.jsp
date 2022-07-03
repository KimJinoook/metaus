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
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=550605189855072" nonce="SiOBIhLG"></script>
<script>
$(function(){
	
	$('#logoutBtn').click(function(){
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

<body>
    <!-- =============== Start of Header 4 Navigation =============== -->
    <header class="sticky">
        <nav class="navbar navbar-default navbar-static-top fluid_header centered">
            <div class="container">
                
                <!-- Logo -->
                <div class="col-md-2 col-sm-6 col-xs-8 nopadding">
                    <a class="navbar-brand nomargin" href="<c:url value='/'/>"><img src="<c:url value='/images/metaus_logo2.png'/>" alt="logo"></a>
                    <!-- INSERT YOUR LOGO HERE -->
                </div> 
				
				<!-- Main Menu -->
                <%@ include file="mainMenu.jsp"%>

            </div>
        </nav>
    </header>
    <!-- =============== End of Header 4 Navigation =============== -->
