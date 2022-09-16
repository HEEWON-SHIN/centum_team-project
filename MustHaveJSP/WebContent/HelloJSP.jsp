
<!-- 지시어 태그 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- 스크립트 요소태그들 중에서 선언부 태그(특히 변수선언) -->  
    <%!
    	String str1 = "JSP";
    	String str2 = "안녕하세요";
    
    	public void a(){
    		
    		System.out.println("a");
    	}
    
    %>
       
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP</title>
</head>
<body>
	<h2>처음 만들어보는 <%= str1 %></h2><!-- 스크립트 요소태그들 중에서 표현식 태그 --> 		
	<p>
		<!-- 스크립트 요소태그들 중에서 스크립틀릿 태그 -->
		<%	
		out.println(str2 + str1 + "입니다. 열공합시다.");		
		%>
	</p>


</body>
</html>