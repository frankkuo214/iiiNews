<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>上架廣告欄位</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var date = new Date();
        var day =date.getDate();
        var month =date.getMonth()+1;

        if(date.getMonth()<10){
        month = "0"+(date.getMonth()+1); 
        }

        if(date.getDate()<10){
         day = "0"+date.getDate(); 
        }

        var today = date.getFullYear()+"-"+month+"-"+day;
		console.log(today);
		
		var nextYear = date.getFullYear();
		var nextMonth = month+2;
		var nextDay = 1;
		if(nextMonth == 13){
			nextMonth = 1;
			nextYear += 1;
		}
		if(nextMonth == 14){
			nextMonth = 2;
			nextYear += 1;
		}
		 if(nextMonth<10){
			 nextMonth = "0"+(nextMonth); 
	    }

		if(nextDay<10){
			nextDay = "0"+nextDay; 
		}
		
		var nextdate = nextYear+"-"+nextMonth+"-"+nextDay;
		console.log(nextdate);
		
        $("#idDate").attr("min",today);
        $("#idDate").attr("max",nextdate);
        
        $("#idDate").attr("value",today);
	}
</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div id="page" class="container" align="center" style="margin-top:100px;margin-bottom:100px;width:30%;">
    <h2>廣告欄位上架</h2>
    <div>
    <form:form method="POST" modelAttribute="adBean">
    	<fieldset>
    			<div class="divstyle">
                    <label for="idTitle">標題:</label>
                    <form:input class="form-control" type="text" id="idTitle" name="idTitle" path="adTitle" />
                    <form:errors path="adTitle" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="category">欄位位置:</label>
                    <form:select class="form-control" path="categoryNo">
                        <form:option value="-1">分類項目</form:option>
                        <form:option value="100">頭版頭</form:option>
                        <form:option value="200">頭版側標</form:option>
                        <form:option value="300">內頁版頭</form:option>
                        <form:option value="400">內頁側標</form:option>
                        <form:option value="500">小廣告</form:option>
                    </form:select>
                    <form:errors path="categoryNo" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idWidth">寬:</label>
                    <form:input class="form-control" type="text" id="idWidth" name="idWidth" path="width" placeholder="請輸入寬"/>
                    <form:errors path="width" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idHeight">高:</label>
                    <form:input class="form-control" type="text" id="idHeight" name="idHeight" path="height" placeholder="請輸入高"/>
                    <form:errors path="height" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idDate">廣告時間:</label>
                    <form:input class="form-control" type="date" id="idDate" name="idDate" path="adDate" placeholder="請輸入時間" />
                    <form:errors path="adDate" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idPrice">價錢:</label>
                    <form:input class="form-control" type="number" min="0" id="idPrice" name="idPrice" path="price"
                         placeholder="請輸入價錢" />
                     <form:errors path="price" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idStock">庫存:</label>
                    <form:input class="form-control" type="number" step="1" min="1" max="20" id="idStock" name="idStock" path="stock"
                         placeholder="請輸入庫存"/>
                     <form:errors path="stock" cssClass="error"/>
                </div>
                <div class="form-group">
                    <label for="idStatement">備註:</label>
                    <form:input class="form-control" type="text" id="idStatement" name="idStatement" path="statement" />
                    <form:errors path="statement" cssClass="error"/>
                </div>
            </fieldset>
            <div class="sub">
                <input type="submit" name="submit" id="submit" value="送出">
                <input type="reset" value="清除">
            </div>
	</form:form>

	<a href="<c:url value='/' />">回首頁喔</a>

    </div>
    <br>
    <input type="button" value="one" onclick="onebuttontodata()">
</div>


</body>
</html>