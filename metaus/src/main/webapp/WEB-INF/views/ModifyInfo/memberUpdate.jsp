<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resume.css'/>">
<style>
.dellink {
	display: none;
}

.thumb {
	width: 512px;
	height: 337px;
}
</style>
<script type="text/javascript" src="<c:url value='/js/upload.js'/>"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript"
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=48fd685b6c1070cc71f894be6653d843&libraries=services"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">

	$(function() {
		/*이미지 업로드*/
		$('.thumb').hide();
		$('#imageSelector').change(function(){
			$('.thumb').show();
		});
		$('.dellink').click(function(){
			$('#imageSelector').val('');
			$('.thumb').hide();
		});
		
		
		/** 일반회원 유효성검사*/
		$('#btnMemSign').click(function() {
			if ($.trim($('#memPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#memPw').focus();
				event.preventDefault();

			} else if ($.trim($('#memPw').val()) != $.trim($('#memPwCheck').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				event.preventDefault();
						
			} else if ($.trim($('#memName').val())=="") {
				alert("이름을 입력해주세요.");
				$('#memName').focus();
				event.preventDefault();
						
			}else if(!validate_birth($('#memBirth').val())){
				alert("생년월일은 숫자만 입력해주세요.");
				$('#memBirth').focus();
				event.preventDefault();
				
			}else if(!validate_tel($('#memTel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#memTel').focus();
				event.preventDefault();				
			}else{
				alert('회원정보가 수정되었습니다.')
			}
			
		});
		
		/**일반회원 주소찾기*/
		$('#memZipcode').click(function(){
			execDaumPostcode();
		});
		
	});

	function validate_userid(id) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);		
	}

	function validate_tel(tel) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	function validate_birth(birth) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(birth);
	}
	function validate_email(email) {
		var pattern = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return pattern.test(email);
	}

	
	/** 일반회원 우편번호 찾기 */
	function execDaumPostcode() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {

	              $("#memZipcode").val(data.zonecode);
	              $("#memAdd").val(data.roadAddress);
	            }
	        }).open();
	    });
	}
	
</script>
<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 90px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>개인회원 - (${memVo.memName }님)정보수정</h2>
			</div>
		</div>
		<!-- End of Page Title -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->





<!-- ===== Start of Login - Register Section ===== -->
<section class="ptb80" id="register">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Start of Tab Content -->
				<div class="tab-content ptb60">

					<!-- Start of Tabpanel for Personal Account -->

					<div role="tabpanel" class="tab-pane active" id="personal">
						<div class="row">
							<form method="post" class="post-job-resume mt50" enctype="multipart/form-data"
								action="<c:url value='/ModifyInfo/memberUpdate'/>">
								<div class="col-md-6 col-md-offset-3">
									<div class="form-group">
			                            <label>작업 파일<span>(Png,aaa파일만 가능)</span></label>
										
			                            <!-- Upload Button -->
			                            <div class="upload-file-btn" style="width:140px">
			                                <input type="file" name="upfile" accept=".zip,.gltf">
                               
				                        </div>
				                     </div>

		
											<input type="file" class="hidden_input" id="imageSelector"
												name="upfile" accept="image/jpeg, image/jpg, image/png"
												multiple /> <img src="<c:url value='/mem_profile/${memVo.memPic }'/>" class="thumb" /> <a
												href="javascript:void(0);" class="dellink">[이미지 삭제]</a>

									<!-- Form Group -->
									<div class="form-group">
										<label>이메일</label> <input type="email" class="form-control"
											value="${memVo.memId }" disabled="disabled">
									</div>
									<input type="hidden" value="${memVo.memId }" name="memId"
										id="memId"> <input type="hidden"
										value="${memVo.memNo }" name="memNo" id="memNo"> <input
										type="hidden" value="${memVo.memPw }" name="memPwCheck"
										id="memPwCheck">

								</div>


								<div class="col-md-6 col-md-offset-3">



									<!-- Form Group -->
									<div class="form-group">
										<label>비밀번호</label> <input type="password"
											class="form-control" name="memPw" id="memPw">
									</div>

									<!-- Form Group -->
									<div class="form-group">
										<label>이름</label> <input type="text" class="form-control"
											name="memName" id="memName" value="${memVo.memName }">
									</div>
									<!-- Form Group -->
									<div class="form-group">
										<label>닉네임</label> <input type="text" class="form-control"
											name="memNick" id="memNick" value="${memVo.memNick }">
									</div>

									<!-- Form Group -->
									<div class="form-group">
										<label>생년월일</label> <input type="text" class="form-control"
											name="memBirth" id="memBirth" placeholder="예) 19930119"
											value="${memVo.memBirth }">
									</div>

									<!-- Form Group -->
									<div class="form-group">
										<label>전화번호</label> <input type="tel" class="form-control"
											name="memTel" id="memTel" placeholder="'-'를 제외한 전화번호 입력"
											value="${memVo.memTel }">
									</div>

									<!-- Form Group -->
									<div class="form-group">
										<label>우편번호</label> <input type="text" class="form-control"
											name="memZipcode" id="memZipcode" readonly="readonly"
											value="${memVo.memZipcode }">
									</div>



									<!-- Form Group -->
									<div class="form-group">
										<label>주소</label> <input type="text" class="form-control"
											name="memAdd" id="memAdd" value="${memVo.memAdd }">
									</div>

									<!-- Form Group -->
									<div class="form-group">
										<label>상세주소</label> <input type="text" class="form-control"
											name="memAdd2" id="memAdd2" value="${memVo.memAdd2}">
									</div>

									<!-- Form Group -->
									<div class="form-group text-center nomargin">
										<button type="submit" id="btnMemSign"
											class="btn btn-blue btn-effect">정보수정</button>
									</div>

								</div>
							</form>
						</div>

					</div>

					<!-- End of Tabpanel for Personal Account -->
				</div>
				<!-- End of Tab Content -->

			</div>
		</div>
	</div>
</section>
<!-- ===== End of Login - Register Section ===== -->
<%@ include file="../layout/sidebar_function_bottom.jsp"%>

