<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 	//한글처리
 	request.setCharacterEncoding("utf-8");
 
 
 
 
 
 %>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//최초 login2.jsp주소 입력해서 요청하면
		//오류메시지를 보이지 않게 하기 위해서 조건을 주자
		
		//최초 요청을 받으면 login2.jsp페이지를 요청하지 않았기 때문에 msg에 저장된 값이 없기 때문에 null이 된다.
		String msg = request.getParameter("msg");
	
		if(msg != null){//아이디를 입력하지 않고, 재요청했다면?
	
	%>
			<h1><%=msg %></h1>
	<%
		}
	%>
	

	<form action="result2.jsp" method="post">
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPw"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="다시입력">
		
	
	</form>
	


</body>
</html>