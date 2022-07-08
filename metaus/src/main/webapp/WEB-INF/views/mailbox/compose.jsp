<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp" %>
<style>
.file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
.file-list .filebox{
	border: 1px solid #ddd;
	border-radius: 5px;
    width: 400px;
    margin-bottom: 4px;
    padding-left: 10px;
}

.delete{
    float: right;
    line-height: 46px;
    padding-right: 15px;
}

.fa-circle-minus{
	color: #f65f5fd6;
}
</style>
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
            <form name="frm" action="<c:url value='/mailbox/sendMail'/>" method="post" enctype="multipart/form-data">
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
	                      	<input type="file" onchange="addFile(this);" id="attachment" name="attachment" class="file-upload" multiple/>
	                    </div>
	                    <p class="help-block">최대용량: 5MB</p>
	                    <div class="file-list"></div>
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
	
		//첨부파일 표시
		var fileNo = 0;
		var filesArr = new Array();
	
		/* 첨부파일 추가 */
		function addFile(obj){
		    var maxFileCnt = 5;   // 첨부파일 최대 개수
		    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
		    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
		    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
	
		    // 첨부파일 개수 확인
		    if (curFileCnt > remainFileCnt) {
		        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
		    } else {
		        for (const file of obj.files) {
		            // 첨부파일 검증
		            if (validation(file)) {
		                // 파일 배열에 담기
		                var reader = new FileReader();
		                reader.onload = function () {
		                    filesArr.push(file);
		                };
		                //reader.readAsDataURL(file);
	
		                // 목록 추가
		                let htmlData = '';
		                htmlData += '<div id="file' + fileNo + '" class="filebox">';
		                htmlData += '   <p class="name">' + file.name + '</p>';
		                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="fa-solid fa-circle-minus"></i></a>';
		                htmlData += '</div>';
		                $('.file-list').append(htmlData);
		                fileNo++;
		            } else {
		                continue;
		            }
		        }
		    }
		    // 초기화
		    //document.querySelector("input[type=file]").value = "";
		}
	
		/* 첨부파일 검증 */
		function validation(obj){
		    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
		    if (obj.name.length > 100) {
		        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.size > (100 * 1024 * 1024)) {
		        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
		        return false;
		    } else if (obj.name.lastIndexOf('.') == -1) {
		        alert("확장자가 없는 파일은 제외되었습니다.");
		        return false;
		    } else if (!fileTypes.includes(obj.type)) {
		        alert("첨부가 불가능한 파일은 제외되었습니다.");
		        return false;
		    } else {
		        return true;
		    }
		}
	
		/* 첨부파일 삭제 */
		function deleteFile(num) {
		    document.querySelector("#file" + num).remove();
		    filesArr[num].is_delete = true;
		    
		}
		
		/* 폼 전송 */
		/* function submitForm() {
		    // 폼데이터 담기
		    var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("attachment", filesArr[i]);
		        }
		    }

		    $.ajax({
		        method: 'POST',
		        url: "<c:url value='/mailbox/sendmail'/>",
		        data: formData,
		        async: true,
		        timeout: 30000,
		        cache: false,
		        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
		        success: function () {
		            alert("파일업로드 성공");
		        },
		        error: function (xhr, desc, err) {
		            alert('에러가 발생 하였습니다.');
		            return;
		        }
		    })
		} */

	</script>
  </body>
</html>