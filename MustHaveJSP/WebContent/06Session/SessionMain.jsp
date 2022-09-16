<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//SimpleDateFormat클래스를 활용해 날짜 표시 형식을
	//'시:분:초'형태로 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");//대소문자 구별할 것!
	
	//세션의 최초 요청 시각(세션 생성 시각) 구하기
	long creationTime = session.getCreationTime();
	
	//format메소드를 이용해서 ㅣlong타입의 세션최초 생성 시각을 날짜 표시 형식에 맞는 문자열로 바꿔 변수에 저장
	String creationTmeStr = dateFormat.format(new Date(creationTime));
	
	//마지막 요청 시각
	long lastTime = session.getLastAccessedTime();
	//지정한 날짜표시 형식에 맞는 문자열로 바꿔준 후에, 변수에 저장
	String lastTimeStr = dateFormat.format(new Date(lastTime));

	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Session설정 확인</h2>
		<ul>
		
			<%--web.xml에서 설정한 세션 유지 시간을 출력 --%>
			<li>세션 유지 시간 : <%=	session.getMaxInactiveInterval() %></li><%--1200(=20분) 반환 --%>
		
			<%-- 웹브라우저에 생성된 세션ID를 출력 --%>
			<li>세션 아이디 : <%=	session.getId() %></li>
			
			<%-- 세션 최초 요청 시각과 마지막 요청 시각을 출력 --%>
			<li>세션 최초 요청시각 : <%=creationTmeStr %></li>
			<li>세션 마지막 요청시각 : <%=lastTimeStr %></li>
	
		</ul>
	
	
</body>
</html>