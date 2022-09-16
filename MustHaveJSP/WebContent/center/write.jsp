<%@ page import="board.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	//1.DAO객체를 생성해 DB와 연결하고 전체 글목록을 조회해 온다.
	BoardDAO dao = new BoardDAO();

	//2.사용자가 입력한 검색조건을 저장하기 위한 Map(해시맵) 변수 선언 
	Map<String, Object> param = new HashMap<String, Object>();//업캐스팅

	request.setCharacterEncoding("utf-8");

	//선택한 검색기준값(글제목/글내용)과 입력한 검색어를 request내장객체에서 얻어 변수에 저장
	String searchField = request.getParameter("searchField");//선택한 옵션태그의 value값이 변수에 저장됨
	String searchWord = request.getParameter("searchWord");//검색창에 입력한 값 얻어와서 변수에 저장

	if (searchWord != null) {//검색어를 입력했다면?

		param.put("searchField", searchField);//선택한 옵션태그의 value값을 해시맵에 값으로 저장(키는 임의로 지정 가능)
		param.put("searchWord", searchWord);//입력한 검색어 해시맵에 저장

	}

	//board테이블에 글이 몇 개 저장되어 있는지 조회 해보자
	int totalCount = dao.selectCount(param);

	//board테이블에 저장된 글의 정보를 조회해오자
	List<BoardDTO> boardLists = dao.selectList(param);
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
</head>

	<script>
		 function emptyPass(form) {
			
			
				if(form.pass.value == ""){//비밀번호를 입력하지 않았다면?
					alert("패스워드를 입력하세요");
					return false;
				}
			 
		}
	 
	 </script>


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
		
	<% String userId = (String) session.getAttribute("UserId"); %><%--아래 input태그에서부터 userId변수 쓰기 위해서 이 위치에서 변수 선언! --%>
		<article>
			<h1>게시판 글쓰기</h1>
			
		<form action="writePro.jsp" method="post" onsubmit="return emptyPass(this);">
			<!-- 게시물 목록 테이블(표) -->

			<table id="notice">
				
				<tr>
					<td>글쓴이Id</td>
					<td><input type="text" name="name" value="<%=userId %>" readonly></td><!-- readonly속성 주면 읽기만 가능함, 텍스트 입력 불가 -->
				</tr>
				
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pass"></td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				
				<tr>
					<td>글내용</td>
					<td><textarea name="content" rows="13" cols="40"></textarea></td>
				</tr>
				
				<div id="table_search">
					<input type="submit" value="글쓰기" class="btn"><!-- class속성을 줘야 css적용이 가능함 -->
					<input type="reset" value="다시쓰기" class="btn">
					<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
				</div>
			</table>
		</form>	
			
			<div class="clear"></div>
			<div id="page_control"></div>
				
			
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