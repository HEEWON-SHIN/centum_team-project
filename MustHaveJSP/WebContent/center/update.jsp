<%@ page import="board.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="board.BoardDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//인코딩 방식 설정
	request.setCharacterEncoding("utf-8");

	//View.jsp화면에서 글수정 버튼을 눌렀을 때..수정할 글 번호를 request에서 꺼내와 얻는다,,
	//	수정할 글의 글번호를 기준으로 글 정보를 조회해옴.
	String num = request.getParameter("number");
	 
	BoardDAO  dao = new BoardDAO(); 
	
	//dao.updateVisitCount(num);//수정할 때는 조회수 증가시키면 안됨!!
 
 	BoardDTO dto = dao.selectView(num);//글번호 전달 후 글번호에 해당되는 글 조회해오기
%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
 
 
	<script>
		 function emptyPass(form) {
			
			
				if(form.pass.value == ""){//비밀번호를 입력하지 않았다면?
					alert("패스워드를 입력하세요");
					return false;
				}
			 
		}
	 
	 </script>
 
 
 
 </head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" /><%--jsp액션태그(동적 데이터가 있는 디자인 실행 후 보여줌
													참고로 include file="" 지시자 태그는 정적인 디자인을 포함하는 페이지를 인클루드. --%>
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Notice</a></li>
				<li><a href="#">Public News</a></li>
				<li><a href="#">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->
		<article>
			<h1>게시판 글 수정하기</h1>
			
			<form action="updatePro.jsp" method="post" onsubmit="return emptyPass(this);">
			
			<!-- <input type="hidden">태그를 이용해 updatePro.jsp요청시 
					<input>태그 디자인은 노출되지 않고, value 속성값만 request에 포함시켜서 전송할 수 있다! -->
			<input type="hidden" name="num" value="<%=dto.getNum()%>">
			
			
				<table id="notice">
					<tr>
						<td>글 수정자</td>
						<td><input type="text" name="name" value="<%=dto.getName()%>" readonly></td>
					</tr>
					
					<tr>
						<td>글 비밀번호</td>
						<td><input type="password" name="pass"></td>
					</tr>
					
					<tr>
						<td>글제목</td>
						<td><input type="text" name="title" value="<%=dto.getTitle()%>"></td>
					</tr>
					
					<tr>
						<td>글내용</td>
						<td><textarea name="content" rows="13" cols="40"><%=dto.getContent().replace("<br>","\r\n") %></textarea></td>
					</tr>
					
					
					
				</table>
	
				<div id="table_search">
							
					<input type="submit" value="글 수정" class="btn" >
																															
					<input type="reset" value="다시 작성" class="btn">
					
					<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
	
				</div>
			
		</form>	
			
			<div class="clear"></div>
			<div id="page_control">
				
			</div>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>