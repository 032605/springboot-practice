<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>
<!-- action은 http://localhost:8080/usr/article/post 이부분 말하는거 -->
<form action="doPost">
	<ul>
		<li>제목 <input type="text" name="title" placeholder="제목을 입력해주세요" maxlength="40" /></li>
		<li>내용 <input type="text" name="content" placeholder="내용을 입력해주세요" maxlength="500" /></li>
	</ul>
	<button>이전</button>
	<input type="submit" value="등록" />
</form>

</body>
</html>