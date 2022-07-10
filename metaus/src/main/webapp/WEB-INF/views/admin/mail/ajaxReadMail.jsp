<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.mailbox-attachment-info {
	    word-break: break-all;
	}
</style>
          <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">
									<c:if test="${not empty map}">
									  	<input type="hidden" name="ajaxTemporaryFlag" value="${map['TEMPORARY_FLAG'] }" id="ajaxTemporaryFlag">
									  	<input type="hidden" name="msgNo" value="${map['MSG_NO'] }" class="msgNo">
									  	<input type="hidden" id="msgaddNo" name="msgaddNo" value="${map['MSGADD_NO'] }" class="msgaddNo">
								  		메세지
								  	</c:if>
	                            </h6>
	                        </div>
	                        
	                        <div class="card-body" id="tablecard">


		<div class="box-body">
		  <div class="form-group">
		    <input type="text" class="form-control" name="msgaddAdsee" id="msgaddAdsee" 
		    	placeholder="받는사람: example@example.com" value="받는사람 : ${map['MSGADD_ADSEE'] }" disabled="disabled" style="background-color: white"/>
		  </div>
		  <div class="form-group">
		    <input type="text" class="form-control" name="msgaddAdser" 
		    	placeholder="받는사람: example@example.com" value="보낸사람 : ${map['MSGADD_ADSER'] }" disabled="disabled" style="background-color: white"/>
		    <input type="hidden"  id="msgaddAdser" value="${map['MSGADD_ADSER'] }">
		  </div>
		  <div class="form-group">
		    <input type="text" class="form-control" name="msgTitle" placeholder="제목:" value="${map['MSG_TITLE'] }" disabled="disabled" style="background-color: white"/>
		  </div>
		  <div class="form-group">
		    <textarea id="compose-textarea" name="msgContent" 
		    	class="form-control" style="height: 300px;background-color:white;" disabled="disabled" style="background-color: white">${map['MSG_CONTENT'] }</textarea>
		  </div>
		  
		  
		  
		  
		</div><!-- /.box-body -->
		<div class="box-footer ">
		  <div class="pull-right d-sm-flex align-items-center justify-content-between mb-4">
		  <div class="form-group">
		    <div class="btn btn-default btn-file">
		  	<a href="javascript:upfileClick()" class="btn btn-primary btn-icon-split"><span class="text">파일 업로드</span>
		      	<input type="file" onchange="addFile(this);" id="attachment" name="attachment" style="display:none;"  multiple/>
		    </a>
		    </div>
		  </div>
		  	<div></div>
		  	<div>
		    <button class="btn btn-default temporary  detail-trash btn-secondary"><i class="fa fa-pencil"></i> 삭제</button>
		    <button type="button" class="btn btn-primary detail-reply"><i class="fa fa-envelope-o"></i> 답장</button>
		    </div>
		  </div>
		</div><!-- /.box-footer -->
		<div class="file-list"></div>

<input type="hidden" value="N" name="temporaryFlag" id="temporaryFlag">


</div>
</div>