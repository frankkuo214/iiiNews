<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<h2>所有廣告列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table border="1">
			<tr><td>產品編號</td><td>上傳日期</td><td>分類</td><td>寬</td><td>高</td><td>日期</td><td>單價</td><td>庫存</td><td>設定</td></tr>
			<c:forEach var="ad" items="${adLists}">
				<tr>
				<td>${ad.adNo}</td><td>${ad.uploadDate}</td><td>${ad.categoryNo}</td>
				<td>${ad.width}</td><td>${ad.height}</td><td>${ad.adDate}</td><td>${ad.price}</td><td>${ad.stock}</td>
				<td>
<!-- 					<form action="#" method="POST"> -->
					<form action='<c:url value="/addProductToCart" />' method="POST">
					<input type="hidden" name="quantity" value="1">
					<input type="hidden" name="adPk" value="${ad.adPk}">
					<input type="submit" value="加入購物車按鈕" />
					</form>
					<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />">刪除</a>
				</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	
</body>
</html>