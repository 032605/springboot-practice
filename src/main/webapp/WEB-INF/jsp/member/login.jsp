<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../header.jsp"></jsp:include>

<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="login-box">
	<h1>로그인</h1>
				<script>
			// Submit 중복 방지용
			var loginFormSubmitDone = false;
			function loginFormSubmit(form){
				if (loginFormSubmitDone) {
					alert('처리 중입니다.');
				}
				
				// 아이디 유효성 검사
				form.me_id.value = form.me_id.value.trim();
				
				if(form.me_id.value.length == 0 ) {
					alert ('아이디를 입력해주세요');
					form.me_id.focus();
					return;
				}
				
				// 아이디 소문자로 변경
				form.me_id.value = form.me_id.value.toLowerCase();
				
				// 비밀번호 유효성 검사 
				form.me_password.value = form.me_password.value.trim();
				
				if(form.me_password.value.length == 0 ) {
					alert ('비밀번호를 입력해주세요');
					form.me_password.focus();
					return;
				}
				
				form.submit();
				loginFormSubmitDone = true;
			}
			</script>
			
	<form action="doLogin" method="post" onsubmit="loginFormSubmit(this); return false;">
		<div class="login">
		   <span>아이디(이메일)</span>
		   <input type="text" name="me_id" placeholder="아이디">
		   <span>비밀번호</span>
		   <input type="password" name="me_password"  placeholder="비밀번호">
		   <input type ="submit" value="로그인" />
		   <label><input type="checkbox" id="chk-notice" value="log-in">&nbsp로그인 상태 유지</label>
		</div>
	</form>
	<div class="findIdPw">
	   <a href="#none">아이디 찾기</a>
	   <a href="#none">비밀번호 찾기</a>
	   <a href="join">회원가입</a>      
	</div>
</div>
</body>

<script>
	function submit
</script>
</html>