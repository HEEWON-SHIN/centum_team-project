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

	<%-- 변수 선언 --%>
	<c:set var="number" value="100"/>

	<h4>choose태그로 홀 짝 판단하기</h4>

	<c:choose>
		<%-- test : EL태그 이용해서 조건식 넣어줌,, c:when 태그는 switch-case문과 동일한 기능을 한다. --%>
		<c:when test="${number % 2 == 0 }">조건식을 만족하면 실행될 구문 : ${number}은 짝수입니다.</c:when>
		
		<c:otherwise>c:when태그의 test속성 조건을 만족하지 않을 때 출력될 문장 : ${number}은 홀수입니다.</c:otherwise>
	
	</c:choose>


	<hr>
	
	<h4>국어, 영어, 수학 점수를 입력해 평균을 구해 학점 출력하기</h4>
		<%--  참고로 전송방식과 url을 입력하지 않으면 폼값은 현재 페이지로 쿼리스트링을 통해 전송된다!! --%>
		<form action="">
			국어 : <input type="text" name="kor"><br>
			수학 : <input type="text" name="math"><br>
			영어 : <input type="text" name="eng"><br>
			<input type="submit" value="학점 구하기">
		</form>
		
		
		<%-- 입력하여 요청한 점수들의 데이터가 존재하지 않으면(입력값이 없으면) 출력되지 않도록 하기 위해 c:if태그를 사용	 --%>		 
	    <%-- 모든 과목의 점수가 입력 됐는지 확인 --%>
		 <c:if test="${not (empty param.kor or empty param.math or empty param.eng)}">
		 	<%-- 평균을 계산해서 avg변수에 저장 --%>
		 	<c:set var="avg" value="${(param.kor + param.math + param.eng) / 3}"/>
		 	
		 	<%-- c:choose  태그 이용해서 평균 점수별 학점을 출력 --%>
		 	<c:choose>
		 		<c:when test="${avg >= 90 }"> 평균 점수는 ${avg}로, A학점입니다. </c:when>
		 		<c:when test="${avg >= 80 }"> 평균 점수는 ${avg}로,  B학점입니다. </c:when>
		 		<c:when test="${avg ge 70}"> 평균 점수는 ${avg}로, C학점입니다. </c:when>
		 		<c:when test="${avg ge 60 }"> 평균 점수는 ${avg}로, D학점입니다. </c:when>
		 		
		 		<%-- 모든 조건을 충족하지 않았을 때 실행될 구문을 c:otherwise태그에 적어줌 --%>
		 		<c:otherwise>평균 점수는 ${avg}로,F학점입니다.</c:otherwise>
		 		
		 	</c:choose>
		 	
		 </c:if>
		 
			 

</body>
</html>