<%@page import="member.memberDAO"%>
<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	request.setCharacterEncoding("utf-8");

    %>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회된 회원목록 창</title>
</head>
<body>


	<jsp:useBean id="mDto" class="member.memberDTO"></jsp:useBean>

	<jsp:setProperty name="mDto" property="name" value='<%=request.getParameter("name")%>'/>
	<jsp:setProperty name="mDto" property="pw" value='<%=request.getParameter("pw")%>'/>
	<jsp:setProperty name="mDto" property="email" value='<%=request.getParameter("email")%>'/>
	
	
	<jsp:useBean id="mDao" class="member.memberDAO"></jsp:useBean>
	
	
	<%
		int result = mDao.insertMember(mDto);
	
		if(result == 1){//회원가입 성공했으면?
	%>
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다.");
			location.href = "register.jsp";
		</script>	
	<%
		}else{//회원가입 실패하면?
	
	%>
		<script type="text/javascript">
			alert("입력한 회원정보를 확인해주세요");
			history.back();
		</script>	
	<%} %>
</body>
</html>
    
   