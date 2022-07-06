<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp" %>

<script type=text/javascript>
		$(function(){
			$.ajax({ //페이지 로드 시 받은 메세지함 표시
				url: "<c:url value='/mailbox/receivedMail'/>",
				type: "GET",
				success: function(data){
					//console.log(data);
					$('.box.box-primary').html(data);
				},
				error: function(xhr, status, error){
					alert('error:' + error);
				}
			});
			
			$(document).on("click",".star", function(){
			//$('.star').click(function(){
				var msgaddNo = $(this).closest('tr').find('input[type=hidden]').val();
				//console.log(msgNo);
				
				if($(this).hasClass('fa-star')){
					//console.log("색칠된 별");
					var emptyFlag = false;
					$(this).removeClass('fa-star').addClass('fa-star-o');
				}else{
					//console.log("빈 별");
					var emptyFlag = true;
					$(this).removeClass('fa-star-o').addClass('fa-star');
				}
				
				$.ajax({
					url: "<c:url value='/mailbox/starFlagUpdate'/>",
					type: "GET",
					data: {
						msgaddNo : msgaddNo,
						emptyFlag : emptyFlag
					},
					success: function(data){
						//alert(data);
						$('.starNo').text(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});//ajax
			});
			
			$('.receivedMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/receivedMail'/>",
					type: "GET",
					success: function(data){
						//console.log(data);
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			$('.sentMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/sentMail'/>",
					type: "GET",
					success: function(data){
						//console.log(data);
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
		});
</script>
      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Messagebox
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
                    <li><a href="#" class="receivedMail"><i class="fa fa-inbox"></i> 받은 메세지 <span class="label label-primary pull-right">${receivedNo }</span></a></li>
                    <li><a href="#" class="sentMail"><i class="fa fa-envelope-o"></i> 보낸 메세지 <span class="label label-success pull-right">${sentNo }</span></a></li>
                    <li><a href="#"><i class="fa fa-star"></i> 별표 메세지 <span class="label label-waring pull-right starNo">${starNo }</span></a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i> 임시보관함 <span class="label label-info pull-right">${temporaryNo }</span></a></li>
                    <li><a href="#"><i class="fa fa-filter"></i> 스팸함 <span class="label label-danger pull-right">${spamNo }</span></a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통 <span class="label label-danger pull-right">${trashNo }</span></a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
              
              	<!-- ajax 결과 -->
              	
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