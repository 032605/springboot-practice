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
<h1>게시물 상세 페이지</h1>
id : ${article.id } <br>
제목 :${article.title } <br>
날짜 : ${article.regDate } <br>
갱신 날짜 : ${article.updateDate } <br>
내용 : ${article.content } <br>


<button>목록</button>
<button>수정</button>
<button>삭제</button>
</body>
</html>