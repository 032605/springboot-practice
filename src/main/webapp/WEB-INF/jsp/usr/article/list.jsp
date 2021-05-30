<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시물 리스트</h1>
<c:forEach items="${articles }" var="article">
id : ${article.id }<br>
날짜 : ${article.regDate } <br>
갱신 날짜 : ${article.updateDate } <br>
제목 : <a href="detail?id=${article.id }">${article.title }</a> <br>
내용 : ${article.content } <br>
<hr />
</c:forEach>
	<button onclick="location.href='post'">글 작성</button>

</body>
</html>