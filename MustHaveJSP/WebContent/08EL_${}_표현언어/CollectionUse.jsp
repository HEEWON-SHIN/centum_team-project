<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List인터페이스의 자식 ArrayList컬렉션</h2>
	
	<%
		//ArrayList가변길이 배열 생성
		List aList = new ArrayList();
	
		//배열에 문자열을 저장
		aList.add("청해진");
		
		//배열에 new Person("장보고", 28); 저장
		aList.add(new Person(("장보고"), 28));
	 
		//ArrayList배열 자체를 page내장객체 영역에 저장
		pageContext.setAttribute("Ocean", aList);
	
	%>
	
	
	
	<%--page내장객체 영역에 저장된 ArrayList배열을 꺼내와 배열의 각 인덱스위치에 저장된 문자열과 Person객체를 얻어 출력 --%>
	
	<ul>
		<li>ArrayList배열의 0번째 요소 : ${pageScope.Ocean[0] }</li>
		
		<li>ArrayList배열의 1번째 요소 : ${pageScope.Ocean[1] }</li>
		
		<li>ArrayList배열의 1번째 요소 : ${pageScope.Ocean[1].name}, ${ pageScope.Ocean[1].age}</li>
		
		<li>ArrayList배열에 저장되지 않은 요소 : ${pageScope.Ocean[2] }</li>
	
	</ul>
	
	<hr>
	
	
	<h2>Map인터페이스의 자식 HashMap컬렉션</h2>
	<%
		Map<String, String> map = new HashMap<String, String>();
	
		map.put("한글", "훈민정음");
		map.put("Eng", "English");
		
		pageContext.setAttribute("map", map);//페이지 내장객체 영역 내부에 HashMap배열 저장
	
	%>
	
	<ul>
		<li>영문 Key : ${pageScope.map.Eng}, ${map.Eng }, ${map["Eng"]}, ${map['Eng']}</li>
		<li>한글 Key : ${map["한글"]}, ${map['한글']}, \${pageScope.map.한글}</li>
			<%--${pageScope.map.한글}, ${map.한글 } => 키 값에 영문 외의 문자, 특수기호, 공백 등이 있으면 []대괄호를 활용해서 출력해야한다,,숫자는 가능 --%>
	</ul>
	
	
</body>
</html>