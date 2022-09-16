<%@page import="java.util.List"%>
<%@page import="t_member.MemberDAO"%>
<%@page import="t_member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   
    	
    	 <%request.setCharacterEncoding("utf-8");%>	
    
    	
    	<jsp:useBean id="mBean" class="t_member.MemberBean" scope="page"/>
    	

    	<jsp:setProperty  name="mBean" property="*"/>
    	
    	
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회된 회원목록 창</title>
</head>
<body>
	<table width=100% align="center">
		<tr align="center" bgcolor="lightblue">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">가입날짜</td>
		</tr>	

		
		
				 
		<tr align="center" bgcolor="coral">
					<td width="7%"><jsp:getProperty property="id" name="mBean"/></td><!-- for반복문, 즉 자바코드 안에는 get/setProperty 액션태그 사용 불가 -->
					<td width="7%"><jsp:getProperty property="pwd" name="mBean"/></td>
					<td width="7%"><jsp:getProperty property="name" name="mBean"/></td><%-- 스크립틀릿 안에는 세미콜론 입력해주기! --%>
					<td width="7%"><jsp:getProperty property="email" name="mBean"/></td>
					<td width="7%"><jsp:getProperty property="joinDate" name="mBean"/></td>
				
		</tr>	
						
	
	
			<tr height="1" bgcolor="cornflowerblue">
				<td colspan="5"></td>
			</tr>

	</table>




</body>
</html>