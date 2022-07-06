<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.star-message-type{
		border-radius: 3px;
		background-color: #dddddd9e;
		color: black;
		font-size: 3px;
		padding: 2px;
	}
	
	.trash-spam-message{
		border-radius: 3px;
		background-color: red;
		color: black;
		font-size: 3px;
		padding: 2px;
	}
</style>
<div class="box-header with-border">
                  <h3 class="box-title">
	                  <c:choose>
						  <c:when test="${flag eq 'received'}">
						  	받은 메세지
						  </c:when>
						  <c:when test="${flag eq 'sent'}">
						  	보낸 메세지
						  </c:when>
						  <c:when test="${flag eq 'star'}">
						  	별표 메세지
						  </c:when>
						  <c:when test="${flag eq 'trash'}">
						  	휴지통
						  </c:when>
						  <c:when test="${flag eq 'spam'}">
						  	스팸함
						  </c:when>
					  </c:choose>
                  </h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                      <input type="text" class="form-control input-sm" placeholder="메세지 검색"/>
                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding"><!-- box-body -->
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                      	<!-- 메세지 목록 반복 시작 -->
                      	<c:forEach var="map" items="${list }">
	                        <tr>
	                          <input type="hidden" value="${map['MSGADD_NO']}" class="msgaddNo">
	                          <td>
	                          	<input type="checkbox" />
	                          </td>
	                          <c:if test="${flag ne 'trash' && flag ne 'spam'}">
		                          <td class="mailbox-star">
		                          	<a href="#">
		                          		<input type="hidden" value="${flag}">
		                          		<c:if test="${map['STAR_FLAG'] eq 'Y'}">
		                          			<i class="fa fa-star text-yellow star"></i>
		                          		</c:if>
		                          		<c:if test="${map['STAR_FLAG'] eq 'N'}">
		                          			<i class="fa fa-star-o text-yellow star"></i>
		                          		</c:if>
		                          	</a>
		                          </td>
	                          </c:if>
	                          <td class="mailbox-name">
	                          	  <c:if test="${flag eq 'trash' || flag eq 'spam'}">&nbsp;</c:if>
		                          <a href='<c:url value="/mailbox/mailDetail?msgaddNo=${map['MSGADD_NO']}" />'>
			                          <c:choose>
										  <c:when test="${flag eq 'received' || flag eq 'spam'}">
										  	<!-- 받은 메세지일 때 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSER']}">
				                          		나
				                          	</c:if>
				                          	<c:if test="${sessionScope.memId ne map['MSGADD_ADSER']}">
				                          		${map['MSGADD_ADSER']}
				                          	</c:if>
										  </c:when>
										  <c:when test="${flag eq 'sent'}">
										  	<!-- 보낸 메세지일 때 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSEE']}">
				                          		나
				                          	</c:if>
				                          	<c:if test="${sessionScope.memId ne map['MSGADD_ADSEE']}">
				                          		${map['MSGADD_ADSEE']}
				                          	</c:if>
										  </c:when>
										  <c:when test="${flag eq 'star' || flag eq 'trash'}">
										  	<!-- 별표 메세지일 때 -->
										  	<!-- 보낸 메세지 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSER'] && sessionScope.memId ne map['MSGADD_ADSEE']}">
				                          		<span class="star-message-type">Send</span>
				                          		${map['MSGADD_ADSEE']}
				                          	</c:if>
				                          	<!-- 받은 메세지 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSEE'] && sessionScope.memId ne map['MSGADD_ADSER']}">
				                          		<span class="star-message-type">Receive</span>
				                          		<c:if test="${map['TRASH_FLAG'] eq 'Y' && map['SPAM_FLAG'] eq 'Y'}">
				                          			<span class="trash-spam-message">Spam</span>
				                          		</c:if>
				                          		${map['MSGADD_ADSER']}
				                          	</c:if>
				                          	<!-- 내가 보낸 메세지 -->
				                          	<c:if test="${sessionScope.memId eq map['MSGADD_ADSEE'] && sessionScope.memId eq map['MSGADD_ADSER']}">
				                          		나
				                          	</c:if>
										  </c:when>
									  </c:choose>
		                          </a>
	                          </td>
	                          <% pageContext.setAttribute("newLine", "\r\n"); %>
	                          <td class="mailbox-subject"><b>${map['MSG_TITLE']}</b> - 
		                          <c:choose>
									  <c:when test="${fn:length(fn:replace(map['MSG_CONTENT'], newLine, '<br>')) gt 40}">
									  	<c:out value="${fn:substring(fn:replace(map['MSG_CONTENT'], newLine, ' '), 0, 39)}"></c:out>...
									  </c:when>
									  <c:otherwise>
									  	<c:out value="${fn:replace(map['MSG_CONTENT'], newLine, ' ')}"></c:out>
									  </c:otherwise>
								  </c:choose>
	                          </td>
	                          <td class="mailbox-attachment"></td>
	                          <td class="mailbox-date">${map['SEND_DATE']} 5 mins ago</td>
	                        </tr>
                        </c:forEach>
                        <!-- 메세지 목록 반복 끝 -->
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                <div class="box-footer no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm checkbox-toggle check-all"><i class="fa-regular fa-square"></i></button>                    
                    <div class="btn-group">
                      <c:if test="${flag ne 'trash' }">
                      	<button class="btn btn-default btn-sm btn-trash"><i class="fa fa-trash-o"></i></button>
                      </c:if>
                      <c:if test="${flag eq 'trash' }">
                      	<button class="btn btn-default btn-sm btn-trash btn-trash-up"><i class="fa-solid fa-trash-can-arrow-up"></i></button>
                      </c:if>
                      <!-- 받은 메세지에서만 스팸 버튼 활성화 -->
                      <c:if test="${flag eq 'received'}">
                      	<button class="btn btn-default btn-sm btn-filter"><i class="fa fa-filter"></i></button>
                      </c:if>
					  <c:if test="${flag eq 'spam'}">
					  	<button class="btn btn-default btn-sm btn-filter btn-filter-up"><i class="fa-solid fa-filter-circle-xmark"></i></button>
					  </c:if>
                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                    </div><!-- /.btn-group -->
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    <div class="pull-right">
                      1-50/200
                      <div class="btn-group">
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                      </div><!-- /.btn-group -->
                    </div><!-- /.pull-right -->
                  </div>
                </div>