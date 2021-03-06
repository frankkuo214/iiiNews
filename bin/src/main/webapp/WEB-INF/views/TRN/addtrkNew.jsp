<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>trkNews</title>
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">新增產品資料</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="trkNewsBean" class='form-horizontal'
			enctype="multipart/form-data" >
			<fieldset >
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						標題 </label>
					<div class="col-lg-10">
						 <form:input id="title" path="title" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='author'>
						建立人 </label>
					<div class="col-lg-10">
						<form:input id="founder" path="founder" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類型 </label>
					<div class='col-lg-10'>
						<form:select path="type">
							<form:option value="-1" label="請挑選" />
							<form:options items="${typeList}" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						發生地點 </label>
					<div class='col-lg-10'>
						<form:input id="ocplace" path="ocplace" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="bookNo">
						發生時間 </label>
					<div class='col-lg-10'>
						<form:input id="octime" path="octime" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="companyId">
						書商 </label>
					<div class='col-lg-10'>
						<%-- <form:select path="companyId">
							<form:option value="-1" label="請挑選" />
							<form:options items="${companyList}" />
						</form:select> --%>
					</div>
				</div>
				
				<div class="form-group">
       				<label class='control-label col-lg-2 col-lg-2' for="newsImage">
        				<%-- <spring:message code='spring.addProduct.form.image.label'/> --%>
        				    <!--   為了多語言 先標註各功能在對應不同語系的字元 -->
       				上傳圖片</label>
					<div class='col-lg-10'>        				
        				<form:input id="newsImage" path="newsImage" type='file' 
            				class='form:input-large' />
    				</div>
				</div> 
				
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
	</section>
</body>
</html>
