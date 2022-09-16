<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	//1. 클라이언트가 요청한 값 얻기 + 요청값 한글처리
    	request.setCharacterEncoding("utf-8");
    	String user_id= request.getParameter("user_id");
    	String user_pw = request.getParameter("user_pw");
    
    
    %>
    
    

	<%
		//2. 요청한 값을 이용해 웹브라우저로 응답할 데이터 마련
		//3. 마련한 응답할 데이터를 웹브라우저로 전송하여 응답(출력) 
		//		-> html태그 이용해 출력하기 때문에 자바코드는 스크립틀릿 기호로 각각 묶어준다.
		if(user_id == null || user_id.length()==0){//id가 정상적으로 입력됐는지 확인		
	%>	
	아이디를 입력하세요.<br>
	<a href="login.html">로그인하기</a>				
	<%	
		}else{//id가 정상적으로 입력됐을 경우
	%>		
	<h1>환영합니다. <%=user_id %>님!!!</h1>		
	<% 
		}
	%>
</body>
</html>