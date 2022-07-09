<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">



<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script>
$(function(){
	var getinFlag = $('#getinFlag').val();
	if(getinFlag == 1){		
		viewMail(1);
	}else if(getinFlag == 2){
		viewMail(2);
	}else if(getinFlag==4){
		viewMail(4);
	}

	//전체 체크
	$(document).on("click",".check-all",function(){;
		if($(this).hasClass('unchecked')){
			$(this).removeClass('unchecked').addClass('checked');
			$('input[type=checkbox]').prop("checked", true);
		}else{
			$(this).removeClass('checked').addClass('unchecked');
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
	
	
	
	//별표 클릭
	$(document).on("click",".star", function(){
		var msgaddNo = $(this).closest('tr').find('input[type=hidden]').val();
		console.log(msgaddNo);
		if($(this).attr('style')=='color:orange'){
			console.log("색칠된 별");
			var emptyFlag = false;
			$(this).attr('style','color:lightgray');
		}else{
			//console.log("빈 별");
			var emptyFlag = true;
			$(this).attr('style','color:orange');
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
	
	
	
	//메세지 작성
	$(document).on("click",".btn-compose",function(){

			$.ajax({
				url: "<c:url value='/admin/mail/ajaxCompose'/>",
				type: "GET",
				success: function(data){
					$('#ajaxTarget').html(data);
					$('li.nav-item > a').removeClass('active');
				},
				error: function(xhr, status, error){
					alert('error:' + error);
				}
			});
		
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
			url: "<c:url value='/admin/mail/sendMail'/>",
			type: "POST",
			data: formData,
			cache: false,
			contentType : false,
			processData : false,
			success: function(data){
				if($('#temporaryFlag').val()=='Y'){					
					location.href="<c:url value='/admin/mail/mailList?getinFlag=4'/>";					
				}else{
					location.href="<c:url value='/admin/mail/mailList?getinFlag=2'/>";					
				}
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
	
});

function viewMail(flag){
	$.ajax({
		url: "<c:url value='/admin/mail/ajaxMail?flag='/>"+flag,
		type: "GET",
		success: function(data){
			$('#ajaxTarget').html(data);
		},
		error: function(xhr, status, error){
			alert('error:' + error);
		}
	});
	
	$('li.nav-item > a').removeClass('active');
	$('li > a.sel'+flag).addClass('active');
		
};
</script>
<!-- Begin Page Content -->
<input type="hidden" value='${getinFlag }' id="getinFlag">
                <div class="container-fluid">

                    
                        <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">메세지함</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm btn-compose"><i
                                class="fas fa-pen fa-sm text-white-50 "></i> 메세지 작성</a>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-2">
                   
		                    <!-- DataTales Example -->
		                    <div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary">메세지함 목록</h6>
		                        </div>
		                        
		                        <div class="card-body">  
					                <ul class="nav nav-pills flex-column" id="cardPillVertical" role="tablist">
					                    <li class="nav-item"><a class="sel1 nav-link active"  href="javascript:viewMail(1)" data-bs-toggle="tab" role="tab" aria-controls="overview" aria-selected="false">받은 메세지</a></li>
					                    <li class="nav-item"><a class="sel2 nav-link"  href="javascript:viewMail(2)" data-bs-toggle="tab" role="tab" aria-controls="example" aria-selected="false">보낸 메세지</a></li>
					                    <li class="nav-item"><a class="sel3 nav-link"  href="javascript:viewMail(3)" data-bs-toggle="tab" role="tab" aria-controls="example" aria-selected="false">별표 메세지</a></li>
					                    <li class="nav-item"><a class="sel4 nav-link"  href="javascript:viewMail(4)" data-bs-toggle="tab" role="tab" aria-controls="example" aria-selected="false">임시 보관함</a></li>
					                    <li class="nav-item"><a class="sel6 nav-link"  href="javascript:viewMail(6)" data-bs-toggle="tab" role="tab" aria-controls="example" aria-selected="false">휴지통</a></li>
					                    
					                </ul>
							    </div>
		                    </div>
               		   	</div>
               		   	
               		   	<div class="col-lg-10" id="ajaxTarget">
          
	                    </div>
               		   	
               		   	
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
	<!-- Page level plugins -->
	<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	
	<!-- Page level custom scripts -->
	<script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>

<%@ include file="../inc/adminFooter.jsp" %>
