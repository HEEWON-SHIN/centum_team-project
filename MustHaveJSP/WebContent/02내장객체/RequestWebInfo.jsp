<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<%--
		RequestMain.jsp(요청하는페이지)에서
		GET방식전송 <a>태그를 클릭하거나
		<form>태그 내부에 있는 "POST방식 전송"버튼을 클릭했을 때
		응답하는 RequestWebInfo.jsp서버페이지이다.
		
		Request내장객체로부터 클라이언트와 서버의 환경정보를 읽어와 화면에 표시해주는 페이지이다.
		
	 --%>
	 
	 <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<%-- request.getMethod()를 이용하면 클라이언트가 어떤 방식으로 페이지를 요청했는지를 "get" 또는 "post" 문자열로 반환한다.
		
			<a>GET방식전송</a>를 클릭했을 때 "get"을 반환하고
			
			[post방식전송]버튼을 클릭했을 때 "post"를 반환.
		 --%>
		<li>데이터 전송방식 : <%= request.getMethod() %></li>
	
		<%-- request.getRequestURL()메소드 : 
			 <a>태그 또는 [post방식전송]버튼을 클릭했을 때..
			 href또는 action속성에 작성된 서버페이지를 요청하는 전체 URL주소를 반환. 
			 
			 	예) URL : http://localhost:8082/MustHaveJSP/02내장객체/RequestWebInfo.jsp
			 --%>
		<li>URL : <%= request.getRequestURL() %></li>
		
		<%-- request.getRequestURLI()메소드 : 
			 <a>태그 또는 [post방식전송]버튼을 클릭했을 때..
			 href또는 action속성에 작성된 서버페이지를 요청하는 전체 URL주소 중에서 
			 호스트 주소(=ip주소,, http://localhost:8082)를 제외한 전체 URI주소를 반환.
			 
			 예) URL : /MustHaveJSP/02내장객체/RequestWebInfo.jsp
			  --%>
		<li>URI : <%= request.getRequestURI() %></li>
		
		
		<%-- 클라이언트가 웹브라우저 주소창에 요청 서버페이지의 주소를 입력할 때 사용한 프로토콜 종류를 반환(별로 안 중요함)
			
			 예) http(<- HTTP/1.1 버전을 사용함!)
		 --%>
		<li>요청시 사용한 프로토콜 종류 : <%= request.getProtocol() %> </li>
		
		<li>요청한 웹서버의 호스트 : <%= request.getServerName() %> </li>
		
		<li>요청한 웹서버의 포트 번호 : <%= request.getServerPort() %> </li>
		
		
		<%--★★★★★ request.getRemoteAddr()--%>
		<li>요청한 클라이언트 PC의 IP주소 : <%= request.getRemoteAddr() %> </li>
		
		<li>요청시 웹브라우조 주소창에 입력한 주소 중 쿼리스트링 : <%= request.getQueryString() %> </li>
		
		<%
			request.setCharacterEncoding("UTF-8");//한글처리
		%>
		
		<%--★★★★★
			get방식 전송 <a>태그 : request.getParameter("키 값");<- 쿼리스트링에 적은 키와 매치되는 값 반환
			post방식 전송 [input] : request.getParameter("name속성값"); <- input태그 value값 반환 --%>
		<li>전송된 값1 : <%= request.getParameter("eng") %> </li>
		<li>전송된 값2 : <%= request.getParameter("han") %> </li>
		
		
		
	</ul>



</body>
</html>