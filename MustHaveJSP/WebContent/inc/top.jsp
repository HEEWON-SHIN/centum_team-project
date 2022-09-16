<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<header>
		<%
				/*loginPro.jsp에서 setAttribute()메소드를 이용해서 session영역에 저장한 아이디와 이름값 얻어옴*/
				String userId = (String)session.getAttribute("UserId");//getAttribute()메소드는 object타입반환=>다운캐스팅 필요!
				String userName = (String)session.getAttribute("UserName");
			
				if(userId == null){/*session영역에 입력한 아이디가 저장 안되어있으면? (로그인 실패하면?)*/
			%>
				<%--다시 로그인 할 수 있는 이미지 상단에 띄워줌 --%>
					<div id="login">
						<a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a>
					</div>
			<%		
				}else{//session영역에 입력한 아이디가 저장 되어있으면? (로그인 성공하면?)
			%>		
				<!-- 로그인된 화면 표시됨 -->
					<div id="login">
						<%=userName %>님, 로그인 하셨습니다.
						<a href="../member/logout.jsp">logout</a>
					</div>	
					
			<%		
				}
			
			%>
		<div class="clear"></div>
		<!-- 로고들어가는 곳 -->
		<div id="logo">
			<img src="../images/logo.gif" width="265" height="62" alt="Fun Web">
		</div>
		<!-- 로고들어가는 곳 -->
		<nav id="top_menu">
			<ul>
				<li><a href="../index.jsp">HOME</a></li>
				<li><a href="../company/welcome.jsp">COMPANY</a></li>
				<li><a href="#">SOLUTIONS</a></li>
				<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
				<li><a href="#">CONTACT US</a></li>
			</ul>
		</nav>
	</header>
