<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../header.jsp"></jsp:include>

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