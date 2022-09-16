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
		//id를 입력하지 않았을 경우
		//포워드 액션태그를 사용해 다시 로그인 요청화면(login.jsp)을 재요청해서 보여주자.
		//이 때, 오류메시지를 <jsp:param>액션태그를 이용해 request에 담아 전달해서 보여주자.
		
		//1.한글처리
		request.setCharacterEncoding("utf-8");
	
		
		//login2.jsp로 전달할 오류메시지를 저장
		String msg = "아이디를 입력하지 않았습니다. 아이디를 입력해주세요";
		
		String userId = request.getParameter("userId");
		
		if(userId.length() == 0){//아이디를 입력하지 않았다면?
				
			
	%>	
		
		<%--액션태그를 이용하면 코드가 간결해진다. (참고로 주소창에는 result2.jsp가 남고 화면은 login2.jsp페이지를 보여주게된다.
			재요청하면서 보낼 값은 jsp:param액션태그 사이에 넣어주면 된다.
		--%>
		<jsp:forward page="login2.jsp">
		
			<jsp:param value="<%=msg %>" name="msg"/>
		
		</jsp:forward>
				
				
	<%		
		}	
	%>
	
	
	<%--아이디를 입력했다면? --%>
	<h1>환영합니다. <%=userId %>님!</h1>
	
</body>
</html>