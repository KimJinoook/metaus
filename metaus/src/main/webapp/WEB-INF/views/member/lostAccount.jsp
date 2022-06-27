<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>




	<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>사용자 계정 찾기</h2>
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

                    <!-- Start of Nav Tabs -->
                    <ul class="nav nav-tabs" role="tablist">

                        <!-- Personal Account Tab -->
                        <li role="presentation" class="active">
                            <a href="#personal" aria-controls="personal" role="tab" data-toggle="tab" aria-expanded="true">
                                <h6>일반회원</h6>
                            </a>
                        </li>

                        <!-- Company Account Tab -->
                        <li role="presentation" class="">
                            <a href="#company" aria-controls="company" role="tab" data-toggle="tab" aria-expanded="false">
                                <h6>기업회원</h6>
                            </a>
                        </li>
                    </ul>
                    <!-- End of Nav Tabs -->



                    <!-- Start of Tab Content -->
                    <div class="tab-content ptb60">

                        <!-- Start of Tabpanel for Personal Account -->
                        <div role="tabpanel" class="tab-pane active" id="personal">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" name="memName" class="form-control" id="memIdFindName">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="text" name="memTel" class="form-control" id="memIdFindTel">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="button" class="btn btn-blue btn-effect" id="memIdFind">아이디 찾기</button>
                                    </div>
                                </div>
                                
                                <div class="col-md-8 col-md-offset-2">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>아이디</label>
                                        <input type="email" name="memId" class="form-control" id="memPwFindId">
                                    </div>

                                     <!-- Form Group -->
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" name="memName" class="form-control" id="memPwFindName">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="text" name="memTel" class="form-control" id="memPwFindTel">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="submit" class="btn btn-blue btn-effect" id="memPwFind">비밀번호 찾기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End of Tabpanel for Personal Account -->

                        <!-- Start of Tabpanel for Company Account -->
                        <div role="tabpanel" class="tab-pane" id="company">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>대표자명</label>
                                        <input type="text" name="comCeo" class="form-control" id="comIdFindCeo">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>사업자번호</label>
                                        <input type="text" name="comRrn" class="form-control" id="comIdFindRrn">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="button" class="btn btn-blue btn-effect" id="comIdFind">아이디 찾기</button>
                                    </div>
                                </div>
                                
                                <form method="post" action="<c:url value='/company/comPwReset'/>" id="comPwFindFrm"> 
                                <div class="col-md-8 col-md-offset-2">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>아이디</label>
                                        <input type="text" name="comId" class="form-control" id="comPwFindId">
                                    </div>

                                     <!-- Form Group -->
                                    <div class="form-group">
                                        <label>대표자명</label>
                                        <input type="text" name="comCeo" class="form-control" id="comPwFindCeo">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>사업자번호</label>
                                        <input type="text" name="comRrn" class="form-control" id="comPwFindRrn">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="button" class="btn btn-blue btn-effect" id="comPwFind">비밀번호 찾기</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        <!-- End of Tabpanel for Company Account -->

                    </div>
                    <!-- End of Tab Content -->

                </div>
            </div>
        </div>
    </section>
    
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		/** 일반회원 유효성검사*/
		$('#memIdFind').click(function() {
			if ($.trim($('#memIdFindName').val()).length < 1) {
				alert("이름을 입력해주세요");
				$('#memIdFindName').focus();
				event.preventDefault();

			} else if ($.trim($('#memIdFindTel').val()).length < 1) {
				alert("전화번호를 입력해주세요");
				$('#memIdFindTel').focus();
				event.preventDefault();

			} else if(!validate_tel($('#memIdFindTel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#memIdFindTel').focus();
				event.preventDefault();				
			} else{
				var name = $('#memIdFindName').val();
				var tel = $('#memIdFindTel').val();
				
				$.ajax({
					url: "<c:url value='/member/findId'/>",
					type:"GET",
					data:{
						memName:name,
						memTel:tel
					},
					async:false,
					success:function(data){
						if(data==""){
							alert('사용자의 정보와 일치하는 계정이 없습니다.');
							
						}else{
							alert("회원님의 계정은 "+data+" 입니다.");
							$('#memPwFindId').val(data);
							$('#memPwFindId').focus();
						}
					},
					error:function(){
						alert('ajax 오류');
					}
				});
			}
		});
		
		$('#memPwFind').click(function() {
			if ($.trim($('#memPwFindName').val()).length < 1) {
				alert("이름을 입력해주세요");
				$('#memPwFindName').focus();
				event.preventDefault();

			} else if ($.trim($('#memPwFindTel').val()).length < 1) {
				alert("전화번호를 입력해주세요");
				$('#memPwFindTel').focus();
				event.preventDefault();

			} else if(!validate_tel($('#memPwFindTel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#memPwFindTel').focus();
				event.preventDefault();				
			} else if ($.trim($('#memPwFindId').val()).length < 1) {
				alert("아이디를 입력해주세요");
				$('#memPwFindId').focus();
				event.preventDefault();

			} else{
				var name = $('#memPwFindName').val();
				var tel = $('#memPwFindTel').val();
				var id = $('#memPwFindId').val();
				
				$.ajax({
					url: "<c:url value='/member/findPw'/>",
					type:"GET",
					data:{
						memName:name,
						memTel:tel,
						memId:id
					},
					async:false,
					success:function(data){
						if(data==0){
							alert('사용자의 정보와 일치하는 계정이 없습니다.');
							
						}else if(data==1){
							var num = Math.floor(Math.random() * 10000)+1;
							$.ajax({
								url: "<c:url value='/email/pwEmail'/>",
								type:"GET",
								data:{
									pw:num,
									receiver:id
								},
								async:false,
								success:function(data){
									if(data==0){
										alert('이메일 발송이 실패했습니다');
										
									}else if(data==1){
										alert('회원님의 이메일로 임시비밀번호가 발송되었습니다.');
									}
								},
								error:function(){
									alert('ajax 오류');
								}
							});
						}
					},
					error:function(){
						alert('ajax 오류');
					}
				});
			}
		});
		
		/** 기업회원 유효성검사*/
		$('#comIdFind').click(function() {
			if ($.trim($('#comIdFindCeo').val()).length < 1) {
				alert("대표자명을 입력해주세요");
				$('#comIdFindCeo').focus();
				event.preventDefault();

			} else if ($.trim($('#comIdFindRrn').val()).length < 1) {
				alert("사업자번호를 입력해주세요");
				$('#comIdFindRrn').focus();
				event.preventDefault();

			} else if(!validate_tel($('#comIdFindRrn').val())){
				alert("사업자번호는 숫자만 입력해주세요.");
				$('#comIdFindRrn').focus();
				event.preventDefault();				
			} else{
				var name = $('#comIdFindCeo').val();
				var tel = $('#comIdFindRrn').val();
				
				$.ajax({
					url: "<c:url value='/company/findId'/>",
					type:"GET",
					data:{
						comCeo:name,
						comRrn:tel
					},
					async:false,
					success:function(data){
						if(data==""){
							alert('사용자의 정보와 일치하는 계정이 없습니다.');
							
						}else{
							alert("회원님의 계정은 "+data+" 입니다.");
							$('#comPwFindId').val(data);
							$('#comPwFindId').focus();
						}
					},
					error:function(){
						alert('ajax 오류');
					}
				});
			}
		});
		
		$('#comPwFind').click(function() {
			if ($.trim($('#comPwFindCeo').val()).length < 1) {
				alert("대표자명을 입력해주세요");
				$('#comPwFindCeo').focus();
				event.preventDefault();

			} else if ($.trim($('#comPwFindRrn').val()).length < 1) {
				alert("사업자번호를 입력해주세요");
				$('#comPwFindRrn').focus();
				event.preventDefault();

			} else if(!validate_tel($('#comPwFindRrn').val())){
				alert("사업자번호는 숫자만 입력해주세요.");
				$('#comPwFindRrn').focus();
				event.preventDefault();				
			} else if ($.trim($('#comPwFindId').val()).length < 1) {
				alert("아이디를 입력해주세요");
				$('#comPwFindId').focus();
				event.preventDefault();

			} else{
				var name = $('#comPwFindCeo').val();
				var tel = $('#comPwFindRrn').val();
				var id = $('#comPwFindId').val();
				
				$.ajax({
					url: "<c:url value='/company/findPw'/>",
					type:"GET",
					data:{
						comCeo:name,
						comRrn:tel,
						comId:id
					},
					async:false,
					success:function(data){
						if(data==0){
							alert('사용자의 정보와 일치하는 계정이 없습니다.');
							
						}else if(data==1){
							document.querySelector('#comPwFindFrm').submit();
						}
					},
					error:function(){
						alert('ajax 오류');
					}
				});
			}
		});
		
		function validate_tel(tel) {
			var pattern = new RegExp(/^[0-9]*$/g);
			return pattern.test(tel);
		}
	});
</script>
    <!-- ===== End of Login - Register Section ===== -->
<%@ include file="../inc/footer.jsp" %>
