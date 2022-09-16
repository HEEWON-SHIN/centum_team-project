<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  	//1. 인코딩방식을 UTF-9로 request내장객체에 설정
  	request.setCharacterEncoding("UTF-8");
  
  	//2. join.jsp에서 요청한 값(회원가입을 위해 입력한 회원정보)을
  	//	 request내장객체에서 꺼내와 얻기
  	String id = request.getParameter("id");//join.jsp 폼태그에 입력한 아이디 얻기
  	String pass = request.getParameter("pass");
  	String name = request.getParameter("name");
  	String email = request.getParameter("email");
  	String address = request.getParameter("address");
  	String tel = request.getParameter("phone");
  	String hp = request.getParameter("mobile");
  
  
  	
  	//3. 입력한 회원정보들을 DB의 member테이블에 INSERT하고
  	//	 회원가입 성공 메시지(응답할 메시지) 마련
  	//	 요약 : 비즈니스 로직 처리
  	//	 먼저 DTO 와 DAO클래스 만들기!
  	
  	//3-1. 입력한 회원정보들을 DB의 member테이블에 INSERT 하기 전에
  	//		객체 단위로 저장시켜 보내기 위해 MemberDTO객체를 생성해서 각 변수에 저장
  	MemberDTO memberDto = new MemberDTO(id, pass, name, null, email, address, tel, hp);
  	
  	//3-2. member테이블에 INSERT 작업하기 위한 메소드 호출!
  	//		회원가입에 성공하면 1을 반환받고, 실패하면 0을 반환(응답메시지 마련)
  	MemberDAO memberDao = new MemberDAO();
  	
  		int result = memberDao.insertMember(memberDto);
  		
  		
  		if(result == 1){//회원가입에 성공했다면?
  		//4. 회원가입에 성공했다면? login.jsp를 재요청해 로그인할 수 있도록 한다.
  				//response.sendRedirect("login.jsp"); -> 재요청 구문은 한번만 입력해야한다.
%>
	<script type="text/javascript">
		alert("회원가입 성공!!");
		location.href="login.jsp";
	</script>
<%  			
  		}else{//회원가입에 실패했다면?
%>
	<script>
		alert("회원가입 실패!");
		history.back();//이전 join.jsp로 되돌아가게 재요청
	</script>
<%  			
  		}
  	
%>  
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>