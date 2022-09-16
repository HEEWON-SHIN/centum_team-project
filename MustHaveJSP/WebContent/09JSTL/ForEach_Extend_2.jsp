<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>List 컬렉션 사용하기</h4>
	<%
		LinkedList<Person> lists = new LinkedList<Person>();
		lists.add(new Person("맹사성", 34));
		lists.add(new Person("장영실", 44));
		lists.add(new Person("신숙주", 54));
	
	%>
	
	<c:set var="lists" value="<%=lists %>"/>

	<c:forEach var="person" items="${lists}">
		<li>이름 : ${person.name}, 나이 : ${person.age}</li><br>
		
	</c:forEach>
	
	
	<h4>Map컬렉션 사용하기</h4>
	
	<%
		Map<String, Person> maps = new HashMap<String, Person>();
		
		maps.put("1st", new Person("맹사성", 34 ) );
		maps.put("2en", new Person("장영실", 44 ) ); 
		maps.put("3rd", new Person("신숙주", 54 ) );
		
	%>
	
	<c:set var="maps" value="<%=maps %>"/>
	
	<c:forEach var="person" items="<%=maps%>">
	
		<li>키: ${person.key}</li>
		<li>이름: ${person.value.name}, 나이 : ${person.value.age}</li><br>
	
	</c:forEach>

</body>
</html>