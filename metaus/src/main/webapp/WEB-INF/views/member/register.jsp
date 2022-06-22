<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	var timer = null;
	var isRunning = false;
	
	$(function() {
		
		$('#btnMemSign').click(function() {
			if ($('#ismailcodeCheck').val() != 'Y'){
				alert("이메일 인증이 필요합니다.");
				event.preventDefault();
				
			} else if ($.trim($('#mailcode').val()) != $.trim($('#mailcodeCheck').val())) {
				alert("이메일 인증번호가 일치하지 않습니다");
				$('#mailcode').focus();
				event.preventDefault();
			
			} else if ($.trim($('#memPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#memPw').focus();
				event.preventDefault();

			} else if ($.trim($('#memPw').val()) != $.trim($('#memPwCheck').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#memPwCheck').focus();
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
			}
		});
		
		$('#sendEmail').click(function(){
			$('#ismailcodeCheck').val('Y');
			var id = $('#memId').val();
			var num = Math.floor(Math.random() * 10000)+1;
			var datas = {"id":id,"num":num};
			var getdata;

			
			if(!validate_email(id)){
				alert("이메일 형식이 올바르지 않습니다.");
				$('#memId').focus();
				event.preventDefault();
			}else{
				$.ajax({
					url: "<c:url value='/email/signEmail'/>"+"?receiver="+id+"&num="+num,
					type:"get",
					async:false,
					success:function(data){
						if(data==1){
							alert('해당 이메일로 인증번호가 발송되었습니다.');
							$('#mailcodeCheck').val(num);
							
							var display = $('#emailCnt');
					    	var leftSec = 180;
					    	// 남은 시간
					    	// 이미 타이머가 작동중이면 중지
					    	if (isRunning){
					    		clearInterval(timer);
					    		display.html("");
					    		startTimer(leftSec, display);
					    	}else{
					    		startTimer(leftSec, display);
					    		
					    	}
						}else if(data==2){
							alert('이미 사용중인 이메일 계정입니다.');
						}else{
							alert('인증번호 발송이 실패했습니다.');
						}
					}
				});
				event.preventDefault();			
			}
		});
		
		
		$('#memZipcode').click(function(){
			execDaumPostcode();
		});
		
		
		$('#memPwCheck').keyup(function(){
			if($.trim($('#memPw').val()) != $.trim($('#memPwCheck').val())){
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치하지 않습니다]");
				$('#memPwCheckLb').css("color","red");
			}else{
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치합니다]");
				$('#memPwCheckLb').css("color","green");
				
			}
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
	
	function startTimer(count, display) {
	
		var minutes, seconds;
        timer = setInterval(function () {
	        minutes = parseInt(count / 60, 10);
	        seconds = parseInt(count % 60, 10);
	 
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	 
	        display.html("&nbsp;&nbsp;("+minutes + ":" + seconds+")");
	 
	        // 타이머 끝
	        if (--count < 0) {
		    	clearInterval(timer);
		    	alert("시간초과");
		    	display.html("시간초과");
		    	isRunning = false;
		    	$('#mailcodeCheck').val("");
	        }
	    }, 1000);
	         isRunning = true;
	}
	
	/** 우편번호 찾기 */
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
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>회원가입</h2>
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
                                <span>I'm creater</span>
                            </a>
                        </li>

                        <!-- Company Account Tab -->
                        <li role="presentation" class="">
                            <a href="#company" aria-controls="company" role="tab" data-toggle="tab" aria-expanded="false">
                                <h6>기업회원</h6>
                                <span>We are looking for creater</span>
                            </a>
                        </li>
                    </ul>
                    <!-- End of Nav Tabs -->



                    <!-- Start of Tab Content -->
                    <div class="tab-content ptb60">

                        <!-- Start of Tabpanel for Personal Account -->
                        
                        <div role="tabpanel" class="tab-pane active" id="personal">
                            <div class="row">
                            <form method="post" action="<c:url value='/member/memberRegister'/>">
                            	<div class="col-md-4 col-md-offset-3">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>이메일</label>
                                        <input type="email" class="form-control" name="memId" id="memId">
                                    </div>
                                    
                                    
                       
                                </div>
                                
                                <div class="col-md-2">
                                	<div class="form-group">
                                		<label> </label>
                                    	<button type="button" style="margin-top: 5px" id="sendEmail"  class="btn btn-blue btn-effect form-control">인증번호 발송</button>
                                   	</div>
                                </div>
                                
                                <div class="col-md-6 col-md-offset-3">
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>인증번호 확인</label><label id="emailCnt" style="color: red"></label>
                                        <input type="text" class="form-control" id="mailcode">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="mailcodeCheck">
                                        <input type="hidden" class="form-control" id="ismailcodeCheck">
                                    </div>

                                </div>
                                
                                
                                <div class="col-md-6 col-md-offset-3">

                                    

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호</label>
                                        <input type="password" class="form-control" name="memPw" id="memPw">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group mb30">
                                        <label>비밀번호 확인</label><label id="memPwCheckLb" style="color: red"></label>
                                        <input type="password" class="form-control" id="memPwCheck">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" class="form-control" name="memName" id="memName">
                                    </div>
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>닉네임</label>
                                        <input type="text" class="form-control" name="memNick" id="memNick">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>생년월일</label>
                                        <input type="text" class="form-control" name="memBirth" id="memBirth" placeholder="예) 19930119">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="tel" class="form-control" name="memTel" id="memTel" placeholder="'-'를 제외한 전화번호 입력">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>우편번호</label>
                                        <input type="text" class="form-control" name="memZipcode" id="memZipcode" readonly="readonly">
                                    </div>
                                    
                                
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input type="text" class="form-control" name="memAdd" id="memAdd">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>상세주소</label>
                                        <input type="text" class="form-control" name="memAdd2" id="memAdd2">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group text-center nomargin">
                                        <button type="submit" id="btnMemSign" class="btn btn-blue btn-effect">회원가입</button>
                                    </div>

                                </div>
                                </form>
                            </div>
 
                        </div>
                        
                        <!-- End of Tabpanel for Personal Account -->

                        <!-- Start of Tabpanel for Company Account -->
                        <div role="tabpanel" class="tab-pane" id="company">
                            <div class="row">
							
                                <!-- Start of the First Column -->
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>E-mail</label>
                                        <input type="email" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <input type="password" class="form-control">
                                    </div>
                                </div>
                                <!-- End of the First Column -->

                                <!-- Start of the Second Column -->
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Company Name</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Website</label>
                                        <input type="text" class="form-control">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <!-- End of the Second Column -->
                            </div>

                            <div class="row mt20">
                                <div class="col-md-12 text-center">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <input type="checkbox" id="agree2">
                                        <label for="agree2">Agree with the <a href="#">Terms and Conditions</a></label>
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group nomargin">
                                        <button type="submit" class="btn btn-blue btn-effect">create account</button>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!-- End of Tabpanel for Company Account -->

                    </div>
                    <!-- End of Tab Content -->

                </div>
            </div>
        </div>
    </section>
    <!-- ===== End of Login - Register Section ===== -->
<%@ include file="../inc/footer.jsp" %>
