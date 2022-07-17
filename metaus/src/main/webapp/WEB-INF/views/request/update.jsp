<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>





    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>의뢰 글 수정</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">for metaus</li>
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
            
           
             
            <form method="post" action="<c:url value='/request/update'/>" class="post-job-resume mt50" enctype="multipart/form-data">
			<input type="hidden" name="comId" value="${comId }">
			 <input type="hidden" name="recNo" id="recNo" value="${vo.recNo }">
                <!-- Start of Job Details -->
             <h3 class="capitalize pb20">의뢰 정보</h3>
             <br>
                <div class="row">
                    <div class="col-md-12">

                        <!-- Form Group -->

                        <!-- Form Group -->
                        <div class="form-group">
                            <label>의뢰 제목</label>
                            <input class="form-control" name="recTitle" id="recTitle" type="text" required value="${vo.recTitle }">
                        </div>

                        <!-- Form Group -->
                     

                        <!-- Form Group -->
                      <!--   <div class="form-group">
                            <label>카테고리</label>
                            <select name="job-type" class="selectpicker" data-size="5" data-container="body" required>
                                <option value="">카테고리 선택</option>
                                <option value="1">Accountance</option>
                                <option value="2">Banking</option>
                                <option value="3">Design & Art</option>
                                <option value="4">Developement</option>
                                <option value="5">Insurance</option>
                                <option value="6">IT Engineer</option>
                                <option value="7">Healthcare</option>
                                <option value="8">Marketing</option>
                                <option value="9">Management</option>
                            </select>
                        </div>
                         -->
                    
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>의뢰 설명</label>
                            <textarea class="tinymce" name="recContent" id="recContent">${vo.recContent }</textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>주요 요구 사항</label>
                            <textarea class="tinymce" name="recContent2" id="recContent2">${vo.recContent2 }</textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>주요 제안 사항</label>
                            <textarea class="tinymce" name="recContent3" id="recContent3">${vo.recContent3 }</textarea>
                        </div>
                        
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>페이 <span>(선택사항)</span></label>
                            <input class="form-control" name="recPay" id="recPay" type="text" value="${vo.recPay }">
                        </div>
                        
                         <div class="form-group">
                            <label>웹사이트 링크 <span>(선택사항)</span></label>
                            <input class="form-control" type="text"  name="recWeb" id="recWeb" value="${vo.recWeb }">
                        </div>
                        
                        <div class="form-group">
                            <label>트위터 링크 <span>(선택사항)</span></label>
                            <input class="form-control" type="text" name="recTwitter" id="recTwitter" value="${vo.recTwitter }">
                        </div>
                        
                        <!-- Form Group -->
                        <div class="form-group">
                            <label>헤더 이미지 <span>(선택사항)</span></label>
                            
                            <!-- Upload Button -->
                            <div class="upload-file-btn">
                                <span><i class="fa fa-upload"></i> Upload</span>
                                <input class="form-control" type="file" name="upfile" accept=".jpg,.png,.gif">
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
                            <button type="submit" class="btn btn-blue btn-effect">등록</button>
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

