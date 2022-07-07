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
			
			//전체 체크
			$(document).on("click",".check-all",function(){
				var checkAll=$(this).find(".fa-regular");
				if($(checkAll).hasClass('fa-square')){
					$(checkAll).removeClass('fa-square').addClass('fa-square-check');
					$('input[type=checkbox]').prop("checked", true);
				}else{
					$(checkAll).removeClass('fa-square-check').addClass('fa-square');
					$('input[type=checkbox]').prop("checked", false);
				}
			});
			
			//체크된 항목 삭제 / 복구
			$(document).on("click",".btn-trash",function(){
				var trashFlag = "N";
				if($(this).hasClass("btn-trash-up")){
					trashFlag = "Y";
				}
				
				var msgaddNoList = []; 
				$('input[type=checkbox]:checked').closest('tr').find('.msgaddNo').each(function(idx, item){
					msgaddNoList.push($(this).val());
				});
				//console.log(msgaddNoList);
				
				if($('input[type=checkbox]:checked').length<1){
					alert('한 개 이상의 항목을 체크해야 합니다.');
					return false;
				}else{
					//목록에서 삭제
					$('input[type=checkbox]:checked').closest('tr').remove();
					
					$.ajax({
						url: "<c:url value='/mailbox/trashFlagUpdate'/>",
						type: "GET",
						data: {
							"trashFlag" : trashFlag,
							"msgaddNoList" : msgaddNoList
						},
						dataType: "JSON",
						traditional :true,
						success: function(data){
							//console.log(data);
							$('.receivedNo').text(data.receivedNo);
							$('.sentNo').text(data.sentNo);
							$('.starNo').text(data.starNo);
							$('.temporaryNo').text(data.temporaryNo);
							$('.spamNo').text(data.spamNo);
							$('.trashNo').text(data.trashNo);
						},
						error: function(xhr, status, error){
							alert('error:' + error);
						}
					});
				}
			});
			
			//체크된 항목 스팸함 이동 / 복구
			$(document).on("click",".btn-filter",function(){
				var spamFlag = "N";
				if($(this).hasClass("btn-filter-up")){
					spamFlag = "Y";
				}
				
				var msgaddNoList = []; 
				$('input[type=checkbox]:checked').closest('tr').find('.msgaddNo').each(function(idx, item){
					msgaddNoList.push($(this).val());
				});
				//console.log(msgaddNoList);
				
				if($('input[type=checkbox]:checked').length<1){
					alert('한 개 이상의 항목을 체크해야 합니다.');
					return false;
				}else{
					//목록에서 삭제
					$('input[type=checkbox]:checked').closest('tr').remove();
					
					$.ajax({
						url: "<c:url value='/mailbox/spamFlagUpdate'/>",
						type: "GET",
						data: {
							"spamFlag" : spamFlag,
							"msgaddNoList" : msgaddNoList
						},
						dataType: "JSON",
						traditional :true,
						success: function(data){
							//console.log(data);
							$('.receivedNo').text(data.receivedNo);
							$('.sentNo').text(data.sentNo);
							$('.starNo').text(data.starNo);
							$('.temporaryNo').text(data.temporaryNo);
							$('.spamNo').text(data.spamNo);
							$('.trashNo').text(data.trashNo);
						},
						error: function(xhr, status, error){
							alert('error:' + error);
						}
					});
				}
			});
			
			
			$(document).on("click",".star", function(){
				var msgaddNo = $(this).closest('tr').find('input[type=hidden]').val();
				//console.log(msgaddNo);
				
				if($(this).hasClass('fa-star')){
					//console.log("색칠된 별");
					var emptyFlag = false;
					$(this).removeClass('fa-star').addClass('fa-star-o');
				}else{
					//console.log("빈 별");
					var emptyFlag = true;
					$(this).removeClass('fa-star-o').addClass('fa-star');
				}
				
				if($(this).prev().val() == 'star'){
					$(this).closest('tr').remove();
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
			
			//받은 메세지
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
			
			//보낸 메세지
			$('.sentMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/sentMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//별표 메세지
			$('.starMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/starMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//휴지통
			$('.trashMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/trashMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//스팸함
			$('.spamMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/spamMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//임시보관함
			$('.temporaryMail').click(function(){
				$.ajax({
					url: "<c:url value='/mailbox/temporaryMail'/>",
					type: "GET",
					success: function(data){
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
                    <li><a href="#" class="receivedMail"><i class="fa fa-inbox"></i> 받은 메세지 <span class="label label-primary pull-right receivedNo">${receivedNo }</span></a></li>
                    <li><a href="#" class="sentMail"><i class="fa fa-envelope-o"></i> 보낸 메세지 <span class="label label-success pull-right sentNo">${sentNo }</span></a></li>
                    <li><a href="#" class="starMail"><i class="fa fa-star"></i> 별표 메세지 <span class="label label-waring pull-right starNo">${starNo }</span></a></li>
                    <li><a href="#" class="temporaryMail"><i class="fa fa-file-text-o"></i> 임시보관함 <span class="label label-info pull-right temporaryNo">${temporaryNo }</span></a></li>
                    <li><a href="#" class="spamMail"><i class="fa fa-filter"></i> 스팸함 <span class="label label-danger pull-right spamNo">${spamNo }</span></a></li>
                    <li><a href="#" class="trashMail"><i class="fa fa-trash-o"></i> 휴지통 <span class="label label-danger pull-right trashNo">${trashNo }</span></a></li>
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