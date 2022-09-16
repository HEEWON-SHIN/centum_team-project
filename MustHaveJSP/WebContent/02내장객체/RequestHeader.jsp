<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>3. 요청 헤더정보 출력하기</h2>
	<%
		//getHeaderNames()메소드
		//	: 모든 요청 헤더의 이름을 반환한다.
		Enumeration headers =  request.getHeaderNames();
	
		while(headers.hasMoreElements()){//hasMoreElements()를 이용해 출력할 요청 헤더명이 있는 동안 반복!
			
			//헤더명이 더 있다면 요청 헤더의 이름을 얻어온 다음
			String headerName =  (String)headers.nextElement();
			
			//getHeader()메소드에 헤더명을 건내 헤더값을 얻어온다.
			String headerValue = request.getHeader(headerName);
			
			
			out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
		}
	
	
	%>
	
	
	
</body>
</html>