<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp" %>

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Messagebox
            <small>13 new messages</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Messagebox</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-3">
              <a href="<c:url value='/mailbox/compose'/>" class="btn btn-primary btn-block margin-bottom">메세지 작성</a>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Folders</h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="<c:url value='/mailbox/receivedMail'/>"><i class="fa fa-inbox"></i> 받은 메세지 <span class="label label-primary pull-right">${receivedNo }</span></a></li>
                    <li><a href="<c:url value='/mailbox/sentMail'/>"><i class="fa fa-envelope-o"></i> 보낸 메세지 <span class="label label-success pull-right">${sentNo }</span></a></li>
                    <li><a href="#"><i class="fa fa-star"></i> 별표 메세지</a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i> 임시보관함</a></li>
                    <li><a href="#"><i class="fa fa-filter"></i> 스팸함 <span class="label label-waring pull-right">65</span></a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">
	                  <c:choose>
						  <c:when test="${flag eq 'received'}">
						  	받은 메세지
						  </c:when>
						  <c:when test="${flag eq 'sent'}">
						  	보낸 메세지
						  </c:when>
					  </c:choose>
                  </h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                      <input type="text" class="form-control input-sm" placeholder="메세지 검색"/>
                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                    </div><!-- /.btn-group -->
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    <div class="pull-right">
                      1-50/200
                      <div class="btn-group">
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                      </div><!-- /.btn-group -->
                    </div><!-- /.pull-right -->
                  </div>
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                      	<!-- 메세지 목록 반복 시작 -->
                      	<c:forEach var="map" items="${list }">
	                        <tr>
	                          <td><input type="checkbox" /></td>
	                          <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
	                          <td class="mailbox-name">
		                          <a href='<c:url value="/mailbox/mailDetail?msgNo=${map['MSG_NO']}" />'>
			                          <c:choose>
										  <c:when test="${flag eq 'received'}">
										  	<!-- 받은 메세지일 때 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSER']}">
				                          		나
				                          	</c:if>
				                          	<c:if test="${sessionScope.memId ne map['MSGADD_ADSER']}">
				                          		${map['MSGADD_ADSER']}
				                          	</c:if>
										  </c:when>
										  <c:when test="${flag eq 'sent'}">
										  	<!-- 보낸 메세지일 때 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSEE']}">
				                          		나
				                          	</c:if>
				                          	<c:if test="${sessionScope.memId ne map['MSGADD_ADSEE']}">
				                          		${map['MSGADD_ADSEE']}
				                          	</c:if>
										  </c:when>
									  </c:choose>
		                          </a>
	                          </td>
	                          <% pageContext.setAttribute("newLine", "\r\n"); %>
	                          <td class="mailbox-subject"><b>${map['MSG_TITLE']}</b> - 
		                          <c:choose>
									  <c:when test="${fn:length(fn:replace(map['MSG_CONTENT'], newLine, '<br>')) gt 40}">
									  	<c:out value="${fn:substring(fn:replace(map['MSG_CONTENT'], newLine, ' '), 0, 39)}"></c:out>...
									  </c:when>
									  <c:otherwise>
									  	<c:out value="${fn:replace(map['MSG_CONTENT'], newLine, ' ')}"></c:out>
									  </c:otherwise>
								  </c:choose>
	                          </td>
	                          <td class="mailbox-attachment"></td>
	                          <td class="mailbox-date">${map['SEND_DATE']} 5 mins ago</td>
	                        </tr>
                        </c:forEach>
                        <!-- 메세지 목록 반복 끝 -->
                        <tr>
                          <td><input type="checkbox" /></td>
                          <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                          <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
                          <td class="mailbox-subject"><b>첨부파일 있을 때</b> - Trying to find a solution to this problem...</td>
                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                          <td class="mailbox-date">28 mins ago</td>
                        </tr>
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                <div class="box-footer no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>                    
                    <div class="btn-group">
                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                    </div><!-- /.btn-group -->
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    <div class="pull-right">
                      1-50/200
                      <div class="btn-group">
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                      </div><!-- /.btn-group -->
                    </div><!-- /.pull-right -->
                  </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->
	
	<%@ include file="../layout/sidebar_function_bottom.jsp" %>
  </body>
</html>