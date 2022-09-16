<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//CookieManager클래스를 이용해서 이름이 "loginId"인 쿠키를 읽어와
    	//loginId변수에 저장한다.
    	//즉, 저장돼있는 아이디가 있다면 이 값을 아래의 아이디 입력 <input>의 value속성에 설정하여 보여준다.
    	String loginId = CookieManager.readCookie(request, "loginId");
    
    	
    	String cookieCheck = "";
    	
    	if(	!loginId.equals("")){//loginId값이 빈 공백이 아니라면? => loginId에 값이 저장됐다면?
    		
    		cookieCheck = "checked";//아래의 <input type="checkbox">에 checked속성을 추가해서 설정
    	}
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 로그인 페이지 작성하기 --%>
	
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
		
		아이디  : <input type="text" name="user_id" value="<%=loginId%>"><!-- value값 사이에 표현식을 넣어 loginId변수값(9번코드줄)을 넣어줌 -->
				 <input type="checkbox" name="save_check" value="Y" <%=cookieCheck %>>  
				아이디 저장하기
		<br>
		
		패스워드 : <input type="text" name="user_pw">
		<br>
		
		<input type="submit" value="로그인하기">
		
		
	</form>
	
	
	
</body>
</html>