<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>商業會員${CpAdLists[0].memberId}您好<br>您所有上傳的廣告列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<a>所有的上傳列表</a>&nbsp&nbsp&nbsp<a>賣出的商品列表</a>
	</div>
	<div align="center">
		<table border="1">
			<tr>
				<td>產品編號</td>
				<td>上傳日期</td>
				<td>分類</td>
				<td>寬</td>
				<td>高</td>
				<td>欲販售日期</td>
				<td>單價</td>
				<td>上架狀態</td>
				<td>庫存</td>
				<td>設定</td>
			</tr>
		<c:choose>
            <c:when test="${empty CpAdLists}">
            	<tr>
            		<td colspan='10' align="center">您無上傳清單</td>
            	</tr>
            	<tr>
            		<td colspan='10' align="center"><a href="<c:url value='/uploadAds' />">立即前往刊登吧</a></td>
            	</tr>
            </c:when>
            <c:otherwise>
				<c:forEach var="ad" items="${CpAdLists}">
					<tr>
						<td>${ad.adNo}</td>
						<td>${fn:substring(ad.uploadDate,0,19)}</td>
						<td>
						<c:choose>
	                    	<c:when test="${ad.categoryNo == 100}">頭版頭</c:when>
							<c:when test="${ad.categoryNo == 200}">頭版側標</c:when>
							<c:when test="${ad.categoryNo == 300}">內頁版頭</c:when>
							<c:when test="${ad.categoryNo == 400}">內頁側標</c:when>
							<c:when test="${ad.categoryNo == 500}">小廣告</c:when>
							<c:otherwise>其他</c:otherwise>
						</c:choose>
						</td>
						<td>${ad.width}</td>
						<td>${ad.height}</td>
						<td>${ad.adDate}</td>
						<td>${ad.price}</td>
						<td>
							<c:if test="${ad.status == 0}">已下架</c:if>
							<c:if test="${ad.status == 1}">上架中</c:if>
						</td>
						<td>${ad.stock}</td>
					<td>
						<a href="<c:url value="#" />">修改</a>
<%-- 						<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
					</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
</body>
</html>