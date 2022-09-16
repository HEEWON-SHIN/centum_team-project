<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<%-- 로그인을 위해 아이디, 패스워드를 입력 후 로그인 버튼을 눌렀을 때...
		 login.jsp서버페이지에 로그인 요청을 한다. --%>
	<form action="login.jsp" method="post">
	 아이디 : <input type="text" name="id"><br>
	 패스워드 : <input type="password" name="pw"><br>
	 <input type="submit" value="로그인">&nbsp;&nbsp;<input type="reset" value="취소">
									<!-- &nbsp;는 스페이스바 한칸을 의미 -->
	</form>
	
	<%
		if(request.getMethod().equals("POST")){//<form>태그로 요청한 전송방식이 post방식이면?(POST 항상 대문자로 적기)
			
			//한글처리
			request.setCharacterEncoding("UTF-8");
		
			//요청한 값(입력한 아이디, pw) 얻기
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
				if("master".equals(id)){//DB에 저장된 id값 "master"와 login.jsp화면에 입력한 아이디가 동일한가?
						//"master"를 먼저 적은 이유 : 아이디를 입력하지 않으면 null값이 되는데 그 경우 if문을 하나 더 적어줘야함
						
						
						//DB에 저장된 패스워드 값 "1111"과 입력한 비밀번호 값이 같으면?
						if("1111".equals(pw)){
							
							/*session내장객체 메모리 영역에 세션값을 저장*/
							session.setAttribute("session_id", id);//name값은 임의로 지정 가능
							
							
							//로그인 처리된 화면을 메인홈페이지화면(index.jsp)에 보여주기 위해 재요청(포워딩)
							response.sendRedirect("index.jsp");
							
							
						}else{//아이디는 알맞게 입력했으나, 비밀번호가 틀렸을 때?
	%>							
							<script type="text/javascript">	
							window.alert("비밀번호를 확인해주세요.");
							</script>
	<%					
						}
					
				}else{//DB에 저장된 id값 "master"와 입력한 아이디 값이 다르면?
	%>				
					<script type="text/javascript">	
						window.alert("아이디와 비밀번호를 확인해주세요.");
					</script>
	<%				
				}//안쪽 else
			
		}//바깥 if
	
	
	
	
	
	%>
</body>
</html>