<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
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

	<h4>List 컬렉션 이용하기</h4>

	<%
		ArrayList<Person> pList = new ArrayList<Person>();//Person객체만 저장할 가변길이 배열 생성 
	
			pList.add(new Person("성삼문", 55));
			pList.add(new Person("박팽년", 60));
	
	%>

	<%-- 생성한 ArrayList를 request영역에 저장하기 위해 c:set태그(변수명은 personList, 값은 pList를 저장) 이용! --%>
	<c:set var="personList" value="<%=pList%>" scope="request" />

	<ul>
		<%-- ArrayList배열의 0 index위치에 저장된 new Person("성삼문", 50)객체를 꺼내와서
			 Person객체 내부의 name, age값을 EL로 얻어 출력
		 --%>
		<li>이름 : ${requestScope.personList[0].name}</li>
		<li>나이 : ${personList[0].age}</li><br>
		
		<li>이름 : ${requestScope.personList[1].name}</li>
		<li>나이 : ${personList[1].age}</li><br>
		
	</ul>
	
	
	<h4>Map 컬렉션 이용하기</h4>
	
	<%
		Map<String, Person> pMap = new HashMap<String, Person>();
		
		pMap.put("personArgs1", new Person("하위지", 65) );
		pMap.put("personArgs2", new Person("이개", 67) );
	%>
	 
	<c:set var="personMap" value="<%=pMap%>" scope="request"/>
	
	<ul>
		<%-- HashMap에 저장된 값(value)를 얻어올 때는	키(personArgs2)를 이용해서 name값 얻음 --%>
		<li>이름 : ${requestScope.personMap.personArgs2.name}</li>
		<li>나이 : ${personMap.personArgs2.age }</li>
	</ul>



</body>
</html>