<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트의 요청을 서버페이지로 전송하기 위한 페이지</title>
</head>
<body>
<%-- a태그 href속성에 ./해주면 절대경로를 나타낸다.--%>
<%-- 내장객체 - request --%>

	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
		<%--<a>태그로 만든 링크이므로 GET방식으로 전송되고, 링크 뒤에는 2개의 매개변수가 쿼리스트링으로 전달된다.
		
			쿼리스트링이란?
				- 요청하는 주소URL뒤에 "?키=값&값2=값2" 형태로 붙여진 요청할 데이터!
				request.getParameter("eng") 해주면 Hello방식을 얻을 수 있다.
				
			참고! <a>태그는 무조건 get방식으로 요청!! post아님!
		 --%>						
		<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">GET 방식 전송</a>
	
		<br>
		
		<form action="RequestWebInfo.jsp" method="post"><%--post방식으로 요청 --%>
		
			영어 : <input type="text" name="eng" value="Bye"><%--인풋 태그 value 속성에 값을 입력하면 그 값이 화면에 표시된 채로 실행됨 --%> <br>
			한글 : <input type="text" name="han" value="잘 가"><br>
			<input type="submit" value="post방식전송버튼">
		
	
	</form>
	
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
		<form action="RequestParameter.jsp" method="post"><%--다양한 <input>으로 요청 --%>
			아이디 : <input type="text" name="id" value=""><br><%--name속성은 임의의 값 설정, value는 생략 가능함 --%>
			성별 : <input type="radio" name="sex" value="man">남자
				  <input type="radio" name="sex" value="woman" checked="checked">여자<%--라디오 버튼 만들 때는 name속성값은 같게 하고, value속성값은 다르게 함! --%>
					<br>
					
			관심사항 : <input type="checkbox" name="favo" value="eco">경제
					 <input type="checkbox" name="favo" value="pol" checked="checked">정치
					 <input type="checkbox" name="favo" value="ent">연애
					 <br>			
					
			자기소개 : <textarea  name="intro" rows="4" cols="30"></textarea>	
			<br>
			
			<input type="submit" value="전송하기"><%--form태그 안에는 반드시! input type=submit인 버튼이 하나 있어야됨! --%>	
				
		</form>


	<h2>3. HTTP 요청 헤더 정보 읽기</h2>

	<a href="RequestHeader.jsp">요청 헤더 정보 읽기</a>

</body>
</html>