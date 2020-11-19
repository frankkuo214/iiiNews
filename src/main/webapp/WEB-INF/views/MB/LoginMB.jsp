<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>會員登入</TITLE>
<style>
.button {
	display: inline-block;
	padding: 50px 50px;
	font-size: 24px;
	cursor: pointer;
	color: #FFDC35; /*字色 */
	background-color: #BC214C; /*底色 */
	border-rddius: 15px;
	box-shadow: 0 8px #999;
	outline: none;
	border: none;
	margin-top：auto;
}

.button:hover {
	opacity: 0.8;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
</style>
</HEAD>
<BODY>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<form modelAttribute="LoginMB"></form>
		<h2 align="center">請選擇您要登入的會員</h2>
		<div>
			<a href="<c:url value='Login'/>"> <input
					type="submit" class="button" value="一般登入"></a>
			<a href="<c:url value='CpLogin'/>">
			<input type="submit" class="button" value="企業登入"></a>
		</div>

	</section>
</HTML>