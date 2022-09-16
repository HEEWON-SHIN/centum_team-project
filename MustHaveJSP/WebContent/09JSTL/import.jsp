<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 포함될 파일인 inc폴더 내부의 OtherPage.jsp에 전달할  변수를 request영역에 저장 --%>
	<c:set var="requestVar" value="MustHave" scope="request"/>
	
	
	<%-- url속성에 내부 JSP파일 경로를 지정하고 var 속성도 추가한다.
		 var속성을 지정했으므로 페이지 내용이 즉시 삽입되지 않고 변수 contents에 저장된다.
	 --%>
	<c:import url="/09JSTL/inc/OtherPage.jsp" var="contents">
	
		<c:param name="user_param1" value="JSP"/>
		
		<c:param name="user_param2" value="기본서"/>
	
	</c:import>
	
	
	<h4>다른 문서 삽입하기</h4>
	${contents} <%-- 외부 페이지의 코드를 현재 위치에 삽입하여 출력! --%>
	
	
	<h4>외부 자원 삽입하기</h4>
	<iframe src="../09JSTL/inc/GoldPage.jsp" style="width:100%; height: 600px;"></iframe>
	
	
</body>
</html>