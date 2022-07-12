<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">메세지 조회 결과
	                            </h6>
	                        </div>
	                        
	                        <div class="card-body" id="tablecard">
<div class="table-responsive">
	                            
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
            <tr>
               	<td>&nbsp;</td>
               	
               	<c:if test="${flag eq 1 || flag eq 3 || flag eq 6}">
                <th>보낸사람</th>
                </c:if>
               	<c:if test="${flag eq 2 || flag eq 4}">
                <th>받는사람</th>
                </c:if>
                
                
                <th>제목</th>
                <th>내용</th>
                <th>보낸시간</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th colspan="5">
                		<button class="btn btn-default btn-sm checkbox-toggle check-all unchecked"><i class="fas fa-square"></i></button> 
                	  <c:if test="${flag ne 6 }">
                      	<button class="btn btn-default btn-sm btn-trash"><i class="fas fa-trash"></i></button>
                      </c:if>
                      <c:if test="${flag eq 6 }">
                      	<button class="btn btn-default btn-sm btn-trash btn-trash-up"><i class="fas fa-trash-restore"></i></button>
                      </c:if>
                </th>

            </tr>
        </tfoot>
        <tbody>
        <c:forEach var="map" items="${list }">
        	<c:if test="${empty map['MSGADD_DATE']}">
            <tr style="font-weight: bold;color:blue;">
            </c:if>
        	<c:if test="${not empty map['MSGADD_DATE']}">
            <tr>
            </c:if>
        	
	                <input type="hidden" value="${map['MSGADD_NO']}" class="msgaddNo">
	                <input type="hidden" value="${map['MSG_NO']}" class="msgNo">
                <td>
                	<input type="checkbox" style="padding-top:20px" />
             
                <c:if test="${flag ne 6}">
                 	&nbsp;&nbsp;
                 	<a href="#">
                 		<input type="hidden" value="${flag}">
                 		<c:if test="${map['STAR_FLAG'] eq 'Y'}">
                 			<i class="fas fa-star star" style="color:orange"></i>
                 		</c:if>
                 		<c:if test="${map['STAR_FLAG'] eq 'N'}">
                 			<i class="fas fa-star star" style="color:lightgray"></i>
                 		</c:if>
                 	</a>
                </c:if>
                </td>
                
                <c:if test="${map['TEMPORARY_FLAG'] ne 'Y'}">
	            <td class="message-detail">
	            </c:if>
	        	<c:if test="${map['TEMPORARY_FLAG'] eq 'Y'}">
	            <td class="message-detail-temporary">
	            </c:if>
	            <c:if test="${flag eq 1 || flag eq 3 || flag eq 6}">
	            ${map['MSGADD_ADSER']}
	            </c:if>
	            <c:if test="${flag eq 2 || flag eq 4}">
	            ${map['MSGADD_ADSEE']}
	            </c:if>
	            
	            </td>
	            
                <c:if test="${map['TEMPORARY_FLAG'] ne 'Y'}">
	            <td class="message-detail">
	            </c:if>
	        	<c:if test="${map['TEMPORARY_FLAG'] eq 'Y'}">
	            <td class="message-detail-temporary">
	            </c:if>${map['MSG_TITLE']}</td>
	            
                <c:if test="${map['TEMPORARY_FLAG'] ne 'Y'}">
	            <td class="message-detail">
	            </c:if>
	        	<c:if test="${map['TEMPORARY_FLAG'] eq 'Y'}">
	            <td class="message-detail-temporary">
	            </c:if>
                	<c:choose>
						  <c:when test="${fn:length(fn:replace(map['MSG_CONTENT'], newLine, '<br>')) gt 40}">
						  	<c:out value="${fn:substring(fn:replace(map['MSG_CONTENT'], newLine, ' '), 0, 39)}"></c:out>...
						  </c:when>
						  <c:otherwise>
						  	<c:out value="${fn:replace(map['MSG_CONTENT'], newLine, ' ')}"></c:out>
						  </c:otherwise>
					  </c:choose>
				</td> 
                <c:if test="${map['TEMPORARY_FLAG'] ne 'Y'}">
	            <td class="message-detail">
	            </c:if>
	        	<c:if test="${map['TEMPORARY_FLAG'] eq 'Y'}">
	            <td class="message-detail-temporary">
	            </c:if>
                	<jsp:useBean id="now" class="java.util.Date" />
                   	<fmt:parseNumber value="${map['SEND_DATE'].time}" var="sendDate"/>
                   	<fmt:parseNumber value="${now.time }" integerOnly="true" var="today"/>
                   	<c:set value="${(today - sendDate) / (1000*60) }" var="timeLag" />
                   	<c:choose>
                   		<c:when test="${timeLag < 1}">
                   			방금전
                   		</c:when>
                   		<c:when test="${timeLag < 60 && timeLag >=1}">
                    		<fmt:parseNumber value="${timeLag }" var="minute" integerOnly="true" />
                    		${minute }분전
                   		</c:when>
                   		<c:when test="${timeLag >= 60 && timeLag < 24*60 }">
                    		<fmt:parseNumber value="${timeLag / 60 }" var="hour" integerOnly="true" />
                    		${hour }시간전
                   		</c:when>
                   		<c:when test="${timeLag >= 24*60 && timeLag < 24*60*6 }">
                    		<fmt:parseNumber value="${timeLag / (60*24) }" var="day" integerOnly="true" />
                    		${day }일전
                   		</c:when>
                   		<c:otherwise>
                   			<fmt:formatDate value="${map['SEND_DATE'] }" dateStyle="full"/>
                   		</c:otherwise>
                   	</c:choose>
                </td> 
            </tr>
            
        </c:forEach>
          
        </tbody>
    </table>
</div>
</div>
</div>
<!-- Page level plugins -->
<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>

<!-- Page level custom scripts -->
<script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>