<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>


    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" id="find-candidate">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>크리에이터 찾기</h2>
                </div>
            </div>
            <!-- End of Page Title -->

        </div>
    </section>
    <!-- =============== End of Page Header 1 Section =============== -->





    <!-- ===== Start of Main Wrapper Section ===== -->
    <section class="find-candidate ptb80">
        <div class="container">

            <!-- Start of Form -->
            <form class="row" action="#" method="get">

                <!-- Start of keywords input -->
                <div class="col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2 col-xs-8">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="search-keywords" id="search-keywords" class="form-control" placeholder="Keywords">
                </div>

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-2 col-xs-4">
                    <button type="submit" class="btn btn-blue btn-effect"><i class="fa fa-search"></i>search</button>
                </div>

            </form>
            <!-- End of Form -->

            
            <!-- Start of Row -->
            <div class="row mt60">

                <!-- Start of Candidate Main -->
                <div class="col-md-12 candidate-main">

                    <!-- Start of Candidates Wrapper -->
                    <div class="candidate-wrapper">
						
						<c:forEach var="vo" items="${list }">
						
                        <!-- ===== Start of Single Candidate 1 ===== -->
                        <div class="single-candidate row nomargin">

                            <!-- Candidate Image -->
                            <div class="col-md-2 col-xs-3">
                                <div class="candidate-img" >
                                        <img src="<c:url value='/images/createrProfile/${vo.memPic}'/>" class="img-responsive" alt="" onerror="this.onerror=null; this.src='<c:url value='/images/createrProfile/user.png'/>'">
                                </div>
                            </div>

                            <!-- Start of Candidate Name & Info -->
                            <div class="col-md-8 col-xs-6 ptb20">

                                <!-- Candidate Name -->
                                <div class="candidate-name">
                                    <a href="<c:url value='/creater/createrDetail'/>"><h5>${vo.memNick }</h5></a>
                                </div>

                                <!-- Candidate Info -->
                                <div class="candidate-info mt5">
                                    <ul class="list-inline">
                                        <li>
                                            <span><i class="fa fa-envelope"></i>${vo.memId }</span>
                                        </li>

                                        <li>
                                            <span><i class="fa fa-inbox"></i>${vo.memItem } items</span>
                                        </li>

                                        <li>
                                            <span><i class="fa fa-handshake-o"></i>${vo.memComplete } contracts</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End of Candidate Name & Info -->

                            <!-- CTA -->
                            <div class="col-md-2 col-xs-3">
                                <div class="candidate-cta ptb30">
                                    <a href="<c:url value='/creater/createrDetail'/>" class="btn btn-blue btn-small btn-effect">상세보기</a>
                                </div>
                            </div>

                        </div>
                        <!-- ===== End of Single Candidate 1 ===== -->
                        </c:forEach>


                    </div>
                    <!-- End of Candidates Wrapper -->

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
                <!-- End of Candidate Main -->

            </div>
            <!-- End of Row -->

        </div>
    </section>
    <!-- ===== End of Main Wrapper Section ===== -->


<%@ include file="../inc/footer.jsp" %>