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
	
	<c:set var="iTag">
		i태그는 <i>기울임</i>을 표현합니다.<%-- html태그를 포함할 때는 value속성에 값을 적지 말고 이렇게 태그 사이에 value값을 직접 넣어줌 --%>
	</c:set>
	
	
	<h4>기본 사용</h4>
	<%--<i>태그는 HTML태그로 인식되지 않고, 텍스트 상태 그대로 환면에 출력된다,,escapeXml속성값 지정 안 하면 기본값은 true이다. --%>
	<c:out value="${iTag}"/>
	
	
	<h4>escapeXml속성</h4>
	<%-- escapeXml에 false 지정하면 html태그를 해석하여 마크업이 적용된 상태로 웹브라우저에 출력 --%>
	<c:out value="${iTag}" escapeXml="false"></c:out>
	
	<h4>default속성</h4>
	<%-- value값을 넣어줄 때 그 값이 null인 경우 default값을 지정해 빈 공백을 대체해줄 기본값을 지정할 수 있다. --%>
	<c:out value="${param.name}" default="이름 없음"></c:out>
	
	<%-- 빈 문자열도 하나의 ㄱ밧이므로 (null이 아니므로) default에 지정한 값이 출력되지 않는다. --%>
	<c:out value="" default="빈 문자열도 값입니다."></c:out>
	
	
	<%-- 결론 : value 속성이 null일 때만 defalut속서으이 값이 대신 출력되게 할 수 있다. --%>
	
</body>
</html>