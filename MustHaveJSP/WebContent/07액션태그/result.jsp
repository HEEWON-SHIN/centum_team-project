<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//id를 입력하지 않았을 경우 자바의 RequestDispatcher를 사용하지 않고
		//포워드 액션태그를 사용해 다시 로그인 요청화면(login.jsp)을 재요청해서 보여주자.
		
		//1.한글처리
		request.setCharacterEncoding("utf-8");
	
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		if(userId.length() == 0){//아이디를 입력하지 않았다면?
				
				//자바코드를 이용하여 웹브라우저를 거치지 않고 재요청(즉, 주소창의 주소는 처음 요청한 페이지 주소 유지)하면 아래의 두줄을 적어야 해서 코드가 길다.
				//RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				//dispatcher.forward(request, response);
	%>	
		
		<%--액션태그를 이용하면 코드가 간결해진다. (참고로 주소창에는 result.jsp가 남고 화면은 login.jsp페이지를 보여주게된다.--%>
		<jsp:forward page="login.jsp"></jsp:forward>
				
				
	<%		
		}	
	%>
	
	
	<%--아이디를 입력했다면? --%>
	<h1>환영합니다. <%=userId %>님!</h1>
	
</body>
</html>