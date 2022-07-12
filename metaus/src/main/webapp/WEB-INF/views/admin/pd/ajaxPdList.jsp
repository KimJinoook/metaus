<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="vo" items="${list}">

	<tr>
		<th>${vo.pdNo }</th>
		<th>${vo.memId }</th>
		<th>${vo.pdName }</th>
		<th>${vo.pdPrice }</th>
		<th>${vo.pdBuycnt }</th>
		<th>${vo.pdPrice * vo.pdBuycnt }</th>
		<td style="padding: 10px"><a
			href="<c:url value='/admin/pd/pdDetail?pdNo=${vo.pdNo }'/>"
			class="btn btn-primary btn-icon-split btn-sm"
			style="margin: 0px; height: 27px"> <span class="icon text-white"
				style="margin: 0px"> <i class="fas fa-search"></i>
			</span>
		</a></td>
	</tr>

</c:forEach>