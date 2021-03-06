<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#pdPost').click(function(){
			if($('#pdPrice').val()===""){
				alert('모델 가격을 입력해주세요.');
				$('#pdPrice').focus();
				event.preventDefault();
			}else if(!validate_pay($('#pdPrice').val())){
				alert("모델 가격은 숫자만 입력해주세요.");
				$('#pdPrice').focus();
				event.preventDefault();
			};
			
		});
	});
	
	function validate_pay(pay) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(pay);
	}
</script>
    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style="margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>3D 모델 등록</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">3D 모델 등록</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->

    <!-- ===== Start of Main Wrapper Section ===== -->
    <section class="ptb80" id="post-job">
        <div class="container">

            <h3 class="uppercase text-blue">내용을 입력해주세요.</h3>

            <!-- Start of Post Job Form -->           
             
            <form method="post" action="<c:url value='/pd/pdPost'/>" class="post-job-resume mt50"
             enctype="multipart/form-data">

                <!-- Start of Job Details -->
             <h3 class="capitalize pb20">모델 정보</h3>
             <br>
                <div class="row">
                    <div class="col-md-12">

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>모델 제목</label>
                            <input class="form-control" name="pdName" id="pdName" type="text" required>
                        </div>

                        <!-- Form Group -->
						   <div class="form-group">
                            <label>카테고리</label>
                            <select id="cateNo" name="cateNo" class="selectpicker" data-size="5" data-container="body" required>
                                <option value="">카테고리 선택</option>
                                <!-- 반복문 시작 -->
								<c:forEach var="vo" items="${list}">
									<option value="${vo.cateNo}">
										${vo.cateName}
									</option>
								</c:forEach>
								<!-- 반복문 끝 -->
                            </select>
                        </div>
                    
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>모델 설명 <span></span></label>
                            <textarea class="tinymce" name="pdPre" id="pdPre"></textarea>
                        </div>
                        
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>모델 가격 </label>
                            <input class="form-control" name="pdPrice" id="pdPrice" type="text" placeholder='5000$'>
                        </div>
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>모델 업로드 <span>(zip,Gltf파일만 가능)</span></label>
                            
                            <!-- Upload Button -->
                            <div class="upload-file-btn">
                                <span><i class="fa fa-upload"></i> Upload</span>
                                <input class="form-control" type="file" id="pdFilename"
                                name="upfile" accept=".zip,.gltf">
                            </div>
                        </div>

                    </div>
                </div>
                <!-- End of Job Details -->




<!--                 Start of Company Details
                <div class="row mt30">
                    <div class="col-md-12">
                        <h3 class="capitalize pb20">기업 정보</h3>
                        <br>
                        
                        Form Group
                        <div class="form-group">
                            <label>기업명</label>
                            <input class="form-control" type="text" placeholder='기업 이름 입력' required>
                        </div>
                        
                        Form Group
                        <div class="form-group">
                            <label>웹사이트 <span>(선택사항)</span></label>
                            <input class="form-control" type="text" placeholder='http://your-company-website.com'>
                        </div>
                        
                        <div class="form-group">
                            <label>트위터 유저네임 <span>(선택사항)</span></label>
                            <input class="form-control" type="text" placeholder='@yourcompany'>
                        </div>
                        
                        Form Group
                        <div class="form-group">
                            <label>한줄 설명 <span>(선택사항)</span></label>
                            <input class="form-control" type="text" placeholder='기업에 대한 한 줄 설명을 써주세요.'>
                        </div>
                        
                        Form Group
                        <div class="form-group">
                            <label>기업 로고 <span>(선택사항)</span></label>
                            
                            Upload Button
                            <div class="upload-file-btn">
                                <span><i class="fa fa-upload"></i> 업로드</span>
                                <input type="file" name="application_attachment" accept=".jpg,.png,.gif">
                            </div>
                        </div>
                        
 -->                        <!-- Form Group -->
                        <div class="form-group pt30 nomargin" id="last">
                            <button type="submit" class="btn btn-blue btn-effect" id="pdPost">등록</button>
                        </div>
                        
                        
                    </div>
                </div>
                <!-- End of Company Details -->


            </form>
            <!-- End of Post Job Form -->

        </div>
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->



<%@ include file="../inc/footer.jsp"%>

