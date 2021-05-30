<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@import url('https://fonts.googleapis.com/earlyaccess/notosanskr.css');

@font-face {
	font-family: "NEXON Lv1 Gothic OTF";
	src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff") format("woff");
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "NEXON Lv1 Gothic OTF Light";
	src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff") format("woff");
	font-weight: normal;
	font-style: normal;
}

html, body{overflow: hidden !important; }

body {margin:0;padding:0;font-size:0.95em; font-family: Inter, "NEXON Lv1 Gothic OTF" !important; background:#fff;}
html, h1, h2, h3, h4, h5, h6, form, fieldset, img {margin:0;padding:0;border:0}
h1, h2, h3, h4, h5, h6 {font-size:17px; font-family: Inter, "NEXON Lv1 Gothic OTF" !important;}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {display:block}

ul,dl,dt,dd {margin:0;padding:0;list-style:none}
legend {position:absolute;margin:0;padding:0;font-size:0;line-height:0;text-indent:-9999em;overflow:hidden}
label, input, button, select, img {vertical-align:middle;font-size:1em}
input, button {margin:0;padding:0; font-family: Inter, "NEXON Lv1 Gothic OTF" !important; font-size:1em}

button {cursor:pointer}

textarea, select {font-family: Inter, "NEXON Lv1 Gothic OTF" !important; font-size:1em}
select {margin:0}
p {margin:0;padding:0;word-break:break-all}
hr {display:none}
pre {overflow-x:scroll;font-size:1.1em}
a {color:#000;text-decoration:none;}

*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

img {
    max-width: 100%;
    height: auto;
    width: auto\9;
}

  .content{max-width: 1200px; margin: 0 auto;}
  
  .notice-box{margin: 0px 10px;}
  .notice-box h2{text-align: center; margin-top: 30px; color:rgb(255, 161, 53);}
  .notice-box h1{text-align: center; margin: 40px 0;}
  
</style>
<body>
<div class="content">
<div class="notice-wrap">
<div class="notice-box">
	<h1>게시물 상세 페이지</h1>
		id : ${article.id } <br>
		제목 :${article.title } <br>
		날짜 : ${article.regDate } <br>
		갱신 날짜 : ${article.updateDate } <br>
		내용 : ${article.content } <br>
	
	<button onclick="location.href='list'">목록</button>
	<button onclick="location.href='modify?id=${article.id }'">수정</button>
	<button onclick="fn_delete(${article.id });return false;">삭제</button>
</div>
</div>
</div>
</body>

<script>

function fn_delete(id){
	if(confirm("삭제하시겠습니까?")){
		location.href="doDelete?id="+id;
	}
}
</script>
</html>