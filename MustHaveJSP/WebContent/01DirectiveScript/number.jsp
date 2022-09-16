<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//순서1. 클라이언트가 웹브라우저 주소창에 http://localhost:8082/MustHaveJSP/01DirectiveScript/number.jsp
		//		주소를 입력해서 number.jsp서버페이지를 웹어플리케이션 서버(tomcat)에 요청한다.
	
		
		//순서2. request.getParameter("num"); => null이 되므로
		//			Integer.parseInt(null); -> 정수로 변환할 수 없어 NumberFormatException 500에러가 발생함
		int num = Integer.parseInt(request.getParameter("num"));
		
		
	
	%>
	<h1>쇼핑몰 사이트입니다.</h1>
</body>
</html>