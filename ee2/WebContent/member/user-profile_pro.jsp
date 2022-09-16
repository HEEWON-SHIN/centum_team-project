<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--  JSTL라이브러리의 Core주제 태그들을 사용하기 위해 taglib지시자를 선언 -->
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
    <% request.setCharacterEncoding("utf-8");
    /* 
    
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String facebook = request.getpa
     */
     
     
    %>
 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="mDto" class="member.memberDTO"></jsp:useBean>
    <jsp:useBean id="mDao" class="member.memberDAO"></jsp:useBean>

	<jsp:setProperty property="*" name="mDto"/><%--액션태그 이용해서 DTO객체의 인스턴스 변수에 각가의 값들 저장!  --%>
	
	<%
		int check = mDao.update_profile(mDto);
	
		if(check == 1){//회원가입에 성공하면?
			
			session.setAttribute("UserName", mDto.getName() );
			session.setAttribute("UserPhone", mDto.getPhone());
	%>
		<script>
    
    alert("${mDto.name}님 회원정보가 업데이트 되었습니다.");
    
    </script>	
    
    <jsp:forward page="./user-profile.jsp"></jsp:forward>
	<%		
		}else{
	%>		
			<script>
		    
		    alert("회원정보 업데이트 실패");
		    history.back();
		    </script>		
	<%
		}
	
	%>
	
</body>
</html>
    
