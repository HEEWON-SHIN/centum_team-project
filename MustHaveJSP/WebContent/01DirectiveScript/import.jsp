<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 날짜 형식을 우리가 원하는 대로 변경해주는 역할을 하는 SimpleDataFormat클래스(외부에 만들어진 클래스)를
    	 현재 import.jsp페이지 내부에서 사용하기 위해 작성   
     --%>
<%@ page import="java.text.SimpleDateFormat" %>    
 
 	<%-- 오늘 날짜 정보를 제공하는 Date클래스(외부 클래스)를 현재 import.jsp페이지 내부에서 사용하기 위해 작성 --%>
<%@ page import="java.util.Date" %> 
 
 
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page지시어 태그의 import속성을 사용하여 외부에 만들어져 있는 클래스 불러오기</title>
</head>
<body>
		<!-- 스크립툴릿 기호 : <%%>안에는 무조건 자바코드 작성! -->
	<%
	
		Date today = new Date();//오늘 날짜 정보를 제공하는 객체 생성
		
		//클라이언트의 웹브라우저로 응답(출력)
		out.println(today + "<br>");		
		
		
		//원하는 형식으로 날짜 정보를 출력하기 위해 객체 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//format()메소드 호출시...Date객체를 전달하면 원하는 형식으로 날짜정보를 문자열로 반환받을 수 있다
		String todaySrt = dateFormat.format(today);
		
		out.println(todaySrt);
	
	%>



</body>
</html>