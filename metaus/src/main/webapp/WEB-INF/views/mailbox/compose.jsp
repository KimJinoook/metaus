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
              <a href="<c:url value='/mailbox/mailbox'/>" class="btn btn-primary btn-block margin-bottom">받은 메세지함</a>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Folders</h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="mailbox.html"><i class="fa fa-inbox"></i> 받은 메세지 <span class="label label-primary pull-right">12</span></a></li>
                    <li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 메세지</a></li>
                    <li><a href="#"><i class="fa fa-star"></i> 별표 메세지</a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i> 임시보관함</a></li>
                    <li><a href="#"><i class="fa fa-filter"></i> 스팸함 <span class="label label-waring pull-right">65</span></a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            <div class="col-md-9">
            <form name="frm" action="<c:url value='/mailbox/sendMail' />" method="post" enctype="multipart/form-data">
	              <div class="box box-primary">
	                <div class="box-header with-border">
	                  <h3 class="box-title">
	                  	<c:if test="${not empty map}">
	                  		임시저장
	                  	</c:if>
	                  	<c:if test="${empty map}">
	                  		새 메세지
	                  	</c:if>
	                  </h3>
	                </div><!-- /.box-header -->
	                <div class="box-body">
	                  <div class="form-group">
	                    <input type="text" class="form-control" name="msgaddAdsee" id="msgaddAdsee" 
	                    	placeholder="받는사람: example@example.com" value="${map['MSGADD_ADSEE'] }"/>
	                  </div>
	                  <div class="form-group">
	                    <input type="text" class="form-control" name="msgTitle" placeholder="제목:" value="${map['MSG_TITLE'] }"/>
	                  </div>
	                  <div class="form-group">
	                    <textarea id="compose-textarea" name="msgContent" 
	                    	class="form-control" style="height: 300px">${map['MSG_CONTENT'] }</textarea>
	                  </div>
	                  <div class="form-group">
	                    <div class="btn btn-default btn-file">
	                    	<i class="fa fa-paperclip"></i> 첨부파일
	                      	<input type="file" id="attachment" name="attachment" multiple/>
	                    </div>
	                    <p class="help-block">최대용량: 5MB</p>
	                  </div>
	                </div><!-- /.box-body -->
	                <div class="box-footer">
	                  <div class="pull-right">
	                    <button class="btn btn-default temporary"><i class="fa fa-pencil"></i> 임시저장</button>
	                    <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 보내기</button>
	                  </div>
	                  <button class="btn btn-default"><i class="fa fa-times"></i> 취소</button>
	                </div><!-- /.box-footer -->
	              </div><!-- /. box -->
	              <input type="hidden" value="N" name="temporaryFlag" id="temporaryFlag">
              </form>
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
	<script type="text/javascript">
		$(function(){
			$('button[type=submit]').click(function(){
				event.preventDefault();
				
				if($.trim($('#msgaddAdsee').val())<1){
					alert("받는 사람을 입력하세요.");
					return false;
				}
				
				if(${not empty map}){
					var temporaryFlagUpdate = "${pageContext.request.contextPath}/mailbox/temporaryFlagUpdate?msgaddNo="+${map['MSGADD_NO']}
					$('form[name=frm]').attr("action", temporaryFlagUpdate);
					$('form[name=frm]').submit();
					return false;
				}
				
				$('form[name=frm]').submit();
			});
			
			$('.temporary').click(function(){
				event.preventDefault();
				
				$('form[name=frm]').find('#temporaryFlag').attr("value", "Y");
				
				if($.trim($('#msgaddAdsee').val())<1){
					$('form[name=frm]').find('#msgaddAdsee').val("임시저장");
				}
				
				$('form[name=frm]').submit();
			});
			
		});
	</script>
  </body>
</html>