<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/owl.theme.default.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<!-- <link href="/docs/4.2/dist/css/bootstrap.css" rel="stylesheet"> -->
<link href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" rel="stylesheet">
<!-- <link href="/docs/4.2/assets/css/docs.min.css" rel="stylesheet"> -->

<meta charset="UTF-8">
<title>Hot News</title>
<script>
        var url = 'http://newsapi.org/v2/top-headlines?' +
            'country=kr&' +
            'apiKey=054094dd99a94d729e84890939ac8370';
        var req = new Request(url);
        fetch(req)
            .then(function (response) {
                console.log(response.json());
            })
    </script>
</head>
<body><div style="background-color: #f8f2e4">
<!-- 	<div class="wrapper_box" style="background-color: #f8f2e4"> -->
		<!--wrapper 開始-->
<!-- 		<div class="wrapper"> -->
			<!--header_box 開始-->
<!-- 			<div class="header_box"> -->
				<!--header 開始-->
<!-- 				<div class="header"> -->
					<!--主視覺-圖片 開始-->
<!-- 					<div class="visual"> -->
<%-- 						<img src="${pageContext.request.contextPath}/images/MT/News_.jpg" /> --%>
<!-- 					</div> -->
					<!--主視覺-圖片 結束-->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="nav nav_ori" style="background-color: #f7ebcd; height: 49px"> -->
			
				<div style="float: left; margin-right: 10px; margin-bottom: 10px">
					<label for="Country">國家:</label> <select id="Country">
						<option value="none">請選擇國家</option>
						<option value="tw">台灣</option>
						<option value="jp">日本</option>
						<option value="kr">韓國</option>
						<option value="hk">香港</option>
						<option value="us">美國</option>
					</select><br>
				</div>
				<div style="float: left;">
					<label for="Category">新聞分類:</label> <select id="Category">
						<option value="noneCate">請選擇分類</option>
						<option value="topHeadlines">熱門頭條</option>
						<option value="business">商業</option>
						<option value="entertainment">娛樂</option>
						<option value="health">健康</option>
						<option value="science">科學</option>
						<option value="sports">體育</option>
						<option value="technology">技術</option>
					</select>
				</div>
				
				<div id="myImg"></div>
			<!--         <div id="todayNews"></div> -->
<!-- 		</div> -->
		<script>
        var mySelect = document.getElementById("Country");//定位id(获取select)
        var index = mySelect.selectedIndex;// 选中索引(选取select中option选中的第几个)
        var text = mySelect.options[index].text; // 选中文本
        var value = mySelect.options[index].value; // 选中值
        var strCountry = "";
        mySelect.options[index].selected
        mySelect.onchange = function () {

            var content = '';

            if (mySelect.options[0].selected == true) {
                strCountry = "";
                console.log(0 + "--->" + strCountry);
            } if (mySelect.options[1].selected == true) {
                strCountry = "tw";
                console.log(1 + "--->" + strCountry);
            } if (mySelect.options[2].selected == true) {
                strCountry = "jp";
                console.log(2 + "--->" + strCountry);
            } if (mySelect.options[3].selected == true) {
                strCountry = "kr";
                console.log(3 + "--->" + strCountry);
            } if (mySelect.options[4].selected == true) {
                strCountry = "hk";
                console.log(4 + "--->" + strCountry);
            } if (mySelect.options[5].selected == true) {
                strCountry = "us";
                console.log(5 + "--->" + strCountry);
            }
            console.log("Country-----dddd");
            console.log(strCountry);

            var url = 'http://newsapi.org/v2/top-headlines?' +
                'country=' + strCountry +
                '&apiKey=054094dd99a94d729e84890939ac8370';

            //----------------------------------------------------------------
            var cateSelect = document.getElementById("Category");//定位id(获取select)
            var index = cateSelect.selectedIndex;// 选中索引(选取select中option选中的第几个)
            var text = cateSelect.options[index].text; // 选中文本
            var value = cateSelect.options[index].value; // 选中值
            var strCate = "";
            cateSelect.options[index].selected
            cateSelect.onchange = function () {

                var content = '';

                if (cateSelect.options[0].selected == true) {
                    strCate = "";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[1].selected == true) {
                    strCate = "category=general&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[2].selected == true) {
                    strCate = "category=business&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[3].selected == true) {
                    strCate = "category=entertainment&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[4].selected == true) {
                    strCate = "category=health&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[5].selected == true) {
                    strCate = "category=science&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[6].selected == true) {
                    strCate = "category=sports&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[7].selected == true) {
                    strCate = "category=technology&";
                    console.log("Category--->" + strCate);
                }

                console.log("Category----------");
                console.log(strCate);

                url = 'http://newsapi.org/v2/top-headlines?' +
                    'country=' + strCountry + "&" + strCate +
                    'apiKey=054094dd99a94d729e84890939ac8370';

                console.log("url----->" + url);

                //----------------------------------------------------------------

                $.ajax({
                    url:
                        url,
                    method: "GET",
                    error: function () {
                        console.log("6666");
                    },
                    success: function (data) {

                        document.getelementByid
                        processData(data);
                    }
                });

                function processData(data) {
                    var articleItems = [];
                    var divs = document.getElementById("todayNews");
                    var noImage = document.getElementById("myImg").src = "${pageContext.request.contextPath}/img/NO_IMAGE.png";	//無圖片的話顯示noImage.png
                    for (var i = 0; i < data.articles.length; i++) {
                        var author = data.articles[i].author;
                        var title = data.articles[i].title;
                        var description = data.articles[i].description;
                        var publishedAt = data.articles[i].publishedAt;
                        var artUrl = data.articles[i].url;
                        var urlToImage = data.articles[i].urlToImage;

                        if (urlToImage == null) {
                            urlToImage = noImage;
                        }

                        var authorStr = "新聞網";
                        if (author == null) {
                            author = authorStr;
                        }
                        content += '<div class="bd-example" style="margen:10px; padding:10px"><div class="card p-3" >   <div class="card-body" style="margen: 0 auto">'+
                        			'<a href="' + artUrl + '"><div class="title"><div class="card-title">' + title + "</div ></div ></a>" +			
                        			'<div class="author" ><div class="card-text">新聞來源: ' + author + "</div ></div >" +
                 	  				'<div class="urlToImage" ><div class="bd-placeholder-img card-img-top" ><img style="height: 100%; width: 100%;" src=' + urlToImage + " '/></div ></div >"+
                 	 			  	"<div class='description'><div class='card-text'>" + description + "</div ></div></div></div></div>" 
//                  	   				'<div class="publishedAt"><div class="card-footer">更新時間: ' + publishedAt + "</div ></div >"
                        
                        
                        
//                         content += '<div class="card-body">'+
//                         		   '<div class="author" ><div class="card-subtitle mb-2 text-muted">新聞來源: ' + author + "</div ></div >" +
//                             	   '<a href="' + artUrl + '"><div class="title"><div class="card-title">' + title + "</div ></div ></a>" +
//                             	   '<div class="urlToImage" ><div class="bd-placeholder-img card-img-top"><img src=' + urlToImage + " width=300 height=190'/></div ></div >"+
//                             	   "<div class='description'><div class='card-text'>" + description + "</div ></div ></div>" 
// //                             	   '<div class="publishedAt">更新時間: ' + publishedAt + "</div ></div>"

                        divs.innerHTML = content;
                    }
                }
            }
        }
    </script>
<!-- 		<div class="container_box"> -->
<!-- 			<div class="bd-example"> -->
<!-- 				<div class="card-columns"> -->
<!-- 					<div class="c1"> -->
						
<!-- 						<div class="part_thumb_1 clearfix"> -->

<div class="container-fluid">
<div class="row flex-xl-nowrap">
			<main class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content" role="main" >
			<br><h1 class="title_1" style="text-align: center;  font-size: 2em;">今 日 新 聞</h1><br>
			
			
			
<!-- 				<div class="bd-example"> -->
<!-- 					<div class="card-columns"> -->
<!-- 						<div class="card"> -->
							<div id="todayNews" style="column-break-inside: avoid">
<!-- 							<div id="todayNews" style="display: inline-block;"> -->
							</div>
<!-- 						</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				</main>
		</div>
		</div>
		</div>
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="footer_box">
			<!--footer 開始-->
			<div class="footer">
				<address>
					<p>
						快樂夥伴新媒體控股股份有限公司&nbsp;&nbsp;版權所有&nbsp;&nbsp;非經授權，不許轉載本網站內容<br>
						&copy;iiiNews.net&nbsp;&nbsp;All Rights Reserved.
					</p>
				</address>
			</div>
			<!--footer 結束-->
		</div>
		
<!-- 	</div> -->
</body>
</html>