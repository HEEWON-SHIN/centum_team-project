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

	<c:set var="number" value="100"/>
	
	<c:set var="string" value="JSP"/>
	
	
	<h4>JSTL의 if태그로 짝수 / 홀수 판단하기</h4>
	
	<%--
		c:if태그로 number변수를 2로 나눈 나머지가 0인지를 판단, 
		즉 짝수인지를 판단하여 결과를 result변수에 저장
	 --%>
	 
	 <%-- 
	 	if태그는 esle구문이 따로 없다,, 필요하다면 if구문을 여러개 작성해야한다.
	 
	 	 test : 조건식 작성,,EL태그를 이용할 것!
	 	 var : 조건식의 결과인 true / false를 저장할 변수 이름
	 	 scope : 변수를 저장할 영역 지정
	 	  
	  --%>
	 <c:if test="${number mod 2 eq 0 }" var="result">
	 
	 	${number}변수의 값은 짝수입니다.<%-- 조건식의 결과가 true일 때 실행될 문장 --%>
	 </c:if>
	 
	 <br><br>
	 
	 <%-- number변수의 값이 100으로 짝수이다. 따라서 result변수에 true가 저장된다. --%>
	 result : ${result }<br>
	 
	
	<hr>
	
	<h4>문자열 비교와 else구문 흉내내기</h4>
	
	<%-- string변수에 저장된 문자여로가 'Java'문자열을 비교해 결과값을 result2변수에 저장 --%>
	<c:if test="${ string eq 'java' }" var="result2"><%--result2변수에 false저장,, --%>
	
		문자열은 Java입니다.<br>
	
	</c:if>
	
	<%-- result2변수값을 이용해 else구문을 흉내내기,, c:if를 이용해 if else로직을 구현할 수 있음 --%>
	<c:if test="${not result2}">
	
		'Java'가 아닙니다.<br>
	</c:if>
	
	<hr>
	
	<%--
		주의사항1
		
			EL이 아닌 일반 정수가 오면 무조건 false를 반환한다.
			하지만 일반값으로 true가 사용되는 것은 예외이다.
	
	 --%>
	 
	 <c:if test="100" var="result3">
	 	EL이 아닌 정수를 지정하면 false<br>
	 </c:if>
	 
	 result3 : ${result3 }<br><br><%--false출력 --%>
	 
	
	<%--
		주의사항2
		
			문자열 'tRuE'는 대소문자에 상관없이 항상 true를 반환.	 --%> 
			
	<c:if test="tRuE" var="result4">
		대소문자 구분 없이 "tRuE"인 경우 true<br>
	</c:if>
	
	result4 : ${result4 }<br><br>
	 
	<%--
		주의사항3
		
			test속성에 EL을 통해 조건식을 쓸 때 공백이 삽입되면 무조건 false를 반환	 --%> 
			
	<c:if test=" ${ true } " var="result5">
		EL외부 양쪽 빈 공백이 있는 경우 false <br>
	</c:if>
	
	result5 : ${result5 }<%-- false출력됨 --%>
	
	
</body>
</html>