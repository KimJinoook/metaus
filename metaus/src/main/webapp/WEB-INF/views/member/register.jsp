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
                            <form method="post" action="<c:url value='/member/memberRegister'/>"  id="registerFrm">
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
                                        <button type="button" id="btnMemSign" class="btn btn-blue btn-effect">회원가입</button>
                                    </div>

                                </div>
                                </form>
                            </div>
 
                        </div>
                        
                        <!-- End of Tabpanel for Personal Account -->

                        <!-- Start of Tabpanel for Company Account -->
                        <div role="tabpanel" class="tab-pane" id="company">
                            <div class="row">
                            <form method="post" action="<c:url value='/company/companyRegister'/>" id="comregisterFrm">

                                <!-- Start of the First Column -->
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>아이디</label>
                                        <input type="text" class="form-control" id="comId" name="comId">
                                        <input type="hidden" class="form-control" id="isComIdCheck" name="comIdCheck">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호</label>
                                        <input type="password" class="form-control" id="comPw" name="comPw">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>회사명</label>
                                        <input type="text" class="form-control" id="comName" name="comName">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input type="text" class="form-control" id="comAdd" name="comAdd">
                                        <input type="hidden" class="form-control" id="comLati" name="comLati">
                                        <input type="hidden" class="form-control" id="comLongi" name="comLongi">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>사업자 등록번호</label>
                                        <input type="text" class="form-control" id="comRrn" name="comRrn"  placeholder="'-'를 제외한 등록번호 입력">
                                        <input type="hidden" class="form-control" id="isComRrnCheck" name="isComRrnCheck">
                                    </div>
                                </div>
                                <!-- End of the First Column -->

                                <!-- Start of the Second Column -->
                                <div class="col-md-2">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label> </label>
                                    	<button type="button" style="margin-top: 5px;margin-bottom:5px" id="comIdCheck"  class="btn btn-blue btn-effect form-control">중복확인</button>
                                   	</div>
                                </div>
                                
                                
                                
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호 확인</label><label id="comPwCheckLb" style="color: red"></label>
                                        <input type="password" class="form-control" id="comPwCheck">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>대표자명</label>
                                        <input type="text" class="form-control" id="comCeo" name="comCeo">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="tel" class="form-control" id="comTel" name="comTel" placeholder="'-'를 제외한 전화번호 입력">
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label>개업일</label>
                                    	<input type="text" class="form-control" id="comOpen" placeholder="예) 20010101">
                                   	</div>
                                </div>
                                <div class="col-md-2">
                                	 <!-- Form Group -->
                                    <div class="form-group">
                                		<label> </label>
                                    	<button type="button" style="margin-top: 5px" id="comRrnCheck"  class="btn btn-blue btn-effect form-control">등록번호 확인</button>
                                   	</div>
                                </div>
                                
                                <div class="col-md-12">
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>기업소개</label>
                                        <input type="text" class="form-control" name="comPreview" id="comPreview">
                                    </div>
                                </div>
                                <!-- End of the Second Column -->
                                 <div class="col-md-12 text-center">

                                    <!-- Form Group -->
                                    <div class="form-group nomargin">
                                        <button type="button" id="btnComSign" class="btn btn-blue btn-effect">회원가입</button>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=48fd685b6c1070cc71f894be6653d843&libraries=services"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>
<script type="text/javascript">
	var timer = null;
	var isRunning = false;
	
	$(function() {
		/** 일반회원 유효성검사*/
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
			}else{
				var inputText = $('#memPw').val();
				
				var rsaPkModule = $('#publicKeyModule').val();
				var rsaPkExponent = $('#publicKeyExponent').val();
				
				var rsa = new RSAKey();
				rsa.setPublic(rsaPkModule,rsaPkExponent);
				
				var securedPw = rsa.encrypt(inputText);
				$('#memPw').val(securedPw);
				$('#registerFrm').submit();
			}
		});
		
		/** 기업회원 유효성검사*/
		$('#btnComSign').click(function() {
			if ($('#isComIdCheck').val() != 'Y' ) {
				alert("아이디 중복확인이 필요합니다.");
				$('#comId').focus();
				event.preventDefault();

			} else if ($.trim($('#comPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#comPw').focus();
				event.preventDefault();

			} else if ($.trim($('#comPw').val()) != $.trim($('#comPwCheck').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#comPwCheck').focus();
				event.preventDefault();
						
			} else if ($.trim($('#comName').val())=="") {
				alert("회사명을 입력해주세요.");
				$('#comName').focus();
				event.preventDefault();
						
			} else if ($.trim($('#comCeo').val())=="") {
				alert("대표자명을 입력해주세요.");
				$('#comCeo').focus();
				event.preventDefault();
						
			} else if ($.trim($('#comAdd').val())=="") {
				alert("주소를 입력해주세요.");
				event.preventDefault();
						
			} else if(!validate_tel($('#comTel').val())){
				alert("전화번호는 숫자만 입력해주세요.");
				$('#comTel').focus();
				event.preventDefault();				
			} else if ($.trim($('#comRrn').val()).length < 1) {
				alert("사업자등록번호를 입력해주세요");
				$('#comRrn').focus();
				event.preventDefault();

			} else if ($('#isComRrnCheck').val() != 'Y') {
				alert("사업자등록번호 인증이 필요합니다");
				$('#comRrn').focus();
				event.preventDefault();

			}else{
				var inputText = $('#comPw').val();
				
				var rsaPkModule = $('#publicKeyModule').val();
				var rsaPkExponent = $('#publicKeyExponent').val();
				
				var rsa = new RSAKey();
				rsa.setPublic(rsaPkModule,rsaPkExponent);
				
				var securedPw = rsa.encrypt(inputText);
				$('#comPw').val(securedPw);
				$('#comregisterFrm').submit();
			}
		});
		
		/** 일반회원 이메일 인증 */
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
					    		$('#emailCnt').css("color","red");
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
		
		/**일반회원 인증번호 입력*/
		$('#mailcode').keyup(function(){
			if($.trim($('#mailcode').val()) == $.trim($('#mailcodeCheck').val())){
				clearInterval(timer);
				$('#emailCnt').html("&nbsp;&nbsp;[인증번호 일치]");
				$('#emailCnt').css("color","green");
			}
		});
		
		/** 기업회원 아이디중복확인 */
		$('#comIdCheck').click(function(){
			
			var id = $('#comId').val();
			var getdata;

			$.ajax({
				url: "<c:url value='/company/comIdCheck'/>"+"?id="+id,
				type:"get",
				async:false,
				success:function(data){
					if(data==1){
						alert('사용가능한 아이디 입니다.');
						$('#isComIdCheck').val('Y');
						
					}else if(data==2){
						alert('이미 사용중인 계정입니다.');
						$('#comId').val("");
					}else{
						alert('아이디 중복 체크가 실패했습니다.');
					}
				}
			});
			event.preventDefault();			
			
		});
		
		/** 기업회원 사업자 등록번호 확인 */
		$('#comRrnCheck').click(function(){
			
			if ($.trim($('#comCeo').val()).length < 1) {
				alert("대표자명을 입력해주세요.");
				$('#comCeo').focus();
				event.preventDefault();

			}else if ($.trim($('#comRrn').val()).length < 1) {
				alert("사업자 등록번호를 입력해주세요.");
				$('#comRrn').focus();
				event.preventDefault();

			}else if ($.trim($('#comOpen').val()).length < 1) {
				alert("개업일 입력해주세요.");
				$('#comOpen').focus();
				event.preventDefault();

			}else if(!validate_tel($('#comRrn').val())){
				alert("사업자 등록번호는 숫자만 입력해주세요.");
				$('#comRrn').focus();
				event.preventDefault();				
			}else if(!validate_tel($('#comOpen').val())){
				alert("개업일 숫자만 입력해주세요.");
				$('#comOpen').focus();
				event.preventDefault();				
			}  else{
				var name = $('#comCeo').val();
				var open = $('#comOpen').val();
				
				var rrn = $('#comRrn').val();
				var data = {
						"b_no" : [rrn]
				};
				
				var data2 = {
						"businesses": [
						    {
						      "b_no": rrn,
						      "start_dt": open,
						      "p_nm": name
						    }
						  ]
				}

				$.ajax({
					url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=aKSHxC3JN3xtPxQP64ysM2CE9UhYKMLXVKM9w7aL7WiHH6dYWKgG%2FJaYTvF0O82Dawkq6c%2ByK0ByxSovTdkXHw%3D%3D",
					type:"POST",
					data: JSON.stringify(data2),
					dataType: "JSON",
					contentType: "application/json",
					
					async:false,
					success: function(result) {
					      if(result.data[0].valid=='02'){
					    	  alert('사업자 정보가 일치하지 않습니다.');
					      }else if(result.data[0].valid=='01'){
					    	  alert('사업자 정보가 확인되었습니다');
					    	  $('#isComRrnCheck').val('Y');
					      }
					  },
					  error: function(result) {
					      alert('사업자 정보 확인에 실패했습니다.');
					  }
				});
				event.preventDefault();	
			}
			
					
			
		});
		
		/**일반회원 주소찾기*/
		$('#memZipcode').click(function(){
			execDaumPostcode();
		});
		
		/**기업회원 주소찾기*/
		$('#comAdd').click(function(){
			execDaumPostcode2();
			
		});
		
		/**일반회원 비밀번호 확인*/
		$('#memPwCheck').keyup(function(){
			if($.trim($('#memPw').val()) != $.trim($('#memPwCheck').val())){
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치하지 않습니다]");
				$('#memPwCheckLb').css("color","red");
			}else{
				$('#memPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치합니다]");
				$('#memPwCheckLb').css("color","green");
				
			}
		});
		
		/**기업회원 비밀번호 확인*/
		$('#comPwCheck').keyup(function(){
			if($.trim($('#comPw').val()) != $.trim($('#comPwCheck').val())){
				$('#comPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치하지 않습니다]");
				$('#comPwCheckLb').css("color","red");
			}else{
				$('#comPwCheckLb').html("&nbsp;&nbsp;[비밀번호 확인이 일치합니다]");
				$('#comPwCheckLb').css("color","green");
				
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
		    	display.html("&nbsp;&nbsp;시간초과");
		    	isRunning = false;
		    	$('#mailcodeCheck').val("");
	        }
	    }, 1000);
	         isRunning = true;
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
	/** 기업회원 우편번호 찾기 */
	function execDaumPostcode2() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	              $("#comAdd").val(data.roadAddress);
	              mapsearch();
	            }
	        }).open();
	    });
	}
	
	/** 기업 주소 위도경도로 변환*/
	function mapsearch(){
		var address = $('#comAdd').val();
		var geocoder2 = new kakao.maps.services.Geocoder();
		geocoder2.addressSearch(address, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        
		        $('#comLati').val(result[0].y);
		    	$('#comLongi').val(result[0].x);
		    } 
		});	
	}
</script>
    <!-- ===== End of Login - Register Section ===== -->
<%@ include file="../inc/footer.jsp" %>
