<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%=num %><%--전역변수라 변수 선언해놓은 코드줄보다 위쪽에서(17코드줄) 출력 가능 --%>
   
   <%--<%=result %>,,err
   		result는 지역변수라 선언해놓은 코드줄보다 밑에서만 출력 가능 --%>
   
   <%-- 선언부 태그 영역에 변수 또는 메소드를 만들어놓을 수 있다,, 메소드 호출은 하면 안됨!--%> 
   <%!
   	//두개의 정수값을 매개변수로 전달받아 그 합을 리턴하는 add()메소드 선언
   	public int add(int num1, int num2){
	   
	   return num1 + num2;
   }
   
   int num = 10;//변수 선언★★전역변수★★가 된다.
   %>

	<%=num %>
   


<%--스크립틀릿 태그 영역은 자바코드를 작성해놓을 영역이다. 이 영역에서는 메소드를 만들어놓을 수 없다. --%>
   <%
   		//add메소드 호출시! 10과 20을 매개변수로 전달해 그 합을 리턴받아 result변수에 저장
   		int result = add(10, 20);//_jspService(){}메소드 안에 작성되어 ★★지역변수★★가 된다.
   								//그래서 메소드를 만들면 에러가 나게된다.(자바에서는 메소드 안에 메소드 선언이 불가능.) 
   
   		//out.println("덧셈결과1 : " + result + "<br>");
   		//out.println("덧셈결과2 : " + add(30,40) + "<br>");
   		
   %>
   
   
   <%--표현식 태그 영역은 변수에 저장된 데이터를 웹브라우저로 출력(응답)할 수 있는 태그영역이다.
   		스크립틀릿 영역에서 out.println()하는 것보다 훨씬 간편해진다. --%>
   		
   덧셈결과1 : <%=result %> <br>
   덧셈결과2 : <%=add(30, 40)%>
   
   
   
   