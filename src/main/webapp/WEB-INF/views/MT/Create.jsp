<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增影片</title>
<link rel="stylesheet" href="/project/css/default.css">
<style>
body {
	background-attachment: fixed;
	/*background-color: #EBFFEB;*/
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

.st1 {
	text-align: left;
	width: 200px;
	margin: 20px;
}

.sub {
	background-color: #dcdcdc;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<%-- 	<jsp:include page="/test/topside.html" /> --%>
	<div id="content">
		<form:form method="POST" modelAttribute="mtBean" enctype="multipart/form-data">
			<fieldset>
				<div align="center">
					<h2>新增影片</h2>
					<hr>
					<div class="st1">
						<label for="" class="t1">類別:</label>
						<form:select path="Category">
							<form:option value="生活">生活</form:option>
							<form:option value="趣味">趣味</form:option>
							<form:option value="美食">美食</form:option>
							<form:option value="寵物">寵物</form:option>
							<form:option value="惡搞">惡搞</form:option>
						</form:select>
					</div>
					<div class="st1">
						<label class="t1" for="title1">標題:</label>
						<form:input type="text" id="title1" name="title1" path="title"
							size="30" placeholder="今晚我想來點..." autocomplete="on" />
						<font color="red" size="1">${errorMsg.title}</font>
					</div>
					<div class="st1">
						<label class="t1" for="link1">影片連結:</label>
						<form:input type="text" id="link1" name="link1" path="videoLink"
							size="30" placeholder="https://www.youtube.com/..."
							autocomplete="off" />
						<font color="red" size="1">${errorMsg.link}</font>
					</div>
<!-- 					<div class="st1"> -->
<!-- 						<label class="t1" for="">照片:</label> -->
<%-- 						<form:input type="file" id="img1" name="img1" path="imgLink" /> --%>
<!-- 					</div> -->
					<div class="st1">
						<label class="t1" for="text1">內容:</label>
						<form:textarea name="text1" id="cols1" cols="30" rows="10"
							path="article" maxlength="250" placeholder="限輸入250字"></form:textarea>
					</div>
				</div>
			</fieldset>
			<div id="btn" align="center">
				<input class="sub" type="submit" name="submit" id="submit" value="送出" />
				<input class="sub" type="reset" name="cancel" id="cancel" value="清除" />
			</div>
		</form:form>
	</div>
</body>
</html>