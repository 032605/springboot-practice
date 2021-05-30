<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<style>
/* 초기화 */
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

body {margin:0;padding:0;font-size:0.75em; font-family: Inter, "NEXON Lv1 Gothic OTF" !important; background:#fff;}
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

  /* 게시판 */
  .content{max-width: 1200px; margin: 0 auto;}
  
  .notice-box{margin: 0px 10px;}
  .notice-box h2{text-align: center; margin-top: 30px;}
  .notice-box h2 > span{color:rgb(255, 161, 53);}
  .notice-box h1{text-align: center; margin: 40px 0;}
  
  .serch-box {
      align-items: center;
      text-align: right;
      margin-bottom: 15px;
  }
  .serch-box input{
      border: 1.5px solid rgb(255, 161, 53);
      height: 24px;
      vertical-align: middle;
  }
  .serch-box button {
      background-color: #fff;
      color: rgb(255, 161, 53);
      border: 1.5px solid rgb(255, 161, 53);
      font-weight: bold;
      vertical-align: middle;
      font-size: 16px;
      padding: 3px 8px;
  }
  
  .mypage-table {background-color: #fff;}
  
  .mypage-table ul.table-hd{
      text-align: center;
      border-top: 2px solid rgb(255, 161, 53);;
  }
  
  .mypage-table ul.table-bd{text-align: center;}
  
  .mypage-table ul.table-bd .subject{text-align: left;}
  
  .mypage-table ul li {
      display: table;
      width: 100%;
  }
  
  .mypage-table ul li > div{
      display: table-cell;
      border-bottom: 1px solid rgb(241, 185, 121);
      padding: 10px 0;
  }
  
  .table-bd .id {width: 15%;}
  .table-bd .title {width: 20%;}
  .table-bd .title {text-align: left;}
  .table-bd .title a{font-weight: bold;}
  .table-bd .title a:hover{text-decoration: underline; color: rgb(255, 161, 53);}
  .table-bd .content {width: 20%;}
  .table-bd .regDate {width: 20%;}
  .table-bd .updateDate {width: 20%;}  
  
  /* 페이지 */
  .paging ul {text-align: center; margin: 20px;}
  .paging ul li {display: inline-block; margin-top: 5px;}
  .paging ul li a{display: block; padding: 5px 10px; border: 1.5px solid rgb(255, 161, 53); background-color: #fff; color: rgb(32, 22, 11);}
  .paging ul li.on a{background-color: rgb(255, 161, 53); color: #fff; border: 1.5px solid rgb(255, 161, 53);} 
  
  .bbs-btn-box{text-align: right; margin: 10px;}
    .bbs-btn-box a{
      display: inline-block;
      background-color: rgb(255, 161, 53);
      color: #fff;
      padding: 5px 10px;
      border: 1.5px solid rgb(255, 161, 53);
  }
  
  .bbs-btn-box .back{
      background-color: #fff;
      color: rgb(255, 161, 53);
      border: 1.5px solid rgb(255, 161, 53);
  }
</style>
<body>
<div class="content">
<div class="notice-wrap">
<div class="notice-box">
  <h2>안녕하세요! <span class="name"> ${name }</span>님!</h2>
  <h1>게시물 리스트</h1>
      <div class="serch-box">
          <input type="text">
          <button>검색</button>
      </div>

	 <div class="mypage-table">
	        <ul class="table-hd">
	            <li>
	                <div class="id">번호</div>
	                <div class="title">제목</div>
	                <div class="content">내용</div>
	                <div class="regDate">등록일</div>
	                <div class="updateDate">갱신</div>
	            </li>
	        </ul>
	  <ul class="table-bd">
		<c:forEach items="${articles }" var="article">
	      	<li>
               <div class="id">${article.id }</div>
               <div class="title"><a href="detail?id=${article.id }">${article.title }</a></div>
               <div class="content">${article.content }</div>
               <div class="regDate">${article.regDate }</div>
               <div class="updateDate">${article.updateDate }</div>
           </li>
		</c:forEach>
		</ul>
	</div>
</div>
</div>

    <div class="paging">
        <ul>
             <li><a href="#">처음으로</a></li>
            <li><a href="#">이전</a></li>
            <li class="on"><a href="list?page=1">1</a></li>
            <li><a href="list?page=2">2</a></li>
            <li><a href="list?page=3">3</a></li>
            <li><a href="#">다음</a></li>
            <li><a href="#">마지막</a></li>
        </ul>
    </div>
	<div class="bbs-btn-box">
		<a href="post">글 작성</a>
	</div>
</div>
</body>
</html>