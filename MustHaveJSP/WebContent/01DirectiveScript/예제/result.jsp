<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과출력창</title>
</head>
<body>
	<h1>결과 출력</h1>
<%
	/*
	result.jsp서버페이지의 역할
		1. 클라이언트가 요청한 값을 얻는다.
		2. 요청한 값을 이용해 웹브라우저로 응답할 데이터를 마련.
		3. 마련된 응답할 데이터를 웹므라우저로 전송하여 응답(출력)
	*/
	
	//입력한 아이디와 비밀번호 중 한글이 하나라도 존재하면 request객체 메모리에서 꺼내오면
	//한글이 깨진 상태로 들고오기 때문에...
	//한글이 깨지지 않도록하기 위해서 request객체메모리의 인코딩 방식을 UTF-8로 설정!
	request.setCharacterEncoding("utf-8");

	//1. 클라이언트가 요청한 값을 얻는다.
	//		- login.html화면에서 입력한 아이디, 비밀번호(요청한 값)를 request객체 메모리로부터 얻는다
	//		- 문법 : request.getParameter("<input>태그의 name속성값");
	String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");

	
	//2. 요청한 값을 이용해 웹브라우저로 응답할 데이터를 마련.
	//		- 클라이언트가 입력한 아이디 비밀번호를 클라이언트에게 알려주기 위해 입력한 아이디와 비밀번호 자체를
	//		  웹브라우저로 응답할 값으로 사용하자.(user_id, user_pw에 저장된 데이터)
	
	
	//3. 마련된 응답할 데이터를 웹브라우저로 전송하여 응답(출력)
%>

	<h1>아이디 : <%= user_id %></h1>
	<h1>비밀번호 : <%= user_pw %></h1>

</body>
</html>