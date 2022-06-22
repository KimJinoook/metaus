<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<script src="<c:url value='js/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='js/bootstrap.min.js'/>"></script>
<script src="<c:url value='js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='js/swiper.min.js'/>"></script>
<script src="<c:url value='js/jquery.ajaxchimp.js'/>"></script>
<script src="<c:url value='js/jquery.countTo.js'/>"></script>
<script src="<c:url value='js/jquery.inview.min.js'/>"></script>
<script src="<c:url value='js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='js/jquery.easypiechart.min.js'/>"></script>
<script src="<c:url value='js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='js/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='js/countdown.js'/>"></script>
<script src="<c:url value='js/isotope.min.js'/>"></script>
<script src="<c:url value='js/custom.js'/>"></script>



<!-- ===== Start of FAQ Section ===== -->
<section class="ptb80" id="faq-page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<!-- Start of First Row -->
				<div class="row">
					<div class="col-md-12 text-center">

						<!-- =============== Start of Page Header 1 Section =============== -->
						<section class="page-header" style="margin-top: 50px;">
							<div class="container" >

								<!-- Start of Page Title -->
								<div class="row">
									<div class="col-md-12">
										<h2>faq</h2>
									</div>
								</div>
								<!-- End of Page Title -->

								<!-- Start of Breadcrumb -->
								<div class="row">
									<div class="col-md-12">
										<ul class="breadcrumb">
											<li><a href="<c:url value='/'/>">home</a></li>
											<li class="active">커뮤니티	</li>
											<li class="active">공지사항 - FAQ</li>
										</ul>
									</div>
								</div>
								<!-- End of Breadcrumb -->

							</div>
						</section>
						<!-- =============== End of Page Header 1 Section =============== -->
						<input type="text" class="live-search-box form-control mt20"
							placeholder="여기에 질문을 입력해주세요">
					</div>
				</div>
				<!-- End of First Row -->



				<!-- Start of Second Row -->
				<div class="row mt40">

					<!-- Start of Topic 1 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="1. how does cloudify work?">1. 회원 가입은 어떻게
								하나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">오른쪽 위에 LOGIN 버튼을 클릭 후
						"아직 계정이 없으시다면 여기를 클릭하세요" 부분을 클릭하시면 일반회원, 기업회원으로
						회원가입을 진행하실 수 있습니다.</p>
					</div>
					<!-- End of Topic 1 -->

					<!-- Start of Topic 2 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="2. does it work on all devices?">2. 회원
								탈퇴는 어떻게 하나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">로그인 후 위의 메뉴에서
						'마이페이지'에 들어가신 다음 회원탈퇴 절차를 밟으시면 회원탈퇴가 가능합니다.</p>
					</div>
					<!-- End of Topic 2 -->

					<!-- Start of Topic 3 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="3. where can i buy cloudify?">3. 이력서는 어디서
								올리나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">로그인 후 위의 메뉴에서
						'마이페이지'에 들어가신 다음 '이력서 등록'을 클릭하시면 이력서 등록 및 
						포트폴리오 작성이 가능합니다.</p>
					</div>
					<!-- End of Topic 3 -->

					<!-- Start of Topic 4 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="4. how can i host my website on cloudify?">4.
								구인구직은 어디서 하나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">위의 메뉴에서 
						'기업 찾기', '크리에이터 찾기' 메뉴를 들어가시면 구인구직을 할 수 있습니다.</p>
					</div>
					<!-- End of Topic 4 -->

					<!-- Start of Topic 5 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="5. can you design my website?">5. 지원하는
								운영체제는 뭔가요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer">기본적으로는 윈도우10에서 지원하고 있으며
						모바일 플렛폼으로 들어오실 경우에도 지원합니다.</p>
					</div>
					<!-- End of Topic 5 -->

					<!-- Start of Topic 6 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="6. can i buy a domain on cloudify?">6.
								강의를 환불하고 싶은데 어디서 하나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">미정</p>
					</div>
					<!-- End of Topic 6 -->

					<!-- Start of Topic 7 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="7. how can i transfer my website on cloudify?">7.
								METAUS모바일 어플리케이션이 있나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">출시 예정입니다.</p>
					</div>
					<!-- End of Topic 7 -->

					<!-- Start of Topic 8 -->
					<div class="col-md-12 topic">
						<!-- Question -->
						<div class="open">
							<h6 class="question"
								data-search-term="8. how to backup my website?">8. 상품을 등록하고
								싶은데 어디서 하나요?</h6>
							<i class="fa fa-angle-down hidden-xs"></i>
						</div>

						<!-- Answer -->
						<p class="answer" style="display: none;">미정</p>
					</div>
					<!-- End of Topic 8 -->

				</div>
				<!-- End of Second Row -->

			</div>
		</div>
	</div>
</section>
<!-- ===== End of FAQ Section ===== -->

<%@ include file="../inc/footer.jsp"%>