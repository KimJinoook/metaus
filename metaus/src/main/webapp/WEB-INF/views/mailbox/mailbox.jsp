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
			
			//별표 클릭
			$(document).on("click",".star", function(){
				var msgaddNo = $(this).closest('tr').find('input[type=hidden]').val();
				console.log(msgaddNo);
				
				if($(this).hasClass('fa-star')){
					console.log("색칠된 별");
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
			$(document).on("click",".receivedMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/receivedMail'/>",
					type: "GET",
					success: function(data){
						//console.log(data);
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//보낸 메세지
			$(document).on("click",".sentMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/sentMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//별표 메세지
			$(document).on("click",".starMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/starMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//휴지통
			$(document).on("click",".trashMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/trashMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//스팸함
			$(document).on("click",".spamMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/spamMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//임시보관함
			$(document).on("click",".temporaryMail",function(){
				$.ajax({
					url: "<c:url value='/mailbox/temporaryMail'/>",
					type: "GET",
					success: function(data){
						$('.box.box-primary').html(data);
						$('.btn-compose').text("메세지 작성");
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//메세지 작성
			$(document).on("click",".btn-compose",function(){
				if($(this).text()=='메세지 작성'){
					$.ajax({
						url: "<c:url value='/mailbox/ajaxCompose'/>",
						type: "GET",
						success: function(data){
							$('.box.box-primary').html(data);
							$('.btn-compose').text("받은 메세지");
						},
						error: function(xhr, status, error){
							alert('error:' + error);
						}
					});
				}else{
					$.ajax({
						url: "<c:url value='/mailbox/receivedMail'/>",
						type: "GET",
						success: function(data){
							$('.box.box-primary').html(data);
							$('.btn-compose').text("메세지 작성");
						},
						error: function(xhr, status, error){
							alert('error:' + error);
						}
					});
				}
			});
			
			//ajaxCompose event
			//임시저장 or 보내기 버튼 클릭
			$(document).on("click",".btn-message",function(){
				event.preventDefault();
				
				if($(this).hasClass("temporary")){
					$('form[name=frm]').find('#temporaryFlag').attr("value", "Y");
					
					if($.trim($('#msgaddAdsee').val())<1){
						$('form[name=frm]').find('#msgaddAdsee').val("임시저장");
					}
					
					var temporaryNo = $('.temporaryNo').text();
					temporaryNo = Number(temporaryNo) + 1;
					$('.temporaryNo').text(temporaryNo);
				}else{
					if($.trim($('#msgaddAdsee').val())<1){
						alert("받는 사람을 입력하세요.");
						return false;
					}
					
					/* if($('#ajaxTemporaryFlag').val() == 'Y'){
						url = "<c:url value='/mailbox/temporaryFlagUpdate' />";
					} */
				
					var sentNo = $('.sentNo').text();
					sentNo = Number(sentNo) + 1;
					$('.sentNo').text(sentNo);
					
					if("${memId}" == $('#msgaddAdsee').val()){
						var receivedNo = $('.receivedNo').text();
						receivedNo = Number(receivedNo) + 1;
						$('.receivedNo').text(receivedNo);
					}
				}
				
				var form = document.querySelector("form");
			    var formData = new FormData(form);
			    for (var i = 0; i < filesArr.length; i++) {
			        // 삭제되지 않은 파일만 폼데이터에 담기
			        if (!filesArr[i].is_delete) {
			            formData.append("attachment", filesArr[i]);
			        }
			    }
			    
				$.ajax({
					url: "<c:url value='/mailbox/sendMail'/>",
					type: "POST",
					data: formData,
					cache: false,
					contentType : false,
					processData : false,
					success: function(data){
						$('.btn-compose').text("메세지 작성");
						$('.box.box-primary').html(data);
						$.ajax({
							url: "<c:url value='/mailbox/updateMailboxNo'/>",
							type: "GET",
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
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//메세지 상세보기
			$(document).on("click", ".message-detail", function(){
				var msgaddNo = $(this).closest('tr').find('.msgaddNo').val();
				var msgNo = $(this).closest('tr').find('.msgNo').val();
				//alert(msgaddNo);
				$.ajax({
					url: "<c:url value='/mailbox/mailDetail'/>",
					type: "GET",
					data: {
						"msgaddNo" : msgaddNo,
						"msgNo" : msgNo
					},
					success: function(data){
						$('.btn-compose').text("메세지 작성");
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//임시보관함에서 메세지 클릭했을 때
			$(document).on("click", ".message-detail-temporary", function(){
				var msgaddNo = $(this).closest('tr').find(".msgaddNo").val();
				var msgNo = $(this).closest('tr').find(".msgNo").val();
				//console.log(msgaddNo);
				//console.log(msgNo);
				$.ajax({
					url: "<c:url value='/mailbox/selectTemporaryMail'/>",
					type: "GET",
					data: {
						"msgaddNo" : msgaddNo,
						"msgNo" : msgNo
					},
					success: function(data){
						$('.btn-compose').text("받은 메세지");
						$('.box.box-primary').html(data);
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				}); 
			}); 
			
			//상세페이지 삭제 버튼 눌렀을 때
			$(document).on("click", ".detail-trash", function(){
				var msgaddNo = $(this).closest('div').find('#msgaddNo').val();
				//console.log(msgaddNo);
				var trashFlag = "N";
				if($(this).hasClass("detail-trash-up")){
					trashFlag = "Y";
				}
				
				$.ajax({
					url: "<c:url value='/mailbox/updatDetailTrashFlag'/>",
					type: "GET",
					data: {
						"msgaddNo" : msgaddNo,
						"trashFlag" : trashFlag
					},
					success: function(data){
						//mailbox 다시 가져오기
						$('.content-wrapper').empty();
						$('.content-wrapper').append(data);
						
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
					},
					error: function(xhr, status, error){
						alert('error:' + error);
					}
				});
			});
			
			//메세지 작성 시 취소버튼 눌렀을 때
			$(document).on("click", ".btn-cancel", function(){
				event.preventDefault();
				
				$.ajax({
					url: "<c:url value='/mailbox/receivedMail'/>",
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
              <a href="#" class="btn btn-primary btn-block margin-bottom btn-compose">메세지 작성</a>
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