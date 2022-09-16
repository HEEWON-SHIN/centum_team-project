<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int num1= 3;
    	
    	pageContext.setAttribute("num2", 4);
    	pageContext.setAttribute("num3", "5");
    	pageContext.setAttribute("num4", "8");
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 연산자 </title>
</head>
<body>
	<h3>변수 선언 및 할당</h3>
	
	스크립틀릿에서 선언한 변수 : ${num1}<br><%--EL은 스크립틀릿에서 선언한 변수를 즉시 사용할 수 없다. 따라서 null이므로 아무것도 출력되지 않는다. --%>
	
	page객체 영역에 저장된 변수 : ${num2}<br><%-- page역역에 저장된 속성은 정상적으로 출력된다. --%>
	
	변수 할당 및 즉시 출력 : ${ num1 = 7 }<br><%-- EL 3.0버전부터는 변수에 값을 할당할 수 있다. 하지만 할당과 동시에 출력된다. --%>
	
	변수	할당만 하고 별도 출력 : ${num2 = 8;'' } => ${num2}<br><%--변수값을 초기화만 하려면 ${변수명=값;''} 처럼 사용해야한다. 따라서 왼쪽 항은 출력되지 않는다. --%>
	
	num1 = ${num1 },	
	num2 = ${pageScope.num2 },	
	num3 = ${num3 },	
	num4 = ${num4 }	
	
	<br>
	
	<%!
		int num5 = 10;
	%>
	
	num5 = ${num5 }<br><%--선언문에 선언해도 EL태그로는 바로 출력 불가능 --%>
	
	${num5 = 15;'' }<!-- EL태그로 초기화 해야 출력 가능 -->
	${num5 }<br><br>
	
	
	<hr><br>
	
	
	<h3>산술 연산자</h3>
	
	num1 + num2 = ${num1+pageScope.num2 }<br>
	
	num1 - num2 = ${num1 - num2 }<br>
	
	num1 * num2 = ${num1 * num2 }<br>
	
	num3 / num4 = ${num3 / num4 }<br>
	num3 div num4 = ${num3 div num4 }<br><%--나눗셈에 / 연산자 혹은 div연산자 사용 가능 --%>
	
	num3 % num4 = ${num3 % num4 }<br>
	num3 mod num4 = ${num3 mod num4 }<br><br><%--나머지 구할 대 % 연산자 혹은 mod연산자 사용 가능 --%>
	
	
	<hr><br>
	
	
	<h3> + 연산자는 덧셈만 가능</h3>
	num1 + "34" = ${num1 + "34" }<br><%-- 문자열 "34"가 계산 전에 자동으로 형변환 되어 7+34의 결과인 41인 출력된다. --%>
	
	num2 + "이십" = \${num2 + "이십" }<br>	<%--err발생,, 숫자와 문자가 포함된 문자열은 형변환이 되지 않기 때문에 덧셈 불가능 --%>
	
	"삼십" + "이십" = \${"삼십" + "이십"} <br>
	
	<br><br>
	
	<h3>비교 연산자</h3>
	
	num4 > num3 : ${num4 gt num3 }<br><%--true 반환 --%>
	
	num1 < num3 : ${num1 < num3 }<br><%--false --%>
	
	num2 >= num4 : ${num2 ge num4 }<br><%--true --%>
	
	num1 == num4 : ${num1 eq num4 }<br><%--false,, eq는 사용빈도가 높으므로 외우기!! --%>
	
	<br><br>
	
	<h3>논리 연산자</h3>
	
	num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4 }<br><%--false --%>
	
	num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4 }<br><%--true --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>