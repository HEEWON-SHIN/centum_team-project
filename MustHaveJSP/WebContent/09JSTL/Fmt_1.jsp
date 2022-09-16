<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    <%-- JSTL라이브러리의 Formatting태그들을 사용하기 위해 taglib 지시자를 선언 --%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>

	<%-- 숫자를 값으로 갖는 변수를 선언한다. 이 숫자를 다양한 포맷으로 표현해본다. --%>

	<c:set var="number1" value="12345" scope="page"/>
	
	<%-- fmt:formatNumber태그를 사용하면 기본적으로 큰 수는 세 자리 마다 콤마를 출력해준다. --%>
	콤마 표시 O : <fmt:formatNumber value="${number1}"/><br><br>
	
	<%-- groupingUsed="false"로 설정하면 콤마로 구분하지 않고 출력한다. --%>
	콤마 표시 X : <fmt:formatNumber value="${number1}" groupingUsed="false"/>
	
	<br>
	
	<%-- type="currency"로 주면 통화기호를 숫자 앞에 표시할 수 있다. 
		 또한 var속성을 사용하였으므로 즉시 출력하지 않고 변수에 저장한 후에 다른 위치에서 출력할 수 있다.
	--%>
	<fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
	통화기호가 있는 숫자 : ${printNum1}<br>
	
	<%-- currencySymbol속성에 원하는 값을 넣으면 숫자 앞에 적어준 기호를 표시한다. --%>
	<fmt:formatNumber value="100000000" type="currency" currencySymbol="+"/><br>
	
	
	
	<fmt:setLocale value="en_us"/><%-- 통화코드를 적어주면 그 나라의 통화기호를 출력해준다. --%>
	<fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
	통화기호가 있는 숫자 : ${printNum1}<br>
	
	 <fmt:setLocale value="ja_jp" />
	<fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
	통화기호가 있는 숫자 : ${printNum1}<br>
	
	
	
	<%--
		참고
			type속성은 출력될 타입을 지정하는 속성이다. 
			값으로 percent인 경우 %,
				 number인 경우 숫자로,
				 currency인 경우 통화형태로 출력됨 
	 --%>
	
	
	
	
	
	
	
	<%-- type="percent"로 지정하면 value에 적은 숫자를 백분율(%)로 표현해준다. --%>
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${printNum2}<br><%--3% --%>
	
	
	<h4>문자열을 숫자로 변경</h4>
	
	<%-- 먼저 콤마와 점이 포함된 숫자형 문자열을 value에 지정해준다 --%>
	<c:set var="number2" value="6,789.01"></c:set>
	
	<%--number2변수에 저장된 문자열 값으로 주고 pattern에 원하는 숫자 형태를 지정하여 printNum3변수에 저장  --%>
	<fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"/>
	소수점까지 : ${printNum3}<br>
	
	
	<%-- integerOnly="true"로 설정하면 정수 부분만 파싱(추출한다)하여 출력한다. --%>
	<fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"/>
	정수 부분만 : ${printNum4}
	
	
	
	

</body>
</html>