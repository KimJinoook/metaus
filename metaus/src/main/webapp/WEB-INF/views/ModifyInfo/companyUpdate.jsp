<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>
<style>
.thumb {
	width: 200px;
	height: 140px;
}
</style>



	<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container"  style="margin-top: 94px;">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>기업회원 - (${comVo.comName })정보수정</h2>
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
                        <!-- Start of Tabpanel for Company Account -->
                        <div role="tabpanel" class="tab-pane active" id="company">
                            <div class="row">
                            <form method="post" enctype="multipart/form-data" 
                            action="<c:url value='/ModifyInfo/companyUpdate'/>">

                                <!-- Start of the First Column -->
                                <div class="col-md-6">

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>아이디</label>
                                        <input type="text" class="form-control" id="comId" name="comId" disabled="disabled"
                                        value="${comVo.comId }">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>비밀번호</label>
                                        <input type="password" class="form-control" id="comPw" name="comPw">
                                        <input type="hidden" class="form-control" id="comPwCheck" name="comPwCheck"
                                        value="${comVo.comPw }">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>회사명</label>
                                        <input type="text" class="form-control" id="comName" name="comName"
                                        value="${comVo.comName }">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input type="text" class="form-control" id="comAdd" name="comAdd"
                                        value="${comVo.comAdd }">
                                        <input type="hidden" class="form-control" id="comLati" name="comLati">
                                        <input type="hidden" class="form-control" id="comLongi" name="comLongi">
                                    </div>
                                    
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>사업자 등록번호</label>
                                        <input type="text" class="form-control" id="comRrn" name="comRrn"  placeholder="'-'를 제외한 등록번호 입력"
                                        value="${comVo.comRrn }">
                                        <input type="hidden" class="form-control" id="isComRrnCheck" name="isComRrnCheck">
                                    </div>
                                </div>
                                <!-- End of the First Column -->

	                                
                                
                                
                                <div class="col-md-6">


                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>대표자명</label>
                                        <input type="text" class="form-control" id="comCeo" name="comCeo"
                                         value="${comVo.comCeo }">
                                    </div>

                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="tel" class="form-control" id="comTel" name="comTel" placeholder="'-'를 제외한 전화번호 입력"
                                         value="${comVo.comTel }">
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
                                <div class="col-md-6">
                                <label>기업로고</label>
                                	 <input type="file" class="hidden_input" id="imageSelector"
												name="upfile" accept="image/jpeg, image/jpg, image/png"
												multiple /> <img src="" class="thumb" /> <a
												href="javascript:void(0);" class="dellink">[이미지 삭제]</a>
                                </div>
                                
                                <div class="col-md-12">
                                    <!-- Form Group -->
                                    <div class="form-group">
                                        <label>기업소개</label>
                                        <input type="text" class="form-control" name="comPreview" id="comPreview"
                                        value="${comVo.comPreview }">
                                    </div>
                                </div>
                                <!-- End of the Second Column -->
                                 <div class="col-md-12 text-center">

                                    <!-- Form Group -->
                                    <div class="form-group nomargin">
                                        <button type="submit" id="btnComSign" class="btn btn-blue btn-effect">정보수정</button>
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
		/** 기업회원 유효성검사*/
		$('#btnComSign').click(function() {
			if ($.trim($('#comPw').val()).length < 1) {
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

			}
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
		
		/**기업회원 주소찾기*/
		$('#comAdd').click(function(){
			execDaumPostcode2();
			
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
