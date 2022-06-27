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
	            <!-- ======== Start of Main Menu ======== -->
	            <div class="col-md-10 col-sm-6 col-xs-4 nopadding mypage-header">
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
	                        <li class="mobile-title right">
	                            <h4>main menu</h4></li>
	
	                        <!-- Simple Menu Item -->
	                        <li class="dropdown simple-menu right">
	                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">home<i class="fa fa-angle-down"></i></a>
	                            <ul class="dropdown-menu" role="menu">
	                                <li><a href="<c:url value='/'/>">home 1</a></li>
	                                <li><a href="index-02.html">home 2 - slider</a></li>
	                                <li><a href="index-03.html">home 3</a></li>
	                                <li><a href="index-04.html">boxed version</a></li>
	                            </ul>
	                        </li>
	
	                        <!-- Simple Menu Item -->
	                        <li class="dropdown simple-menu right">
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
	                        <li class="dropdown simple-menu right">
	                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">크리에이터 찾기<i class="fa fa-angle-down"></i></a>
	                            <ul class="dropdown-menu" role="menu">
	                                <li><a href="find-candidate-1.html">find a candidate 1</a></li>
	                                <li><a href="find-candidate-2.html">find a candidate 2</a></li>
	                                <li><a href="post-job.html">post a job</a></li>
	                            </ul>
	                        </li>
	
	                        <!-- Mega Menu Item -->
	                        <li class="dropdown mega-menu right">
	                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">커뮤니티<i class="fa fa-angle-down"></i></a>
	                            <ul class="dropdown-menu" role="menu">
	                                <li>
	                                    <!-- Start of Mega Menu Inner -->
	                                    <div class="mega-menu-inner">
	                                        <div class="row">
	                                            <ul class="col-md-4">
	                                                <li class="menu-title">pages 1</li>
	                                                <li><a href="about-us.html">about us</a></li>
	                                                <li><a href="contact-1.html">contact us 1</a></li>
	                                                <li><a href="contact-2.html">contact us 2</a></li>
	                                                <li><a href="companies.html">companies</a></li>
	                                                <li><a href="company-page-1.html">company page 1</a></li>
	                                                <li><a href="company-page-2.html">company page 2</a></li>
	                                            </ul>
	
	                                            <ul class="col-md-4">
	                                                <li class="menu-title">pages 2</li>
	                                                <li><a href="candidate-profile-1.html">candidate profile 1</a></li>
	                                                <li><a href="candidate-profile-2.html">candidate profile 2</a></li>
	                                                <li><a href="candidate-profile-3.html">candidate profile 3</a></li>
	                                                <li><a href="faq.html">faq</a></li>
	                                                <li><a href="job-page.html">job page</a></li>
	                                                <li><a href="privacy-policy.html">privacy policy</a></li>
	                                            </ul>
	
	                                            <ul class="col-md-4">
	                                                <li class="menu-title">pages 3</li>
	                                                <li><a href="404.html">404</a></li>
	                                                <li><a href="404-2.html">404 ver. 2</a></li>
	                                                <li><a href="coming-soon.html">coming soon</a></li>
	                                                <li><a href="login.html">login</a></li>
	                                                <li><a href="register.html">register</a></li>
	                                                <li><a href="lost-password.html">lost password</a></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <!-- End of Mega Menu Inner -->
	                                </li>
	                            </ul>
	                        </li>
	                        <!-- End of Mega Menu Item -->
	
	                        <!-- Simple Menu Item -->
	                        <li class="dropdown simple-menu right">
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
	                        <li class="dropdown simple-menu right">
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
                            <li class="menu-item logout-btn">
                                <a id="logoutBtn" role="button"><i class="fa fa-lock"></i> logout</a>
                            </li>
	                        <div class="clear"></div>
	
	                    </ul>
	                </div>
	                <!-- End of Main Nav -->
	            </div>
	            <!-- ======== End of Main Menu ======== -->
	
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
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>Layout Options</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li class="active"><a href="collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Forms</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
                <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                <li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                <li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
              </ul>
            </li>
            <li>
              <a href="../mailbox/mailbox.html">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <small class="label pull-right bg-yellow">12</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Examples</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
                <li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
                <li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
                <li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                <li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                <li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                <li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                      <ul class="treeview-menu">
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- =============================================== -->

