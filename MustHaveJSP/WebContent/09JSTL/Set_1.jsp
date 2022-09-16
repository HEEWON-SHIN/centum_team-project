
<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <!--  JSTL라이브러리의 Core주제 태그들을 사용하기 위해 taglib지시자를 선언 -->
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 변수 선언 후 내장객체 4개의 영역 중 page영역에 저장함(scope속성 생략하면 자동으로 page영역에 저장됨) -->
	<c:set var="directVar" value="100"/><!-- value값에 EL태그 사용 가능함! -->
	
	<c:set var="elVar" value="${directVar mod 5}"/>
	
	<c:set var="expVar" value="<%=new Date() %>"/>
	
	<c:set var="betweenVar"> 변수에 저장할 값을 설정</c:set>
	
	
	<h4>EL를 이용하여 변수에 저장된 값 얻어 출력</h4>

	<ul>
		<li>directVar : ${ pageScope.directVar }</li>
		
		<li>elVar : ${elVar }</li>
		
		<li>expVar : ${expVar }</li>
		
		<li>betweenVar : ${betweenVar }</li>
				
	</ul>
	
	
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	
	<%-- 자바 빈즈 객체 생성시 생성자를 통해 초기값을 설정하고 request영역에 변수를 저장함. --%>
	<c:set var='personVar1' value='<%=new Person("박문수", 50) %>' scope="request"/>
	
	<%-- <%
		//위의 48번 코드줄을 자바를 이용해서 표현하면 다음과 같다..
		//Person personVar =  new Person("박문수", 50);
		//request.setAttribute("personVar1", personVar);
		//Person person1 = (Person)request.getAttribute("personVar1");
	%>
	
	<ul>
		<li><%=person1.getName() %></li>
		<li><%=person1.getAge() %></li>
	</ul>
	 --%>
		
	<%-- 다시 request영역에 저장된 자바빈즈의 변수값들을 얻어 출력(dto객체의 name과, age 를 이용해서 꺼냄) --%>	
	<ul>
		<li>${requestScope.personVar1.name}</li>
		<li>${personVar1.age}</li>
	</ul>
	
	
	<h4>자바빈즈 생성 2 - target, property 사용</h4>
	<%-- value에 기본생성자 호출,, request영역에 저장함 --%>
	<c:set var="personVar2" value="<%=new Person()%>" scope="request"/>
	
	<%-- Person객체의 인스터스 변수에 각각 값을 지정하려면,,
	
		 target : 참조변수명 personVar2 작성
		 property : Person객체의 인스턴스 변수명 작성
		 value : 저장하고자 하는 값 작성
	 --%>
	<c:set target="${personVar2}" property="name" value="정약용"/>
	
	<c:set target="${personVar2}" property="age" value="60"></c:set>
	<ul>
		<li>이름 : ${requestScope.personVar2.name}</li>
		<li>나이 : ${personVar2.age}</li>
	</ul>
	
	

</body>
</html>