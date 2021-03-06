<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&family=Ubuntu:wght@400;500&display=swap" rel="stylesheet">
<title>文章列表</title>
<meta charset="UTF-8">
<style>
#customers {
/*   font-family: 'Noto Sans TC', sans-serif; */
  font-family: 'Ubuntu', sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#customers td {
  border: 1px solid #ddd;
  padding: 8px;
}
#customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

/* #customers tr:hover {background-color: #844200;} */

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #FFAD86;
  color: block;
}

td {
 	background-color: #FFF3EE;
	padding: 3px;
/* 	text-align:center;  */
/* 	 valign:middle;' */
}
.tdbtn{background-color: #f8f2e4;
}
.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
a {
    color:black;
    

}
a:hover{
	color:black;
	text-decoration:none;
}

.aline{
	margin: 1em 0;
	position: relative;
	padding: 0.25em 0;
	font-weight: bold;
}
.aline:after {
	content: "";
	display: block;
	height: 4px;
	background-image: linear-gradient(to right, #FF7365 0%, transparent);  /* 自訂的顏色 */
}
.button0{
/* 	font-color:#000000; */
/* 	color:#000000; */
  	background-color: #ffad86;
	border:none;
	outline:none;
  	
}

</style>
</head>
<body style="background-color: #f8f2e4;">
<div class="iiinewsContainer">
	<div class="container">
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div align="center">
		<div align="center" style="margin-top: 30px;">
			<br><br><br>
			<h2>文章看板</h2>
		</div>
		<hr>
		<div class="form-group row justify-content-center">
		<div class="col-sm-3">
			<input class="form-control" type="text" id="wordChoose" onkeyup="searchByWord()" placeholder="搜尋文章⋯" />
		</div>
		</div>
		<br><div id='somedivS'></div>
		<br><div id='navigation'></div><br><br>
<%-- 		<hr><input type="button" onclick="location.href='<c:url value="/" />' " value="回首頁" /> --%>
	</div>

	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
		</div>
    </div>
<script>
window.onload=function(){

	var pageNoCom = 0;
	var totalPageCom  = 0;
	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/allArtCom.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET", "<c:url value='/allArtComNo' />", true);
	xhr2.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr2.readyState == 4) {
			if (xhr.status == 200 && xhr2.status == 200){
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;

				console.log(responseData);
				displayPageBooks(responseData);   // 顯示讀取到的非文字性資料
			} 
// 			else {
// 				alert(xhr.status);
// 			}
		}
	}
	
	// 當使用者按下『第一頁』、『前一頁』、『下一頁』、『最末頁』的連結時，由本方法發出非同步請求。
	function asynRequest(id) {
		var xhr = new XMLHttpRequest();
		var no = 0;
	    var queryString = "";     		// queryString紀錄查詢字串
		    if (id == "first") {		// 算出查詢字串中，要送出的pageNoCom為何?
		    	no = 1;
		    } else if (id == "prev") {
		    	no = pageNoCom - 1;
		    } else if (id == "next") {
		    	no = pageNoCom + 1;
		    } else if (id == "last") {
		    	no = totalPageCom;	    	
		    }
		 // 查詢字串包含1.即將要讀取的頁數(pageNoCom), 2.總共有幾頁(totalPageCom)
		    // 注意，查詢字串的前面有問號
		    queryString = "?pageNoCom=" + no + "&totalPageCom=" + 	totalPageCom;
			console.log(queryString);
			xhr.open("GET", "<c:url value='/allArtCom.json' />" + queryString , true);
			xhr.send();
			
			var xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "<c:url value='/allArtComNo' />"+ queryString, true);
			xhr2.send();
			
			xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200 && xhr2.readyState == 4 && xhr2.status == 200) {
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;
				displayPageBooks(responseData);
			}
		}
	}
	

function displayPageBooks(responseData){
	  var content = "<table id='customers' style='font-size:20px'><tr>";
      		content +=  "<th>標題</th>";
      		content +=  "<th>發文者</th><th>上傳日期</th></tr>";	    
		var data = responseData.split("&&&");
		console.log("data-----" + data[1]);
		var news = JSON.parse(data[0]);		// 傳回一個陣列
		console.log("data-----0000000" + data[0]);
		var mapData = JSON.parse(data[1]);		// 傳回一個JavaScript物件
		console.log("data-----1111111" + data[1]);
		var bgColor = "";   // 每一項商品的背影 顏色
		 
		for(var i=0; i < news.length; i++){
			content += "<tr height='80'>" + 
		               "<td align='left'>[" + news[i].category  + "] " +
		               "<a class='aline' href='<c:url value='/CreateComment/" + news[i].articleId + "'/>' >" +
		               "<c:if test='" + news[i].status + "== 0}' ><a href=''></a></c:if><b>" + news[i].title + "</b></a></td>" +
		               "<td align='center'>" + news[i].memberId + "</td>" +
		               "<td align='center'style='font-size:16px;'>" + news[i].updateDate + "</td>" + 
		               
//		               "<td><img  width='200' height='150' " +   
//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
			           "</tr>";  
			           
		}
		content += "</table>";
		document.getElementById("somedivS").innerHTML = content;
		pageNoCom = mapData.currPage;
		totalPageCom  = mapData.totalPageCom;
		
		var navContent = "<table><tr height='36'>" ;
		if (pageNoCom != 1){
			navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='first'>第一頁</button></td>";
			navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='prev'>前一頁</button></td>";
		}  else {
			navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
			navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
		}
		navContent += "<td class='tdbtn' width='200' align='center' style='font-size:18px'>第<b>" + pageNoCom + "</b>頁 / 共" + totalPageCom + "頁</td>";
		if (pageNoCom != totalPageCom){
			navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='next'>下一頁</button></td>";
			navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='last'>最末頁</button></td>";
		}  else {
			navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
			navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
		}
		navContent += "</table>";
		document.getElementById("navigation").innerHTML = navContent;
		var firstBtn = document.getElementById("first");
		var prevBtn  = document.getElementById("prev");
		var nextBtn  = document.getElementById("next");
		var lastBtn  = document.getElementById("last");
		if (firstBtn != null) {
			firstBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (prevBtn != null) {
			prevBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (nextBtn != null) {
			nextBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (lastBtn != null) {
			lastBtn.onclick=function(){
				asynRequest(this.id);				
			}
		}	
	}

}

//---------------------------搜尋---------------------------
function searchByWord() {
	var keyWordPage = 0;
	var keyWordTotalPage  = 0;
	
	let word = document.getElementById("wordChoose").value;
	console.log(word);

	var queryStringWord = "?word=" + word;
	console.log(queryStringWord);
	var xhr0 = new XMLHttpRequest();
	xhr0.open("GET", "<c:url value='/getAllArtWord.json' />" + queryStringWord, true);
	xhr0.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr00 = new XMLHttpRequest();
	xhr00.open("GET", "<c:url value='/allArtWordNo' />" + queryStringWord, true);
	xhr00.send();
	xhr0.onreadystatechange = function() {
		if (xhr0.readyState == 4 && xhr00.readyState == 4) {
			if(xhr0.status == 200 && xhr00.status == 200){
				var responseData = xhr0.responseText + "&&&" + xhr00.responseText;;
				
				console.log("word responseData:" + responseData);
				displayPageSearch(responseData);
			} 
		}
}

function asynRequest(id) {
    var xhr0 = new XMLHttpRequest();
    var no = 0;
    
    let word = document.getElementById("wordChoose").value;
	console.log(word);
// 	var queryStringWord = "?word=" + word;
	
    var queryString = "";     		// queryString紀錄查詢字串
        if (id == "first") {		// 算出查詢字串中，要送出的keyWordPage為何?
            no = 1;
        } else if (id == "prev") {
            no = keyWordPage - 1;
        } else if (id == "next") {
            no = keyWordPage + 1;
        } else if (id == "last") {
            no = keyWordTotalPage;	    	
        }
     // 查詢字串包含1.即將要讀取的頁數(keyWordPage), 2.總共有幾頁(keyWordTotalPage)
        // 注意，查詢字串的前面有問號
        queryString = "?keyWordPage=" + no + "&keyWordTotalPage=" + keyWordTotalPage + "&word=" + word;
        console.log(queryString);
        xhr0.open("GET", "<c:url value='/getAllArtWord.json' />" + queryString, true);
    	xhr0.send();
        
        var xhr00 = new XMLHttpRequest();
        xhr00.open("GET", "<c:url value='/allArtWordNo' />"+ queryString, true);
        xhr00.send();
        
        xhr0.onreadystatechange = function() {
        if (xhr0.readyState == 4 && xhr0.status == 200 && xhr00.readyState == 4 && xhr00.status == 200) {
            var responseData = xhr0.responseText + "&&&" + xhr00.responseText;
            console.log("------------------" + responseData);
            displayPageSearch(responseData);
        }
    }
}


	function displayPageSearch(responseData) {
			var content = "<table id='customers' style='font-size:20px'><tr>";
			content += "<th>標題</th>";
			content += "<th>發文者</th><th>上傳日期</th></tr>";
			var data = responseData.split("&&&");
			var news = JSON.parse(data[0]); // 傳回一個陣列
			var mapData = JSON.parse(data[1]); // 傳回一個JavaScript物件
			var bgColor = ""; // 每一項商品的背影 顏色

			for (var i = 0; i < news.length; i++) {
				content += "<tr height='80'>" + 
						   "<td align='left'>[" + news[i].category  + "] " + 
						   "<a class='aline' href='<c:url value='/CreateComment/" + news[i].articleId + "'/>' >" + 
						   "<c:if test='" + news[i].status + "== 0}' ><a href=''></a></c:if><b>" + news[i].title + "</b></a></td>" + 
						   "<td align='center'>" + news[i].memberId + "</td>" + 
						   "<td align='center' style='font-size:16px;'>" + news[i].updateDate + "</td>" +

						//			               "<td><img  width='200' height='150' " +   
						//			               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
							"</tr>";

			}
			content += "</table>";
			document.getElementById("somedivS").innerHTML = content;
			keyWordPage = mapData.currPage;
			keyWordTotalPage = mapData.keyWordTotalPage;

			var navContent = "<table><tr height='36'>";
			if (keyWordPage != 1) {
				navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='first'>第一頁</button></td>";
				navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='prev'>前一頁</button></td>";
			} else {
				navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
				navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
			}
			navContent += "<td class='tdbtn' width='200' align='center' style='font-size:18px'>第<b>" + keyWordPage + "</b>頁 / 共" + keyWordTotalPage + "頁</td>";
			if (keyWordPage != keyWordTotalPage) {
				navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='next'>下一頁</button></td>";
				navContent += "<td class='tdbtn' width='80' align='center'><button class='btn button0' id='last'>最末頁</button></td>";
			} else {
				navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
				navContent += "<td class='tdbtn' width='80' align='center'>&nbsp;</td>";
			}
			navContent += "</table>";
			document.getElementById("navigation").innerHTML = navContent;
			var firstBtn = document.getElementById("first");
			var prevBtn = document.getElementById("prev");
			var nextBtn = document.getElementById("next");
			var lastBtn = document.getElementById("last");
			if (firstBtn != null) {
				firstBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (prevBtn != null) {
				prevBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (nextBtn != null) {
				nextBtn.onclick = function() {
					asynRequest(this.id);
				}
			}

			if (lastBtn != null) {
				lastBtn.onclick = function() {
					asynRequest(this.id);
				}
			}
		}
	}
</script>
</body>
</html>