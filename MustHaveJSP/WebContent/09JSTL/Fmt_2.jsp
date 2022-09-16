<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    <%-- JSTL라이브러리의 Formatting태그들을 사용하기 위해 taglib 지시자를 선언 --%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- java.util패키지의 Date클래스의 객체를 생성해서 변수에 저장한다.
		 Date를 기본 생성자로 만들면 생성한 날짜와 시간을 값으로 갖는 Date 객체가 만들어진다.	
	 --%>
	 
	 <c:set var="today" value="<%=new Date()%>" scope="page"/>
	 
	 	  
	 <h4>날짜 포맷</h4>
	 <%-- 날짜 포맷을 출력하기 위해 type="date"로 설정한다. 날짜 스타일은 dateStyle속성에 각각 저장한다.  --%>
	 
	 full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br><!-- 2022년 8월 30일 화요일 -->

	 short : <fmt:formatDate value="${today}" type="date" dateStyle="short"/><br> <!-- 22. 8. 30. -->
	 
	 long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/><br><!-- 2022년 8월 30일 -->
	 
	 default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/><br><!--  2022. 8. 30. -->
	 
	 <hr>
	 
	<h4>시간 포맷</h4>
	<%-- 시간 포맷을 출력하기 위해 type="time"으로 설정한다. 시간 스타일은 timeStyle속성에 각각 값을 지정한다. --%>

	
	full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/><br><!-- 오전 10시 21분 42초 대한민국 표준시 -->

	short : <fmt:formatDate value="${today}" type="time" timeStyle="short"/><br><!-- 오전 10:21 -->
	 
	long : <fmt:formatDate value="${today}" type="time" timeStyle="long"/><br><!-- 오전 10시 21분 42초 KST -->
	 
	default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/><br><!-- 오전 10:21:42 -->

	<hr>

	<h4>날짜, 시간 모두 표시</h4>
	<%-- 날짜와 시간을 동시에 출력하려면 type="both"로 해주면 dateStyle의 값은 위와 동일하다 --%>
	

	<fmt:formatDate value="${today }" type="both" dateStyle="full"/><br><!-- 2022년 8월 30일 화요일 오전 10:24:33 -->
	
	<hr>
	
	<h4>원하는 패턴으로 시간, 날짜 표시하기</h4>
	<%-- pattern속성을 직접 지정해서 우리가 원하는 패턴 형시긍로 날짜와 시간을 출력할 수 있다. --%>
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/><br><%-- 주의~~ 월만 대문자M으로 표시! --%>
	
	<hr>
	
	<h4>타임존 설정</h4>
	<%-- 시간대를 직접 설정하자. 지금까지는 시간대를 별도로 설정하지 않으면 시스템 시간대가 반영됐다.  --%>

	<%-- 한국 현재 날짜와 시간대 표시 --%>
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><%--2022년 8월 30일 화요일 오전 10시 33분 59초 대한민국 표준시 --%>

	<br><br>

	<%-- 뉴욕의 현재 날짜와 시간을 출력 --%>
	<fmt:timeZone value="America/New York">
	
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><%--2022년 8월 30일 화요일 오전 1시 34분 55초 그리니치 표준시 --%>
	</fmt:timeZone>
	
	<br><br>
	
	


</body>
</html>