<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    	request Scope
    	- 하나의 요청에 의해 호출된 jsp페이지와 포워딩(재요청)된 jsp페이지까지 데이터를 공유할 메모리 영역
    	- 클라이언트가 jsp페이지를 톰캣서버에 요청할때 마다 톰캣서버는 새로운 request내장객체를 생성하고,
    	  같은 요청을 처리하는데 사용되는 모든 다른 jsp페이지까지 데이터를 공유할 메모리 영역
    	- 단, 페이지 이동시에는 소멸되어 사용할 수 없게 된다.(일정 시간 이상동안 요청하지 않았을 때도 톰캣이 삭제해버림)
    	- page 내장객체 영역보다 접근 범위가 조금 더 넓다.
    
    
    
     --%>
     
     <%
     	//request 내장객체 영역에 접근하여 String 객체와 Person객체를 생성하여 저장한다.
     	request.setAttribute("requestString", "request 영역의 문자열");
     	request.setAttribute("requestPerson", new Person("안중근", 31));
     
     
     %>
     
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request영역의 속성값 삭제하기</h2>
	<%
		//request내장객체 영역에 저장된 특정 속성을 삭제하기 위해 removeAttribute("속성명");메소드 호출!
		request.removeAttribute("requestString");//18코드줄 삭제됨!
		request.removeAttribute("requestInteger");//에러는 안 나지만, 삭제시킬 수 없다,,저장돼있지 않은 속성명이기 때문
	%>
	
	
	<h2>request 영역에 저장된 속성값 얻어 출력</h2>
	<%
		Person rPerson = (Person)request.getAttribute("requestPerson");//object타입으로 리턴해주기 때문에 항상 다운캐스팅 해줘야함!
	%>
	
	<ul>
		<li>String 객체 : <%=request.getAttribute("requestString") %></li><!-- 위에서 삭제한 속성값 호출,,null -->
		<li>Person 객체 : <%=rPerson.getName()%>, <%=rPerson.getAge() %></li><!-- 안중근, 31 출력됨 -->
	
	</ul>
	
	<!-- 
		결론1 : 출력결과를 보면 Person객체의 값을 request내장객체 영역에서 제대로 읽어왔고
			  String객체는 request 내장 객체영역에 저장된 후 삭제되었으므로 null값 출력됨.
			  	=> 이상으로 하나의 jsp페이지 안에서 문제없이 request내장객체 메모리에 저장된 데이터를 공유해서 사용할 수 있다.
	
	 -->
	<%
		//포워딩(포워드 혹은 재요청) : 현재 jsp페이지로 들어온 요청을 다른 jsp페이지로 재요청하여 보내는 기능
		
		//문법 : request.getRequestDispatcher("포워딩할 파일 경로").forward(request, response);
	
		request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
		
		//forward방법 : 웹브라우저 주소창을 거치지 않고 즉시~ 다른 jsp를 재요청하는 방법
		//	-> 첫번째로 요청했던 주소가 주소창에 남아있으나 재요청에 의해 두번째 페이지의 결과를 웹브라우저에 보여주기 때문에 보안성이 좋다.
	%>
	
	<%--
		결론 2. request scope에 저장된 속성값은 현재 jsp페이지와 포워드된 페이지까지 공유된다.
	
	 --%>
	
</body>
</html>