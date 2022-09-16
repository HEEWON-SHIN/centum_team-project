<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!--  JSTL라이브러리의 Core주제 태그들을 사용하기 위해 taglib지시자를 선언 -->
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:useBean id="mDao" class="member.memberDAO"/>
 
 <% 
 	String contextpath = request.getContextPath();
 
	int check = mDao.update_pw(request.getParameter("Password"), (String)session.getAttribute("UserEmail"));//입력받은 새 비밀번호와 이메일 매개변수로 넘겨줌   
 	
	pageContext.setAttribute("check", check);
 %>
 
 	
 	
 	<%
 		if(check == 1){
 	
 			session.setAttribute("UserPw", request.getParameter("Password"));
 		
 	%>
 	<script type="text/javascript">
 		alert("비밀번호가 변경되었습니다.");
 		location.href="<%=contextpath%>/index.jsp";
 	</script>
 	<%
 		}else{
 	%>		
 		<script type="text/javascript">
 		alert("비밀번호를 변경하지 못했습니다.");
 		history.back();
 		</script>	
 			
 	<%		
 		}
 	
 	%>
 	
 	
 	
 
 
</body>
</html>