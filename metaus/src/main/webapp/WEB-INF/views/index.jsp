<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/header.jsp" %>

	 <!-- ===== Start of Main Search Section ===== -->
    <section class="main overlay-black">

        <!-- Start of Wrapper -->
        <div class="container wrapper">
            <h1 class="capitalize text-center text-white">your career starts now</h1>

            <!-- Start of Form -->
            <form class="job-search-form row pt40" action="#" method="get">

                <!-- Start of keywords input -->
                <div class="col-md-3 col-sm-12 search-keywords">
                    <label for="search-keywords">Keywords</label>
                    <input type="text" name="search-keywords" id="search-keywords" placeholder="Keywords">
                </div>

                <!-- Start of category input -->
                <div class="col-md-3 col-sm-12 search-categories">
                    <label for="search-categories">Category</label>
                    <select name="search-categories" class="selectpicker" id="search-categories" data-live-search="true" title="Any Category" data-size="5" data-container="body">
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
                <div class="col-md-4 col-sm-12 search-location">
                    <label for="search-location">Location</label>
                    <input type="text" name="search-location" id="search-location" placeholder="Location">
                </div>

                <!-- Start of submit input -->
                <div class="col-md-2 col-sm-12 search-submit">
                    <button type="submit" class="btn btn-blue btn-effect btn-large"><i class="fa fa-search"></i>search</button>
                </div>

            </form>
            <!-- End of Form -->

            <div class="extra-info pt20">
                <span class="text-left text-white"><b>36</b> job offers for <b>you.</b></span>
                <a href="#" class="capitalize pull-right text-white">advanced search</a>
            </div>

        </div>
        <!-- End of Wrapper -->

    </section>
    <!-- ===== End of Main Search Section ===== -->





    <!-- ===== Start of Popular Categories Section ===== -->
    <section class="ptb80" id="categories">
        <div class="container">

            <div class="section-title">
                <h2>popular categories</h2>
            </div>

            <div class="row nomargin">
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-line-chart"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">accountance</a>
                            <p>(9 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-university"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">banking</a>
                            <p>(9 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-pencil"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">design & art</a>
                            <p>(36 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-umbrella"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">insurance</a>
                            <p>(6 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->
            </div>

            <div class="row pt40 nomargin">
                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-desktop"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">IT engineer</a>
                            <p>(22 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-line-chart"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">healthcare</a>
                            <p>(14 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-heart"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">marketing</a>
                            <p>(7 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->

                <!-- Start of Category div -->
                <div class="col-md-3 col-sm-6 col-xs-12 cat-wrapper">
                    <div class="category ptb30">

                        <!-- Icon -->
                        <div class="category-icon">
                            <i class="fa fa-lightbulb-o"></i>
                        </div>

                        <!-- Category Info - Title -->
                        <div class="category-info pt30">
                            <a href="#">management</a>
                            <p>(4 open positions)</p>
                        </div>

                        <!-- Category Description -->
                        <div class="category-descr">
                            <span>Lorem Ipsum is simply dummy text of the printing industry. Lorem has been the standard dummy text since 1500s.</span>
                        </div>

                    </div>
                </div>
                <!-- End of Category div -->
            </div>

            <div class="col-md-12 mt60 text-center">
                <a href="search-jobs-1.html" class="btn btn-blue btn-effect nomargin">browse all</a>
            </div>	

        </div>
    </section>
    <!-- ===== End of Popular Categories Section ===== -->
<%@ include file="inc/footer.jsp" %>
