<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- =============== Start of Footer 1 =============== -->
<footer class="footer1">

	<!-- ===== Start of Footer Information & Links Section ===== -->
	<div class="footer-info ptb80">
		<div class="container">

			<!-- 1st Footer Column -->
			-
			<div class="col-md-3 col-sm-6 col-xs-6 footer-about" style="width: 24%">
				<a class="navbar-brand nomargin" href="<c:url value='/'/>" style="padding: 0px; "><img src="<c:url value='/images/metaus_logo2.png'/>" style=" margin-right: 50px; margin-bottom: 50px"   alt="logo"></a>
				<!-- Small Description -->
				
				<!-- Info -->
				<ul class="nopadding">
					<li><i class="fa fa-map-marker"></i>서울특별시 서대문구, 104-48</li>
					<li><i class="fa fa-phone"></i>(대표) 010-3084-3045</li>
					<li><i class="fa fa-envelope-o"></i>kimjin0132@naver.com</li>
				</ul>
			</div>

			<!-- 2nd Footer Column -->
			<div class="col-md-3 col-sm-6 col-xs-6 footer-links">
				<h3>메타어스 링크</h3>

				<!-- Links -->
				<ul class="nopadding">
					<li><a href="<c:url value='/request/search'/>"><i
							class="fa fa-angle-double-right"></i>의뢰 찾기</a></li>
					<li><a href="<c:url value='/creater/createrList'/>"><i
							class="fa fa-angle-double-right"></i>크리에이터 찾기</a></li>
					<li><a href="<c:url value='/board/notice?btypeNo=1'/>"><i
							class="fa fa-angle-double-right"></i>공지사항</a></li>
					<li><a href="<c:url value='/board/faq?btypeNo=2'/>"><i
							class="fa fa-angle-double-right"></i>FAQ</a></li>
					<li><a href="<c:url value='/board/news2'/>"><i
							class="fa fa-angle-double-right"></i>기사</a></li>
					<li><a href="<c:url value='/pd/pd'/>"><i
							class="fa fa-angle-double-right"></i>3D Model 목록</a></li>
					<li><a href="<c:url value='/member/register'/>"><i
							class="fa fa-angle-double-right"></i>회원가입</a></li>
				</ul>
			</div>

			
			<div class="col-md-6 col-sm-6 col-xs-6 footer-posts">
				<h3>찾아오시는 길</h3>

				<!-- Single Post 1 -->
				<div class="footer-blog-post">

					<div id="map2" style="width:100%;height:200px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e35ee665202c956a80b8b31eaa6545be&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map2 = new kakao.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('서울 서대문구 신촌로 141', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map2,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">METAUS</div>'
				        });
				        infowindow.open(map2, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map2.setCenter(coords);
				    } 
				}); 
					</script>
				</div>
				<p>서울 서대문구 신촌로 141 은하빌딩 1,2,4층</p>
			</div>


		</div>
	</div>
	<!-- ===== End of Footer Information & Links Section ===== -->


	<!-- ===== Start of Footer Copyright Section ===== -->
	<div class="copyright ptb40">
		<div class="container">

			<div class="col-md-6 col-sm-6 col-xs-12">
				<span>Copyright &copy; <a href="#">metaus</a>. All Rights
					Reserved
				</span>
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<!-- Start of Social Media Buttons -->
				<ul class="social-btns list-inline text-right">
					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll facebook">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-facebook"></i> <i
									class="social-btn-roll-icon fa fa-facebook"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll twitter">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-twitter"></i> <i
									class="social-btn-roll-icon fa fa-twitter"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll google-plus">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-google-plus"></i> <i
									class="social-btn-roll-icon fa fa-google-plus"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll instagram">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-instagram"></i> <i
									class="social-btn-roll-icon fa fa-instagram"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll linkedin">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-linkedin"></i> <i
									class="social-btn-roll-icon fa fa-linkedin"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll rss">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-rss"></i> <i
									class="social-btn-roll-icon fa fa-rss"></i>
							</div>
					</a></li>
				</ul>
				<!-- End of Social Media Buttons -->
			</div>

		</div>
	</div>
	<!-- ===== End of Footer Copyright Section ===== -->

</footer>
<!-- =============== End of Footer 1 =============== -->





<!-- ===== Start of Back to Top Button ===== -->
<a href="#" class="back-top"><i class="fa fa-chevron-up"></i></a>
<!-- ===== End of Back to Top Button ===== -->





<!-- ===== Start of Login Pop Up div ===== -->
<div class="cd-user-modal">
	<!-- this is the entire modal form, including the background -->
	<div class="cd-user-modal-container">
		<!-- this is the container wrapper -->
		<ul class="cd-switcher">
			<li><a href="#0">일반 회원</a></li>
			<li><a href="#1">기업 회원</a></li>
		</ul>

		<div id="cd-login">
			<!-- log in form -->
			<form class="cd-form" id="memloginfrm" method="post"
				action="<c:url value='/login/memberlogin'/>">
				<p class="fieldset">
					<label class="image-replace cd-email" for="signin-email">E-mail</label>
					<input class="full-width has-padding has-border" name="memId"
						type="email" placeholder="E-mail">
				</p>
				<p class="fieldset">
					<label class="image-replace cd-password" for="signin-password">Password</label>
					<input class="full-width has-padding has-border" name="memPw" id="memPw"
						type="password" placeholder="Password">
				</p>
				<p class="fieldset">
					<button type="button" value="Login" class="btn btn-blue btn-effect" id="memLoginBtn">Login</button>
				</p>
			</form>

			<div class="text-center">
				<!-- Form Group -->
				<div class="form-group">
					<label for="agree2">소셜 계정으로 간편하게 로그인하세요!</label><br> <br>
					<a style="width: 10px" href="javascript:loginFormWithNaver()"><img
						src="<c:url value='/images/icons/naverbtn.png'/>" width="40px"
						height="40px"></a>&nbsp;&nbsp; <a style="width: 10px"
						href="javascript:loginFormWithKakao()"><img
						src="<c:url value='/images/icons/kakaobtn.png'/>" width="40px"
						height="40px"></a>&nbsp;&nbsp; <a style="width: 10px"
						href="javascript:loginFormWithFacebook()"><img
						src="<c:url value='/images/icons/facebookbtn.png'/>" width="40px"
						height="40px"></a> <br>
				</div>
			</div>

			<div class="text-center">
				<!-- Form Group -->
				<div class="form-group">
					<br> <label for="agree2"><a
						href="<c:url value='/member/lostAccount'/>">비밀번호를 잊어버렸어요</a></label><br>
					<label for="agree2">아직 회원이 아니신가요? <a
						href="<c:url value='/member/register'/>">회원 가입하기</a></label> <br> <br>
				</div>
			</div>

		</div>
		<!-- cd-login -->

		<div id="cd-signup">
			<!-- sign up form -->
			<form class="cd-form" id="comloginfrm" method="post"
				action="<c:url value='/login/companylogin'/>">
				<p class="fieldset">
					<label class="image-replace cd-email" for="signup-email">ID</label>
					<input class="full-width has-padding has-border" id="" name="comId"
						type="text" placeholder="ID">
				</p>
				<p class="fieldset">
					<label class="image-replace cd-password" for="signup-password">Password</label>
					<input class="full-width has-padding has-border"
						id="signup-password" name="comPw" type="password"
						placeholder="Password">
				</p>

				<p class="fieldset">
					<button class="btn btn-blue btn-effect" type="button" id="comLoginBtn"
						value="Create account">Login</button>
				</p>
			</form>

			<div class="text-center">
				<!-- Form Group -->
				<div class="form-group">
					<label for="agree2"><a
						href="<c:url value='/member/lostAccount'/>">비밀번호를 잊어버렸어요</a></label><br>
					<label for="agree2">아직 회원이 아니신가요? <a
						href="<c:url value='/member/register'/>">회원 가입하기</a></label> <br> <br>
				</div>
			</div>
		</div>
		<!-- cd-signup -->
	</div>
	<!-- cd-user-modal-container -->
</div>
<!-- cd-user-modal -->
<!-- ===== End of Login Pop Up div ===== -->

<form id="form-kakao-login" method="post"
	action="<c:url value='/login/kakaologin'/>">
	<input type="hidden" name="kakaoEmail" /> <input type="hidden"
		name="kakaoName" />
</form>
<form id="form-facebook-login" method="post"
	action="<c:url value='/login/facebooklogin'/>">
	<input type="hidden" name="facebookEmail" /> <input type="hidden"
		name="facebookName" />
</form>
<div id="naverIdLogin" style="display: none"></div>
<input type="hidden" id="publicKeyModule" value="${sessionScope.publicKeyModulus }">
<input type="hidden" id="publicKeyExponent" value="${sessionScope.publicKeyExponent }">
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=550605189855072"
	nonce="SiOBIhLG"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript">	
$(function(){
	$('#memLoginBtn').click(function(){
		var inputText = $('#memPw').val();
		
		var rsaPkModule = $('#publicKeyModule').val();
		var rsaPkExponent = $('#publicKeyExponent').val();
		
		var rsa = new RSAKey();
		rsa.setPublic(rsaPkModule,rsaPkExponent);
		
		var securedPw = rsa.encrypt(inputText);
		$('#memPw').val(securedPw);
		$('#memloginfrm').submit();
	});
	$('#comLoginBtn').click(function(){
		var inputText = $('#signup-password').val();
		
		var rsaPkModule = $('#publicKeyModule').val();
		var rsaPkExponent = $('#publicKeyExponent').val();
		
		var rsa = new RSAKey();
		rsa.setPublic(rsaPkModule,rsaPkExponent);
		
		var securedPw = rsa.encrypt(inputText);
		$('#signup-password').val(securedPw);
		$('#comloginfrm').submit();
	});
});
	function loginFormWithKakao(){
		Kakao.init('48fd685b6c1070cc71f894be6653d843');

		Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              var id = res.id;
	              var account = res.kakao_account;
	              $('#form-kakao-login input[name=kakaoEmail]').val(account.email);
	              $('#form-kakao-login input[name=kakaoName]').val(account.profile.nickname);
				  scope : 'account_email';
				document.querySelector('#form-kakao-login').submit();
			

	              
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	};
	function loginFormWithNaver(){
		var nl = document.getElementById("naverIdLogin").firstChild;
		nl.click();
	};

	var naverLogin = new naver.LoginWithNaverId({
		clientId: "hP_hkEdQKOSZIWk68Pgk",
		callbackUrl: "http://192.168.0.66:9091/metaus/login/navercallback",
		isPopup: false,
		loginButton:{color:'green',type:5,height:60}
	});
	naverLogin.init();
	
	function loginFormWithFacebook(){
		

		function fnFbCustomLogin(){
			FB.login(function(response) {
				if (response.status === 'connected') {
					FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
						console.log(r);
						$('#form-facebook-login input[name=facebookEmail]').val(r.email);
			            $('#form-facebook-login input[name=facebookName]').val(r.name);
			            document.querySelector('#form-facebook-login').submit();
					})
				} else if (response.status === 'not_authorized') {
					// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
					alert('앱에 로그인해야 이용가능한 기능입니다.');
				} else {
					// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
					fnFbCustomLogin();
				}
			}, {scope: 'public_profile,email'});
		}
		fnFbCustomLogin();

		window.fbAsyncInit = function() {
			FB.init({
				appId      : '550605189855072', // 내 앱 ID를 입력한다.
				cookie     : true,
				xfbml      : true,
				version    : 'v10.0'
			});
			FB.AppEvents.logPageView();   
		};
	};
	
	

	
</script>



<!-- ===== All Javascript at the bottom of the page for faster page loading ===== -->
<script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='/js/swiper.min.js'/>"></script>
<script src="<c:url value='/js/jquery.ajaxchimp.js'/>"></script>
<script src="<c:url value='/js/jquery.countTo.js'/>"></script>
<script src="<c:url value='/js/jquery.inview.min.js'/>"></script>
<script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/js/jquery.easypiechart.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/js/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='/js/countdown.js'/>"></script>
<script src="<c:url value='/js/isotope.min.js'/>"></script>
<script src="<c:url value='/js/custom.js'/>"></script>

</body>

</html>