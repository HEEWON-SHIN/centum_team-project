<%@page import="java.util.List"%>
<%@page import="t_member.MemberDAO"%>
<%@page import="t_member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   
    	
    	 <%request.setCharacterEncoding("utf-8");%>	
    
    	
    	<jsp:useBean id="mBean" class="t_member.MemberBean" scope="page"/>
    	
    	
    	<%--
    		회원가입 입력화면(memberForm.html)에서 입력하여 요청된
    		가입할 회원정보들을 request객체에서 꺼내와 바로 <jsp:setProperty>액션태그를 사용하게 되는데
   
   			
   			이 때, <input>태그의 name 속성의 값과 <jsp:setProperty>액션태그의 param속성의 값이 같아야 
   			setter메소드 호출시 매개변수로 전달할 수 있다.
    	 --%>
    	
    
    	<jsp:setProperty  name="mBean" property="id"/><!-- param 속성에 input태그의 name속성명을 적어주면 자동으로 input태그의 value값이 들어온다 -->
    	<jsp:setProperty  name="mBean" property="pwd"/><!-- 그러나 만약 javaBean의 인스턴스 변수와 input태그의 name속성명이 같다면-->
    	<jsp:setProperty  name="mBean" property="name"/><!-- 자동으로 request객체로부터 우리가 입력한 값들을 꺼내오기 때문에 -->
    	<jsp:setProperty  name="mBean" property="email"/><!-- param 속성은 생략이 가능하다!! 즉 property속성만 잘 입력해주면 된다. -->
    	    	
    	<jsp:useBean id="dao" class="t_member.MemberDAO"></jsp:useBean>
    	
  	<%  
  	
  		//4-1. MemberDAO클래스의 addMember()메소드를 호출하여 INSERT구문 실행	
  		dao.addMember(mBean);
  	
  	
    	//5. 위 4번에서 INSERT작업 후 DB의 T_MEMBER테이블에 저장된 모든 회원정보들을 조회해오기 위해 listMembers메소드를 호출
    	//		참고. 조회된 회원정보를 한명 단위로 MemberBean객체의 각 변수에 저장 후
    	//			 각각의 MemberBean객체들을 ArrayList배열에 저장 후 ArrayList배열 자체를 반환받는다.
    	List membersList = dao.listMembers();//업캐스팅
    
    	out.print(membersList.size());//배열의 크기를 알 수 있다.
    
    
    %>
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회된 회원목록 창</title>
</head>
<body>
	<table width=100% align="center">
		<tr align="center" bgcolor="lightblue">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">가입날짜</td>
		</tr>	
	
	<%
		if(membersList.size() == 0){//DB의 T_MEMBER테이블로부터 조회된 회원이 없으면?
	%>	
		<tr>	
			<td colspan="5"><b>등록된 회원이 없습니다.</b></td>
				
				
	<%			
		}else{//조회된 사람이 있으면?
				// => for반복문을 이용해서 ArrayList배열에 저장된 MemberBean객체를 하나씩 꺼내와서
				//		각각의 MemberBean객체 내부에 만들어져 있는 각 인스턴스변수에 저장된 회원정보들을 getter메소드를 이용해 얻어 출력
				
			for(int i=0; i<membersList.size(); i++){
				
				MemberBean mB =(MemberBean)membersList.get(i); //membersList.get(i)메소드가 반환받는 (자식 memberBean객체가) object타입이므로 다운캐스팅 필요!
																//만약 다운캐스팅 하기 싫다면 35번코드줄에서 제네릭타입을 memberBeand으로 지정해주면 된다.
																//List<memberBean> membersList = dao.listMembers();
	%>															
				 
					<tr align="center" bgcolor="coral">
					<td width="7%"><%=mB.getId()%></td>
					<td width="7%"><%=mB.getPwd()%></td>
					<td width="7%"><% out.print(mB.getName()); %></td><%-- 스크립틀릿 안에는 세미콜론 입력해주기! --%>
					<td width="7%"><%=mB.getEmail()%></td>
					<td width="7%"><%=mB.getJoinDate()%></td>
		</tr>	
						
	<%			
			}//for문 끝
				
		}//else끝
	
	%>
	
			<tr height="1" bgcolor="cornflowerblue">
				<td colspan="5"></td>
			</tr>

	</table>




</body>
</html>