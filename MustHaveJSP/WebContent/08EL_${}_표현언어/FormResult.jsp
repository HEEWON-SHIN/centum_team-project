<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <% request.setCharacterEncoding("utf-8"); //한글처리,, 필수!!!%> 
   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>FormSubmit.jsp디자인 페이지에서 요청한 값을 request내장객체 영역에서 꺼내 EL태그로 출력하자</h3>
	
	
	<!--  자바코드로 작성하는 경우 -->
	<ul>
		<li>이름 : <%= request.getParameter("name")%></li>
		<li>성별 : <%= request.getParameter("gender")%></li>
		<li>학력 : <%= request.getParameter("grade")%></li>
		
		<% String [] arr = request.getParameterValues("inter"); //체크박스처럼 값이 여러개일 때는 배열에 담아서 받아올 수 있다. 
																//배열의 크기는 request에 담긴 값의 갯수만큼 자동 지정된다.	%>
		
		<li>관심사항 : <%-- 자바코드로 체크박스같은 가변성이 있는 값을 받아오게 되면 소스가 지저분해진다,, --%>
		
					<%
						for(int i=0; i<arr.length; i++){
					%>
							<%=arr[i] %>,&nbsp;<!-- 스페이스바 한 칸 -->		
					<%	
						}
					%>
					</li>
		
		
	</ul>
	
	
	<%--	EL ${}태그로 출력 --%>
	<ul>
		<li>이름 : ${param.name }</li>
		<li>성별 : ${param.gender }</li>
		<li>학력 : ${param.grade }</li>
		<li>관심사항 : ${paramValues.inter[0]}, ${paramValues.inter[2]}, ${paramValues.inter[1]}</li>
		<%--자바코드로 선택하지 않은 값(배열에 저장 안된 값)을 출력하면 500에러가 발생,,그러나 EL은 자동으로 공백 처리 해준다. --%>
		<%-- 만약에${ paramValues.inter} 이렇게만 적으면 배열의 고유한 주소값이 출력된다.. 주의하기! --%>
																				
	
	</ul>
	
	
</body>
</html>