<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>재요청받은 현재 jsp페이지에서 각 내장객체 영역의 값을 얻어 EL로 출력</h3>
	
	<ul>
		<%-- 페이지 영역은 페이지를 이동하면(재요청하면) 유지되지 않으므로 출력되지 않는다 --%>
		<li>페이지 영역의 값 : ${pageScope.scopeValue }</li><br><!-- pageScope.페이지 내장객체에 저장한 키  <- 이렇게 해주면 위에서 저장한 값을 얻을 수 있다. -->
		<li>페이지 영역의 값 : <%=pageContext.getAttribute("scopeValue") %></li><br><br><!-- 자바코드로 출력한 결과와 동일하다 -->
		
		<li>리퀘스트 영역의 값 : ${requestScope.scopeValue}</li><br>
		<li>리퀘스트 영역의 값 : <%=request.getAttribute("scopeValue") %></li><br><br>
		
		<li>세션 영역의 값 : ${sessionScope.scopeValue}</li><br><br>
		
		<li>애플리케이션 영역의 값 : ${applicationScope.scopeValue}</li><br><br>
		
	</ul>
	
	
	<h3>xxxScope.을 생략하여 공통된 키(scopeValue)로 내장객체 영역에 접근하여 값 얻어 출력하기</h3>
	
	${scopeValue }<br><%-- 영역을 지정하지 않고 값을 요청하면,, 
							ImplicitObjMain.jsp페이지에서는 페이지 영역이 출력됐는데,,
							재요청을 하게되면 ImplicitForwardResult.jsp페이지로 넘어와서 페이지 영역은 유지되지 않고 
							그 다음 순서인 request내장객체 영역의 값이 꺼내져서 출력된다. --%>
	
	
</body>
</html>