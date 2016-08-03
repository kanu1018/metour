<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="A" items="${pubList}" varStatus="status">
<c:if test="${not status.first}">,</c:if>
{title:'${A.title}', addr1:'${A.addr1}', addr2:'${A.addr2}', areacode:'${A.areacode}', contentid:'${A.contentid}', contenttypeid:'${A.contenttypeid}',
dist:'${A.dist}', mapx:'${A.mapx}', mapy:'${A.mapy}'}
</c:forEach>
]

