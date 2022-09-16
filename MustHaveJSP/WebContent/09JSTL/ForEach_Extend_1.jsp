<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>★★★★향상된 ForEach★★★★</title>
</head>
<body>

	<h4>향상된 for문 형태의 forEach 태그</h4>
	
	<%-- 루프에서 순회할 String 배열을 선언한다. 색상 이름들의 배열이다. --%>
	<%
		String[] rgb = {"Red", "Green", "Blue", "Black"};
	
	%>
	<%-- 
		items : 배열을 지정하면, 그 배열의 갯수만큼 반복하여 실행한다.
				이 때, 배열의 0index위치에 있는 "Red"부터 3index위치에 있는 "Black"문자열까지
				차래대로 얻은 후 c변수에 저장시켜 반복해서 사용.
		var : c변수에 rgb배열을 꺼내와 각각 저장
	 --%>
	<c:forEach var="c" items="<%=rgb%>">
		
		<span style="color:${c}">${c}</span><br>
	
	</c:forEach>
	
	<hr>
	${c}<%-- c는 지역변수라 for문 밖에서는 값이 없음 --%>
	
	<hr>
	
	
	<h4>varStatus속성 살펴보기</h4>
	
	<table border="1px">
		<%-- varStatus속성은 상태를 알려줄 변수명을 loop로 지정함.
			 loop변수를 통해 varStatus속성이 제공하는 모든 하위 속성값을 반복해서 출력!
		 --%>
		<c:forEach var="i" items="<%=rgb %>" varStatus="loop">
			<tr>
				<td>count : ${loop.count}</td><%--실제 반복횟수를 알려주는 count,,1~3 출력 --%>
				<td>index : ${loop.index }</td><%--var에 지정한 현재 루프의 변수값(i의 값)이 위치한 index번호 출력 --%>
				<td>current : ${loop.current}</td><%--var에 지정한 현재 루프의 변수값(i의 값) 반환해서 출력 --%>
				<td>first : ${loop.first}</td><%-- 루프가 처음일 때 true 반환 --%>
				<td>last : ${loop.last}</td><%-- 루프가 마지막일 때 true반환 --%>
			</tr>
		</c:forEach>
		</table>

	<%--
	
		일반 forEach태그와 비슷하지만 current속성과, index속성값이 다른것을 확인할 수 있다.
		향상된 for문에서는 시작과 종료가 items속성에 의해 지정한 배열에 따라 결정되므로
		index는 항상 0부터 시작한다.
		한편, current는 현재 루프의 객체가(값이) 반환된다.
		
		
	 --%>




</body>
</html>