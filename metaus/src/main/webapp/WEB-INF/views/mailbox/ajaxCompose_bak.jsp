<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
		$(function(){
			//$('button[type=submit]').click(function(){
			$(document).on("click","button[type=submit]",function(){
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
</div><!-- /.box-footer --><div class="box-header with-border">
