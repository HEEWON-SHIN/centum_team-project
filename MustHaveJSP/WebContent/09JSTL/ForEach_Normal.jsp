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

	<h4>일반 for문 형태의 forEach태그</h4>
	
	<%-- 일반 for문의 형태로 1부터 3까지 반복하여 1씩 증가한다. --%>
	
	<%--
		var : 시작과 끝을 표시할(반복횟수를 나타낼) 변수
		
		begin : 초기값
		
		end : 끝 값
		
		step : 한번에 증가할 값
	 --%>	
	<c:forEach var="i" begin="1" end="3" step="1">
	
		<p>반복 ${i} 입니다.</p>
	
	</c:forEach>
	
	
	<%
		for(int i=1; i<=3; i++){
			
			System.out.println("반복" + i + "입니다.");//콘솔창 출력
		}
	
	%>
	
	<hr>
	
	<h4>varStatus속성 살펴보기</h4>
	
	<table border="1px">
		<%-- varStatus속성은 상태를 알려줄 변수명을 loop로 지정함.
			 loop변수를 통해 varStatus속성이 제공하는 모든 하위 속성값을 반복해서 출력!
		 --%>
		<c:forEach var="i" begin="3" end="5" varStatus="loop">
			<tr>
				<td>count : ${loop.count}</td><%--실제 반복횟수를 알려주는 count,,1~3 출력 --%>
				<td>index : ${loop.index }</td><%--var에 지정한 현재 루프의 변수값(i의 값) 반환해서 출력 --%>
				<td>current : ${loop.current}</td><%--var에 지정한 현재 루프의 변수값(i의 값) 반환해서 출력 --%>
				<td>first : ${loop.first}</td><%-- 루프가 처음일 때 true 반환 --%>
				<td>last : ${loop.last}</td><%-- 루프가 마지막일 때 true반환 --%>
			</tr>
		</c:forEach>
		</table>

		
		<h4>1에서 100까지 정수 중에서 홀수의 합 구하기</h4>
		
		<c:forEach var="j" begin="1" end="100" step="1">
		
			<%-- c:if태그로 j값이 홀수인지 판단 --%>
			<c:if test="${j % 2 ne 0 }">
			
				<%-- j가 홀수이면 sum += j 해줌 --%>
				<c:set var="sum" value="${sum + j }"/>
			
			</c:if>
		
		</c:forEach>
		
		1~100까지의 정수 중 홀수들의 합은 ${sum}입니다.
		
	
</body>
</html>