<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
 
 


    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>의뢰 게시판</h2>
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
    <section class="search-jobs ptb80" id="version4">
        <div class="container">

            <!-- Start of Form -->
            <form class="job-search-form row" action="#" method="get">

                <!-- Start of keywords input -->
                <div class="col-md-3 col-sm-12 search-keywords">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="search-keywords" class="form-control" id="search-keywords" placeholder="키워드">
                </div>

                <!-- Start of category input -->
                <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-categories">Category</label>
                    <select name="search-categories" class="selectpicker" id="search-categories" data-live-search="true" title="모든 카테고리" data-size="5" data-container="body">
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

                <!-- Start of location input -->
                <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-location">Location</label>
                     <select name="search-location" class="selectpicker" id="search-location" data-live-search="true" title="모든 지역" data-size="5" data-container="body">
                        <option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">인천</option>
                        <option value="4">대전</option>
                        <option value="5">세종</option>
                        <option value="6">충남</option>
                        <option value="7">충북</option>
                        <option value="8">광주</option>
                        <option value="9">전남</option>
                        <option value="10">전북</option>
                        <option value="11">대구</option>
                        <option value="12">걍븍</option>
                        <option value="13">부산</option>
                        <option value="14">울산</option>
                        <option value="15">경남</option>
                        <option value="16">강원</option>
                        <option value="17">제주</option>
                    </select>
                </div>

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-12 search-submit">
                    <button type="submit" class="btn btn-blue btn-effect"><i class="fa fa-search"></i>검색</button>
                </div>

            </form>
            <!-- End of Form -->


            <!-- Start of Row -->
            <div class="row mt60">

                <div class="col-md-12">
                <a href="<c:url value='/request/post'/>" class="btn btn-blue btn-effect" style="float: right;">의뢰 작성</a>
                    <h4>총 1건의 검색결과</h4>
                    
                </div>
                <!-- ===== Start of Job Post Column 1 ===== -->
                <div class="col-md-12 mt20">
                    <div class="item-block shadow-hover">

                        <!-- Start of Job Post Header -->
                        <div class="job-post-header clearfix">
                            <a href="company-page-1.html"><img src="images/companies/envato.svg" alt=""></a>
                            <div>
                                <a href="<c:url value='/request/detail'/>"><h4>3D 맵 개발자 구인</h4></a>
                                <h5><small>Envato</small></h5>
                            </div>

                            <ul class="pull-right">
                                <li>
                                    <h6 class="time">등록일: 2022-06-14</h6></li>
                                <li>
                                    <a href="#" class="btn btn-green btn-small btn-effect">즉시 지원</a>
                                </li>
                            </ul>

                        </div>
                        <!-- End of Job Post Header -->

                        <!-- Start of Job Post Body -->
                        <div class="job-post-body">
                            <p>Responsibilities:</p>
                            <ul class="list mt10">
                                <li>Designing modern and minimal PSD Templates</li>

                                <li>Converting PSD into HTML5 & CSS3</li>

                                <li>WordPress Theme Development</li>

                                <li>Troubleshooting, testing and maintaining web Themes</li>
                            </ul>
                        </div>
                        <!-- End of Job Post Body -->

                        <!-- Start of Job Post Footer -->
                        <div class="job-post-footer row" style="height: 50px;">

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <i class="fa fa-map-marker"></i>
                                <span>서울</span>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <i>pay:</i>
                                <span>$50,000 - $80,000</span>                          
                            </div>
                        </div>
                        <!-- End of Job Post Footer -->

                    </div>
                </div>
                <!-- ===== End of Job Post Column 1 ===== -->             

                <!-- Start of Pagination -->
                <div class="col-md-12 mt10">
                    <ul class="pagination list-inline text-center">
                        <li class="active"><a href="javascript:void(0)">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>
                </div>
                <!-- End of Pagination -->
                

            </div>
            <!-- End of Row -->

        </div>
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->






  



<%@ include file="../inc/footer.jsp"%>
    <!-- ===== Start of Login Pop Up div ===== -->
    