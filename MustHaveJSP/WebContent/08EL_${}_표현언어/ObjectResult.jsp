<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request영역을 통해 전달된 객체와 데이터 꺼내와 출력</h2>
	
	
	<%-- 자바코드로 꺼내오기 --%>
	
	<% Object obj = request.getAttribute("personObj"); // new Person("홍길동", 33);객체를 Object타입으로 리턴받음,,업캐스팅
	
		Person person = (Person)obj;//다운캐스팅을 통해 person참조변수로 name변수와 age변수에 접근가능하다
		
		
		String str = (String)request.getAttribute("stringObj");
		
		Integer integer = (Integer)request.getAttribute("integerObj");
		
		String firstNumStr = request.getParameter("firstNum");
		
		String secondNumStr = request.getParameter("secondNum");
		
	%>
	
	<ul>
		<li>Person객체의 정보 -> 이름:<%=person.getName()%>, 나이:<%=person.getAge() %></li>
		<li>String객체의 정보 -> <%=str %></li>
		<li>Integer객체의 정보 -> <%=integer.intValue() %><%--언박싱 --%>
		
		<li>jsp:param으로 받은 firstNum의 정보 -> <%=firstNumStr %></li>
		<li>jsp:param으로 받은 secondNum의 정보 -> <%=secondNumStr %></li>
		
		<li>jsp:param으로 받은 firstNum + secondNum의 값 -> <%=Integer.parseInt(firstNumStr) + integer.parseInt(secondNumStr) %></li>
	</ul>
	
	<hr>
	
	
	<%-- EL표현 언어로 출력한 부분 --%>
	
	<ul>											<%--requstScope 생략하고 바로 키값.출력하고자하는 Person객체(DTO클래스)의 인스턴스변수 값 --%>
		<li>Person객체의 정보 -> 이름:${requestScope.personObj.name}, 나이:${personObj.age}</li>
		<li>String객체의 정보 -> ${requestScope.stringObj}</li>
		<li>Integer객체의 정보 -> ${integerObj}</li>
		
		<li>jsp:param으로 받은 firstNum의 정보 -> ${param.firstNum}</li>
		<li>jsp:param으로 받은 secondNum의 정보 -> ${param['secondNum']}</li>
		 
		<li>jsp:param으로 받은 firstNum + secondNum의 값 -> ${param.firstNum} + ${param['secondNum']}</li><%-- "10 + 20" 출력--%>
		
		<!-- 숫자형태의 문자열은 EL태그가 자동으로 Integer로(숫자로) 형변환해서 수식의 결과값을 출력해준다! -->
		<li>jsp:param으로 받은 firstNum + secondNum의 값 -> ${param.firstNum + param['secondNum']}</li><%--30출력 --%>
		
		<li>jsp:param으로 받은 firstNum + secondNum의 값 -> ${param.firstNum * param['secondNum']}</li><%--200출력 --%>
		
	</ul>
	
	
	<%-- 
		참고!!
			requestScope : setAttribute등을 이용해 직접 지정하여 변하지 않는 값이 request내장객체에 저장됐을 때, 그 값을 꺼내올 때 사용
	
			param : <input>태그 등의 값과 같이 변할 수 있는 값이 request내장객체에 저장됐을 때, 그 값을 꺼내오려면 param을 사용한다.
	 --%>
	
</body>
</html>