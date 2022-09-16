<%@page import="java.util.List"%>
<%@page import="t_member.MemberDAO"%>
<%@page import="t_member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	//1. 인코딩 방식 utf-8로 설정
    	request.setCharacterEncoding("utf-8");
    
    	//2. memberForm.html에서 입력한 회원가입 정보를 request객체에서 꺼내와 얻기(요청한 값 얻기)
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	//3.MemberBean객체(DTO객체) 생성하여 입력한 회원정보들을 각각 변수에 저장
    	//		방법1. setter메소드들을 호출하여 각 변수에 저장
    	//		방법2. MemberBean객체 생성시 생성자로 입력한 정보를 전달하여 각 변수에 저장
    	//MemberBean mBean = new MemberBean(id, pwd, name, email);
    %>	
    	
    	
    	
    	<%--
    		<jsp:useBean>액션태그를 이용하여 MemberBean클래스에 대한 객체(빈Bean) 생성
    		
    		id속성값 : 생성한 MemberBean객체를 식별할 수 있는 유일한 고유값(즉, 참조변수)
    		
    		class속성값 : 생성한 자바빈 객체의 클래스(MemberBean)가 저장된 경로
    		
    		scope속성값 : page / request / session / application 중 하나를 적어준다(생략가능,,생략해도 기본값은 page이다)
    		
    			참고로 page라고 적으면 현재 member2.jsp페이지 내부에서만! 생성된 MemberBean객체를 공유해서 사용할 수 있다.
    			
    		액션태그를 사용해서 자바빈 객체를 생성하면 기본생성자만 호출할 수 있다,,	
    			
    	 --%>
    	
    	
    	<!-- 자바코드로 객체를 생성하지 않고 useBean액션태그로 MemberBean객체 생성하기! -->
    	<jsp:useBean id="mBean" class="t_member.MemberBean" scope="page"/>
    	
    	
    	
    <%	
    	//3-1. setter메소드를 호출하여 각 변수에 저장
    	mBean.setId(id);
    	mBean.setPwd(pwd);
    	mBean.setName(name);
    	mBean.setEmail(email);
    	
    
    	//4. DB에 입력한 새로운 회원 한명의 정보를 INSERT하기 위해 
    	//	 MemberDAO객체의 메소드 호출시..
    	//	 매개변수로 MemberBean객체를 전달해 DB의 T_MEMBER테이블에 INSERT하기
    	//MemberDAO dao = new MemberDAO();
    	
    	//dao.addMember(mBean);
    %>
    	
    	<!-- 자바코드로 객체를 생성하지 않고 useBean액션태그로 MemberDAO객체 생성하기! -->
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
					<td width="7%"><%=mB.getEmail()%></td>
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