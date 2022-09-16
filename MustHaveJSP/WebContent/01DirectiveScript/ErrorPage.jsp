<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 현재 ErrorPage.jsp파일 내부에서 에러가 발생하면 에러를 처리할 서버페이지 주소(IsErrorPage.jsp)를 작성 -->
  <%@ page errorPage="IsErrorPage.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러가 발생하는 ErrorPage.jsp</title>
</head>
<body>

	<%
		int myAge = Integer.parseInt(request.getParameter("age"))+ 10;	//err,,입력값이 없기 때문
	
		out.println("10년 후 당신의 나이는 "+ myAge + "입니다.");//실행 안됨
	
	
	
	%>

</html>