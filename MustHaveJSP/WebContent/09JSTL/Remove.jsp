<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%--각각의 내장객체 영역에 scopeVar라는 똑같은 이름의 변수 선언 --%>
    <c:set  var="scopeVar" value="Page Value"/>
    
    <c:set var="scopeVar" value="Request Value" scope="request"/>
    
    <c:set var="scopeVar" value="Session Value" scope="session"/>
    
    <c:set var="scopeVar" value="Application Value" scope="application"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>출력하기</h4>

	<ul>
		<%-- 내장객체 영역에 접근하는 xxxScope.을 생략하면 가장 작은 영역인 page영역이 지정됨 --%>
		<li>scopeVar : ${scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>


	<h4>session영역의 변수 삭제하기</h4>
	<%-- var에는 삭제할 변수명 적어줌! --%>
	<c:remove var="scopeVar" scope="session"/>
	
	<ul>
		
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li><%-- 빈 공백 출력됨 --%>
		
	</ul>
	
	
	<h4>scope영역을 생략해서 전 영역의 변수 모두 삭제하기</h4>
	<%-- var에는 삭제할 변수명 적어줌! --%>
	<c:remove var="scopeVar"/>
	
	<ul>
		<li>scopeVar : ${scopeVar}</li>
		
		<li>scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>
	
</body>
</html>