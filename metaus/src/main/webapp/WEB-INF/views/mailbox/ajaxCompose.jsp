<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.file-list .filebox .delete i{
    color: #ff5353b8;
    margin-left: 5px;
}
.file-list .filebox{
	border: 1px solid #ddd;
	border-radius: 5px;
    width: 400px;
    margin-bottom: 4px;
    padding-left: 10px;
    background-color: #dddddd38;
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
<form name="frm" id="frm" action="<c:url value='/mailbox/sendMail' />" method="post" enctype="multipart/form-data">
		<div class="box-header with-border">
		  <h3 class="box-title">
		  	<c:if test="${not empty map}">
			  	<input type="hidden" name="ajaxTemporaryFlag" value="${map['TEMPORARY_FLAG'] }" id="ajaxTemporaryFlag">
			  	<input type="hidden" name="msgNo" value="${map['MSG_NO'] }" class="msgNo">
			  	<input type="hidden" name="msgaddNo" value="${map['MSGADD_NO'] }" class="msgaddNo">
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
		      	<input type="file" onchange="addFile(this);" id="attachment" name="attachment" enctype="multipart/form-data" multiple/>
		    </div>
		    <p class="help-block">최대용량: 30MB</p>
		    <div class="file-list"></div>
		  </div>
		</div><!-- /.box-body -->
		<div class="box-footer">
		  <div class="pull-right">
		    <button class="btn btn-default temporary btn-message"><i class="fa fa-pencil"></i> 임시저장</button>
		    <button type="submit" class="btn btn-primary btn-message"><i class="fa fa-envelope-o"></i> 보내기</button>
		  </div>
		  <button class="btn btn-default btn-cancel"><i class="fa fa-times"></i> 취소</button>
		</div><!-- /.box-footer -->
	</div><!-- /. box -->
<input type="hidden" value="N" name="temporaryFlag" id="temporaryFlag">
</form>
<script type="text/javascript">
//첨부파일 표시
var fileNo = 0;
var filesArr = new Array();

$(function(){
	$('.filebox .name').each(function(idx, item){
		var file=$(this).text();
		// 파일 배열에 담기
        filesArr.push(file);
        
	});
});

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
                reader.readAsDataURL(file);

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
    document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'text/plain', 'image/gif', 'image/jpeg'
    	, 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'
    	, 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    	, 'text/html', 'application/msword', 'application/sql'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (30 * 1024 * 1024)) {
        alert("최대 파일 용량인 30MB를 초과한 파일은 제외되었습니다.");
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
function submitForm() {
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
} 
</script>