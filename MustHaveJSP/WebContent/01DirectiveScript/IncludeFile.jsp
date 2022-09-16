<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
	<%@ includ %> 인클루드 지시어 태그란?
		- 여러 JSP페이지에서 사용되는 공통 JSP페이지를 만든 후 
		  다른 JSP페이지에서 공통 JSP페이지의 코드내용을 포함시켜 사용할 수 있게하는
		  기능을 하는 태그.
		  
		문법
			<%@ include file="공통JSP페이지.jsp" %>  

 --%>
	 <%
	 	//오늘 날짜를 구하는 코드
	 	LocalDate today = LocalDate.now();
	 
	 	//내일 날짜를 구하는코드
	 	LocalDate tomorrow =  LocalDate.now().plusDays(1);
	 
	 
	 %>
	 
 
</body>
</html>