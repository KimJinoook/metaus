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
                <div class="box-header with-border">
                  <h3 class="box-title">상세 메세지</h3>
                  <div class="box-tools pull-right">
                    <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
                    <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-read-info">
                    <h3>${map['MSG_TITLE']}</h3>
                    <h5>From: ${map['MSGADD_ADSER']} 
                    <span class="mailbox-read-time pull-right">
	                    <c:set var="splitDate" value="${fn:split(map['SEND_DATE'], ' ')}" />
	                    <c:set var="dateHour" value="${splitDate[fn:length(splitDate)-1] }" />	
	                    <c:set var="splitHour" value="${fn:split(dateHour, ':') }" />
	                  	<fmt:formatDate value="${map['SEND_DATE'] }" dateStyle="full"/> ${splitHour[0] }:${splitHour[1] }
                    </span></h5>
                  </div><!-- /.mailbox-read-info -->
                  <% pageContext.setAttribute("newLine", "\r\n"); %>
                  <div class="mailbox-read-message">
                  	<p>${fn:replace(map['MSG_CONTENT'], newLine, '<br>')}</p>
                  </div><!-- /.mailbox-read-message -->
                </div><!-- /.box-body -->
                <div class="box-footer">
                
                  <ul class="mailbox-attachments clearfix">
	                <c:forEach var="vo" items="${list }">
	                    <li>
	                      <span class="mailbox-attachment-icon">
	                      	<c:set var="oFileName" value="${vo['MFILE_ORIGINNAME'] }" />
	                      	<c:set var="splitArr" value="${fn:split(oFileName, '.')}" />
							<c:set var="extension" value="${splitArr[fn:length(splitArr)-1] }" />	
							<c:set var="fileName" value="${vo['MFILE_FILENAME'] }" />  
							<c:choose>
								<c:when test="${extension eq 'pdf'}">
									<i class="fa-regular fa-file-pdf"></i>
								</c:when>
								<c:when test="${extension eq 'txt'}">
									<i class="fa-regular fa-file-lines"></i>
								</c:when>
								<c:when test="${extension eq 'png' || extension eq 'jpg' || extension eq 'jpeg'}">
		                      		<span class="mailbox-attachment-icon has-img">
		                      			<img src="<c:url value='/message_attachment/${fileName}'/>" alt="">
		                      		</span>
								</c:when>
								<c:when test="${extension eq 'xlsx'}">
									<i class="fa-regular fa-file-excel"></i>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-file"></i>
								</c:otherwise>
							</c:choose>                    	
	                      	
	                      </span>
	                      <div class="mailbox-attachment-info">
	                        <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> ${vo['MFILE_ORIGINNAME'] }</a>
	                        <span class="mailbox-attachment-size">
	                          <c:if test="${fn:length(vo['MFILE_FILESIZE'])<4 }">
	                          	${vo['MFILE_FILESIZE'] } B
	                          </c:if>
	                          <c:if test="${fn:length(vo['MFILE_FILESIZE'])<7 && fn:length(vo['MFILE_FILESIZE'])>=4}">
	                          	<fmt:formatNumber value="${vo['MFILE_FILESIZE'] / 1024}" pattern=".00"/> KB
	                          </c:if>
	                          <c:if test="${fn:length(vo['MFILE_FILESIZE'])>=7}">
	                          	<fmt:formatNumber value="${vo['MFILE_FILESIZE'] / (1024 * 1024)}" pattern=".00"/> MB
	                          </c:if>
	                          <a href="<c:url value='/message_attachment/${fileName }'/>" download="${oFileName }" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
	                        </span>
	                      </div>
	                    </li>
                    </c:forEach>
                  </ul>
                </div><!-- /.box-footer -->
                <div class="box-footer">
                  <input type="hidden" value="${map['MSGADD_NO'] }" id="msgaddNo">
                  <c:if test="${map['TRASH_FLAG'] eq 'N'}">
               		<button class="btn btn-default detail-trash"><i class="fa fa-trash-o"></i> 삭제</button>
	                <button class="btn btn-default"><i class="fa fa-reply"></i> 답장</button>
	                <button class="btn btn-default"><i class="fa fa-share"></i> 전달</button>
                  </c:if>
                  <c:if test="${map['TRASH_FLAG'] eq 'Y'}">
                  	<button class="btn btn-default detail-trash detail-trash-up"><i class="fa-solid fa-trash-can-arrow-up"></i> 복구</button>
                  </c:if>
                </div><!-- /.box-footer -->
