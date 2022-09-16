<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 로그인 폼과 응답 헤더 설정 페이지 --%>
	
	<h2>1. 로그인 폼</h2>
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
	
		//2. 로그인 실패 여부를 알아내기 위해 loginErr=1을 request내장객체 영역에서 꺼내어 판단
		String loginErr = request.getParameter("loginErr");
		
		if(loginErr != null){//loginErr은 키,,1이라는 값이 저장돼 있으므로 null이 아니다.
			
			out.print("로그인 실패");//클라이언트 웹브라우저로 응답
		}
	
	%>
	<%--
		로그인폼 영역에 아이디와 패스워드를 입력한 후 [로그인]버튼을 클릭하면
		ResponseLogin.jsp서버페이지로 전송된다.	
	 --%>
	<form action="./ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id"> <br>
		패스워드 : <input type="text" name="user_pw"> <br>
		<input type="submit" value="로그인">
	</form>
	
	<h2>2. HTTP 응답 헤더 설정하기</h2>
	<%-- 
		response내장객체는 클라이언트의 웹브라우저로 응답할 정보를 추가해서 설정해두는 메모리 기능을 제공한다.
		정보 추가용 메소드는 add계열과, set계열이 있다.
			add계열은 헤더값을 새로 추가할 때 사용하고,
			set계열은 기존의 헤더 정보를 수정할 때 사용한다.
	 --%>
		
	<form action="./ResponseHeader.jsp" method="get">
		날짜형식 : <input type="text" name="add_date" value="2021-10-25">
		숫자형식 : <input type="text" name="add_int" value="8282"> <br>
		문자형식 : <input type="text" name="add_str" value="홍길동"> <br>
		 <input type="submit" value="응답 헤더 설정 & 출력">
	
	</form>
	
	
</body>
</html>