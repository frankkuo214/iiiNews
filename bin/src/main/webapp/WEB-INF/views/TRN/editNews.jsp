<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
var NewsId2 = ${NewsId};
var hasError = false;




window.onload = function() {
	var divResult = document.getElementById('resultMsg');
	var NewsId = document.getElementById("NewsId"); 
	var idLabel = document.getElementById("NewsIda");
	var title = document.getElementById("title");
	var ocplace = document.getElementById("ocplace");
	var octime = document.getElementById("octime");
	var founder = document.getElementById("founder");
	var type = document.getElementById("type");
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "<c:url value='/editNews2/" + NewsId2 +" ' />", true);
	xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	xhr.send();	
	var message = "";
	xhr.onreadystatechange = function() {
	 // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
 		   var trkNewsBean = JSON.parse(xhr.responseText);
		   console.log(xhr.responseText);
 		   NewsId2.value = trkNewsBean.NewsId;
		   idLabel.innerHTML = trkNewsBean.NewsId2;
		   title.value = trkNewsBean.title;
		   ocplace.value = trkNewsBean.ocplace;
		   octime.value = trkNewsBean.octime;
		   founder.value = trkNewsBean.founder;
		   type.value = trkNewsBean.type;
	    }
     }
	console.log(NewsId2)
	
	var updateData = document.getElementById("updateData");
	var deleteData = document.getElementById("deleteData");
	
	 deleteData.addEventListener('click', (e)=> {
		 var result = confirm("確定刪除此筆記錄(帳號:" + NewsId2 + ")?");
		 if (result) {
			 var xhr2 = new XMLHttpRequest();
			 xhr2.open("DELETE", "<c:url value='/editNews3/' />" + NewsId2, true);
		   	 xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		   	 xhr2.send();
		   	 xhr2.onreadystatechange = function() {
		   	// 伺服器請求完成
		   	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		   		result = JSON.parse(xhr2.responseText);
		   		if (result.fail) {
		   			divResult.innerHTML = "<font color='red'>"
						+ result.fail + "</font>";
		   		}else if (result.success) {
		   			window.location.href ="http://localhost:8080/iiiNews/trkNews";
		   		}
		   	}
		   	}
		 }
	 })
  
	  updateData.onclick = function() {
		  hasError = false;
		// 讀取欄位資料	
		  var titleValue = document.getElementById("title").value;
			var ocplaceValue = document.getElementById("ocplace").value;
			var founderValue = document.getElementById("founder").value;
			var typeValue = document.getElementById("type").value;
			var div0 = document.getElementById('result0c');
			var div1 = document.getElementById('result1c');
			var div2 = document.getElementById('result2c');
			var div3 = document.getElementById('result3c');
// 			if (!idValue){
// 				setErrorFor(div0, "請輸入帳號");
// 	   		} 	else {
// 	      		div0.innerHTML = "";
// 	   		}
// 			if (!nameValue){
// 				setErrorFor(div1, "請輸入姓名");
// 			} else {
// 				div1.innerHTML = "";
// 			}
// 			if (!balanceValue){
// 				setErrorFor(div2, "請輸入餘額");
// 			} else {
// 		   		var objRegex = /^\d+$|(^-?\d\d*\.\d\d*$)|(^-?\.\d\d*$)/;  
// 				if(!objRegex.test(balanceValue))    {  
// 					setErrorFor(div2, "餘額欄必須是數值");
// 	       		} else { 
// 	           		div2.innerHTML = "";
// 	       		}
//	        }
// 			if (!birthdayValue){
// 				setErrorFor(div3, "請輸入生日");  
// 	   		} else if(!dateValidation(birthdayValue)) {
// 				setErrorFor(div3, "生日格式錯誤，正確格式為yyyy-MM-dd");
// 	   		} else {
// 	       		div3.innerHTML = "";
// 	   		}
// 	   		if (hasError){
// 	       		return false;
// 	   		}
			var xhr1 = new XMLHttpRequest();
			xhr1.open("PUT", "<c:url value='/editNews4/' />" + NewsId2, true);
			var jsontrkNewsBean = { 
					"trackId": NewsId2, 					  //"trackId" :  左邊必須跟Bean裡面的key的名子一模一樣   NewsId2,  右邊必須跟網頁上蘭為名稱相同 
					"title": titleValue, 	                  //"title"   :                            titleValue,
					"ocplace": ocplaceValue,                  //"ocplace" :                             ocplaceValue,
					"founder": founderValue,                  //"founder" :                            founderValue,
					"type": typeValue                         //"type"    :                              typeValue
			}
			xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr1.send(JSON.stringify(jsontrkNewsBean));
			
			xhr1.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
					result = JSON.parse(xhr1.responseText);
// 					if (result.fail) {
// 				 		divResult.innerHTML = "<font color='red' >"
// 							+ result.fail + "</font>";
// 			  		} else if (result.success) {
// 						divResult.innerHTML = "<font color='GREEN'>"
// 							+ result.success + "</font>";
// 						div0.innerHTML = "";	
// 						div1.innerHTML = "";
// 						div2.innerHTML = "";
// 						div3.innerHTML = "";
// 			 		} else {
// 			 			if (result.idError) {
// 		          			div0.innerHTML = "<font color='green' size='-2'>"
// 			     				+ result.idError + "</font>";
// 						} else {
// 		          			div0.innerHTML = "";
// 						}
// 			 			if (result.nameError) {
// 			      			div1.innerHTML = "<font color='green' size='-2'>"
// 								+ result.nameError + "</font>";
// 						} else {
// 			      			div1.innerHTML = "";
// 			   			}
// 			 			if (result.balanceError) {
// 		          			div2.innerHTML = "<font color='green' size='-2'>"
// 								+ result.balanceError + "</font>";
// 						} else {
// 		          			div2.innerHTML = "";
// 		    			}
// 						if (result.birthdayError) {
// 			    			div3.innerHTML = "<font color='green' size='-2'>"
// 								+ result.birthdayError + "</font>";
// 						} else {
// 		          			div3.innerHTML = "";
// 						}
// 			 		}
				}
			}
	  }
};
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1091105
	<div align='center'>
		<h2>修改會員資料</h2>
		<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
		<hr>
		<fieldset style='display: inline-block; width: 820px;'>
			<legend>請修改下列資料</legend>
			<input type="hidden" name="NewsId" id='NewsId'><br>
			<table border='1'>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;帳號: <label id='NewsIda'></label><br>
					</td>
					<td width='200'>
						<div id='result0c' style="height: 10px;"></div> <br>
						<div id='result0s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;標題: <input type="text" name="title"
						id='title'><br>
					</td>
					<td width='200' style="vertical-align: top">
						<div id='result1c' style="height: 10px;"></div> <br>
						<div id='result1s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp; 發生地點: <input type="text" name="ocplace"
						id='ocplace'><br>
					</td>
					<td width='200' style="vertical-align: top">
						<div id='result2c' style="height: 10px;"></div> <br>
						<div id='result2s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;發生時間: <input type="text" name="octime"
						id='octime' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;建立人: <input type="text" name="founder"
						id='founder' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;類型: <input type="text" name="type"
						id='type' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='50'>
					<td colspan='3' align='center'>
						<button id='updateData'>更新</button>
						<button id='deleteData'>刪除</button>
					</td>
				</tr>
			</table>
		</fieldset>
		<hr>
		<p>
			<a href="<c:url value='/'  />">回前頁</a>
		<hr>
	</div>

</body>
</html>