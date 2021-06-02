<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../header.jsp"></jsp:include>

<div class="content">
<div class="notice-wrap">
<div class="notice-box">
	<h1>게시글 작성</h1>
	<!-- action은 http://localhost:8080/usr/article/post 이부분 말하는거 -->
	<form action="${actionUrl}" method="POST">
		<c:if test="${actionUrl eq 'doModify'}">
	    	<input type="hidden" name="id" value="${article.id }" />
	    	<ul>
		    	<li>글번호 ${article.id } </li>
				<li>작성 날짜 : ${article.regDate }</li>
				<li>갱신 날짜 : ${article.updateDate }</li>
			</ul>
		</c:if>
		<ul>
			<li>제목 <input type="text" name="title" placeholder="제목을 입력해주세요" value="${article.title }" maxlength="40" /></li>
			<li>내용 <textarea id="content" name="content">${article.content }</textarea></li>
		</ul>
		<a href="list">목록</a>
		<input type="submit" value="등록" />
	</form>
</div>
</div>
</div>

</body>
</html>