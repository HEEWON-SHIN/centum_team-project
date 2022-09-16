<%@ page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
	<%-- ★★★★★중요!!★★★★★ 
	
		taglib :  지시어를 사용해서 외부에 만들어놓은 라이브러리를 현재 jsp페이지에서 불러와 사용하기 위해 사용한다 
	
		 uri : 외부 tld파일의 경로를 작성
		 
		 prefix : tld파일에 등록한 메소드를 태그형식으로 불러와 사용하기 위한 짧은이름(접두어) 작성,,short-name에 작성한 값과 동일해야함
		 			참고로 prefix속성, 즉 접두어 하나당 taglib태그?가 하나씩 필요하다!!
		 			(예를 들어 c:set 태그를 사용할 때 csms tld파일의 접두어가 c인 것을 의미한다)
		 			
		 			
		 	tld파일은 보통 jar(압축파일)형태로 묶여있고 그걸 다운받아서 붙여넣기한 후에 사용,,직접 만드는 경우는 거의 없음
		 	
	
	--%>
	<%@ taglib uri="/WEB-INF/MyTagLib.tld" prefix="mytag" %>
	
	
	
	<%
		MyELClass my = new MyELClass(); // 객체 생성
		pageContext.setAttribute("myClass", my); // page 영역에 저장
	%>
<html>
<head>
<title>표현 언어(EL) - 메서드 호출</title>
</head>
<body>
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-3000000 => ${ pageScope.myClass.getGender("001225-3000000") }<br /><%--남자 --%>
	 001225-2000000 => ${ myClass.getGender("001225-2000000") }<br><%--여자 --%>
	 



	<%-- 자바코드는 EL내부에서 사용 불가능!! --%>
	\${my.getGender("001225-3000000") }<br><br>
	
	<hr>
	
	<h3>클래스명을 통해 정적 메소드 호출하기</h3>
	
	${MyELClass.showGugudan(7) }<br><%--static이 붙은 정적 메소드는 객체 생성 없이 메소드명만으로도 바로 호출이 가능하다 --%>
	
	
 

		 
	 <h3>tld파일에 정적메소드를 등록 후 현재 JSP에서 호출하기</h3>
	 
	 <ul>
	 	<li>mytag:isNumber("100") => ${ mytag:isNumber("100") }</li>
	 	<li>mytag:isNumber("이백") => ${ mytag:isNumber("이백") }</li>
	 </ul>


</body>
</html>