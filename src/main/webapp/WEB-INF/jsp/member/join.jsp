<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- 상단 헤더 불러오기 -->
 <jsp:include page="../header.jsp"></jsp:include>
<body>
<div class="circle-small"></div>
<div class="circle-big"></div>

<div class="join-box">
	<h1>회원가입</h1>
		<div class="join">
			
			<form action="doJoin" method="post">
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userNickName">닉네임</label>
					<input class="form-control" type="text" id="userNickName" name="me_nickname" placeholder="닉네임"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디(이메일)</label>
					<input class="form-control" type="text" id="userId" name="me_id"  placeholder="아이디(이메일)"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="me_password" placeholder="비밀번호"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass2">비밀번호 확인</label>
					<input class="form-control" type="password" id="userPass2" name="userPass2" placeholder="비밀번호 확인"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="checkDevLang">선호 개발 언어</label>
					<div class="checkDevLangDiv">
						<ul>
							<li><label><input type="checkbox" name="devLang" value="Java">Java</label></li>
							<li><label><input type="checkbox" name="devLang" value="Python">Python</label></li>
							<li>
								<label><input type="checkbox" name="devLang" value="JSP">JSP</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="PHP">PHP</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="C">C</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="C++">C++</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="R">R</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="Git">Git</label>
							</li>
							<li>
								<label><input type="checkbox" name="devLang" value="Etc">Etc</label>
							</li>
						</ul>
					</div>
				</div>

				<div class="form-group has-feedback">
					<input type="submit" class="btn btn-success" value="가입하기" />
				</div>
			</form>
		</div>
	
	<div class="button">
		<a href="/login">이전</a>
	</div>
</div>

</body>

<script>
	function submit
</script>
</html>