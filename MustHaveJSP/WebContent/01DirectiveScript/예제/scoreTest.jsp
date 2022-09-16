<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//scoreTest.jsp서버페이지의 역할
	//1. 클라이언트가 요청한 값을 얻는다.
	request.setCharacterEncoding("utf-8");//한글처리
	int score = Integer.parseInt(request.getParameter("score"));//전송된 시험 점수를 가져옴

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 출력창</title>
</head>
<body>
	<h1>시험점수 <%=score %>점</h1><br>
	<%
	//2. 요청한 값을 이용해 웹브라우저로 응답할 데이터를 마련.
	//		-> 입력한 점수에 따라 학점으로 변환한 데이터(응답할 데이터)
	
	if(score>=90){//90점 이상이면 A출력
		
		//3. 마련한 응답할 데이터를 웹브라우저로 응답(출력)
		//out.println("<h1>A학점입니다.</h1>"); <-서블릿 방식으로도 출력 가능
	
	%>
	<h1>A학점입니다.</h1>
	<%
	}else if(score>=88 && score<90){//88~90점 사이면 B출력
	%>
	<h1>B학점입니다.</h1>
	<%
	}else if(score>=70 && score<80){//70~80점 사이면 C출력
	%>
	<h1>C학점입니다.</h1>
	<%
	}else if(score>=60 && score<70){//60~70점 사이면D출력
	%>
	<h1>D학점입니다.</h1>
	<%
	}else{//그 외 점수는 F를 출력
	%>
	<h1>F학접입니다.</h1>
	<%
	}
	%>
	<br>
	<a href="scoreTest.html">시험점수 입력</a>
</body>
</html>