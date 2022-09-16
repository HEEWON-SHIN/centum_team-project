<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   		//pageContext.setAttribute("scopeValue", "페이지 영역");//하나의 jsp페이지 내에서만 유지되는 영역,,
    	
   		request.setAttribute("scopeValue", "리퀘스트 영역");//페이지 재요청할 때 requestDispatcher를 이용하면 리퀘스트 영역 유지,,
   		
   		
   		//재요청 방식 3개
   		//<jsp:forward(액션태그) > == requestDispatcher( 자바코드)	<-----  재요청시 request영역 유지됨!!
   		//response.sendRedirect(자바코드) <--- 재요청시 새로운 request생성됨!! 기존에 있던 request는 톰캣에 의해 제거됨
   		//location.href <- 자바스크립트
   		
   		session.setAttribute("scopeValue", "세션 영역");//창을 닫기 전까지 유지되는 영역
   		
   		application.setAttribute("scopeValue", "애플리케이션 영역");//서버가 멈추기 전까지 유지되는 영역
   		
   
   
   %> 
    


	<h3>각 내장객체 영역에 저장된 변수(속성)값 얻어 EL태그로 출력</h3>
	
	<ul>
		<li>페이지 영역의 값 : ${pageScope.scopeValue }</li><br><!-- pageScope.페이지 내장객체에 저장한 키  <- 이렇게 해주면 위에서 저장한 값을 얻을 수 있다. -->
		<li>페이지 영역의 값 : <%=pageContext.getAttribute("scopeValue") %></li><br><br><!-- 자바코드로 출력한 결과와 동일하다 -->
		
		<li>리퀘스트 영역의 값 : ${requestScope.scopeValue}</li><br>
		<li>리퀘스트 영역의 값 : <%=request.getAttribute("scopeValue") %></li><br><br>
		
		<li>세션 영역의 값 : ${sessionScope.scopeValue}</li><br><br>
		
		<li>애플리케이션 영역의 값 : ${applicationScope.scopeValue}</li><br><br>
		
	</ul>
	
	<h3>xxxScope.을 생략하여 공통된 키(scopeValue)로 내장객체 영역에 접근하여 값 얻어 출력하기</h3>
	
	${scopeValue }<br>
	
	<%-- page -> request -> session -> application 순서로 서버(톰캣)가 값을 찾아 꺼내와서 출력
		
		page내장 객체에 값이 저장돼있다면 더 이상 찾지않고 출력한다. 만약에 저장돼있지 않다면 request로 가서 찾는다.
	 --%>
	
	
	<%--	다른페이지로 포워드(재요청)하는 액션태그 사용,, 아래 자바코드 두 줄을 한줄로 표현 가능하다	 --%>
	<jsp:forward page="ImplicitForwardResult.jsp"/>
	
	<%//RequestDispatcher dispatcher = request.getRequestDispatcher("ImplicitForwardResult.jsp");
		//dispatcher.forward(request, response);%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

