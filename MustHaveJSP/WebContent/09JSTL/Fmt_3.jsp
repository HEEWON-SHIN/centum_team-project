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

	<%-- fmt:setlocale태그를 사용하면 국가별로 다른 통화 기호나 날짜를 표현할 수 있다. --%>

	<h4>로케일 설정</h4>
	
	<c:set var="today" value="<%=new java.util.Date()%>"/><br>
	${today}
	<br>
	
	한글로 설정 : 
	
		<fmt:setLocale value="ko_kr"/>
		<fmt:formatNumber value="10000" type="currency" groupingUsed="true"/><%--₩10,000 --%>
		
		 / <fmt:formatDate value="${today}" /><%-- dateStyle속성을 생략하면 dateStyle="default"가 기본값으로 지정된다,, 2022. 8. 30. --%>
	
	<br><br>
	
	일본어로 설정 :
		
		<fmt:setLocale value="ja_jp"/>
		<fmt:formatNumber value="10000" type="currency" groupingUsed="true"/><%--￥10,000 --%>
		
		 / <fmt:formatDate value="${today}" /><%--  2022/08/30 --%>
		 
	<br><br>
	
	영어로 설정 :
		
		<fmt:setLocale value="en_US"/>
		<fmt:formatNumber value="10000" type="currency" groupingUsed="true" var="v"/><%--$10,000.00 --%>
		
		 <fmt:formatDate value="${today}" var="v1" /><%-- Aug 30, 2022 --%>
		 ${v} / ${v1}
		 

</body>
</html>