<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 
 	/*1. 한글처리*/
 	request.setCharacterEncoding("utf-8");
 
 	/*재요청 받을 당시 request에 저장된 요청값 얻기*/
 	String name = request.getParameter("duke");//듀크
 	String imgName = request.getParameter("imgName");//duke.png
 	
 	
 %>   
    
    
    <!--참고로 duke_image.jsp먼저 요청하면 받아오는 값이 없기때문에 NullPointException 발생! -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<h1>이름은 <%=name%>입니다.</h1>
	<br><br>
	<img src="../images/<%=imgName%>">




</body>
</html>