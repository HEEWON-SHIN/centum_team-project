<%@page import="java.util.Set"%>
<%@page import="common.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		ApplicationMain.jsp페이지에 작성한
		application내장객체 메모리 영역에 저장된 HashMap배열을 꺼내와
		출력하는 ApplicationResult.jsp페이지
	
	 --%>
	 
	 <%
	 //application영역에 저장된 "ap_maps"속성값 즉, HashMap배열을 꺼내온다
	 	HashMap<String, Person> maps = (HashMap<String, Person>)application.getAttribute("ap_maps");//반환값은 HashMap타입,,다운캐스팅 필요
	 
	 	
	 //HashMap배열에 저장된 데이터를 꺼내어 확인하기 위해 먼저 key값들을 알아내야 한다.
	 //HashMap배열객체의 keySet()메소드를 호출하여 모든 key들을 담아 얻어온다.
	 Set<String> arr_keys =  maps.keySet();
	 	
	 //확장 for문을 이용하여 key에 해당하는 값들을 하나씩 배열에서 꺼내어 출력한다.
	 //배열에서 꺼낼 때는 get()메소드 사용
	 for(String key	 :	arr_keys	){
		Person person =  maps.get(key);
		
		out.println(person.getName() + ","+ person.getAge());
	 }
	 	
	 %>
</body>
</html>