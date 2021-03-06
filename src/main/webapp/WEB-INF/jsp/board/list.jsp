<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- 상단 헤더 불러오기 -->
<jsp:include page="../header.jsp"></jsp:include>

<c:set var="title" value="게시물 리스트" />
<div class="content">
<div class="notice-wrap">
<div class="notice-box">

<!-- 로그인 세션 확인 방법 ${sessionScope }  -->



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