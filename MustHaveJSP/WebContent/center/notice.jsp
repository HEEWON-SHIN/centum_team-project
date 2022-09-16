
<%@page import="utils.BoardPage"%>
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
	
	
	
	/***페이지 처리 시작****/
	
	 /*3단계. 전체 페이지의 수*/
		
	 	//한 페이지에 출력할 게시물의 갯수(10)를 얻어 변수에 저장
		int pageSize = Integer.parseInt( application.getInitParameter("POSTS_PER_PAGE") );//application내장객체에 담아서 web.xml에서 얻어옴,,10
	
		//한 화면(블록)에 출력할 페이지 번호의 갯수 5
		int blockPage = Integer.parseInt( application.getInitParameter("PAGES_PER_BLOCK") );
		
		//전체 페이지의 수 구하기,, 이 때 계산된 결과는 무조건 올림처리 한다.
		int totalPage = (int)(Math.ceil( (double)totalCount / pageSize) );//Math.ceil()의 반환값은 double타입이므로 int타입으로 캐스팅(형변환)
																//참고로 글을 추가/제거 하면 총 페이지의 갯수도 증감한다.
														
		//현재 보이고있는 화면의 페이지(pageNum) 번호 구하기
		//	=> 처음에는 무조건 1페이지로 초기화 해두고, 사용자가 페이지 번호를 누르면 
		//		request.getParameter()메소드로 받는 페이지 번호가 달라진다.
		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");//BoardPage의 쿼리스트링에 입력한 값이 request객체에 담겨져서 넘어옴
		
		
		
			if(pageTemp != null && !pageTemp.equals("")){//[1] [2] [3] [4] [5] 중에서 하나의 페이지 번호를 눌렀다면? 
				
				pageNum = Integer.parseInt(pageTemp);//pageNum변수값을 클릭한(요청한) 페이지 번호로 초기화한다.
			}
	
			
		/*2단계. 각 페이지에 출력할 게시물의 범위를 계산한다.	*/
		//목록에 출력할 게시물의 범위를 계산하여 Map배열에 저장한다.
		
		int start = (pageNum -1) * pageSize +1 ;//첫게시물 번호(rownum번호)
				
		int end = pageNum * pageSize;//마지막 게시물 번호(rownum번호)

		//BoardDAO객체의 selectList메소드의 매개변수로 전달하여 SELECT문장을 완성시키기 위해서 범위 시작값과 종료값을 HashMap배열에 저장
		param.put("start", start);
		param.put("end", end);
		
		
		
	/****페이지 처리 끝****/
	 
	
	

	//board테이블에 저장된 글의 정보를 조회해오자(범위에 해당하는 게시물을 조회해서 가져옴)
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
			<h1>게시판 글목록</h1>
			<div id="table_search">
				<form action="notice.jsp" method="post">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" name="searchWord" class="input_box"> 
					<input type="submit" value="검색" class="btn">
				</form>

			</div>

			<!-- 게시물 목록 테이블(표) -->

			<h2>목록 - 현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>)</h2>

			<table id="notice">
				<!-- 각 컬럼 이름 -->
				<tr align="center">
					<th class="tno">글번호</th>
					<th class="ttitle">글제목</th>
					<th class="twrite">작성자</th>
					<th class="tdate">작성일</th>
					<th class="tread">조회수</th>
				</tr>


				<%
					//조회된 게시물이 하나도 없을떄..
					//Vector배열에 BoardDTO객체들이 저장되어 있지않다면?(비어있다면?)
					if (boardLists.isEmpty()) {
				%>
				<tr align="center">
					<td colspan="5" algin="center">등록된 게시물이 없습니다.</td>
					<!-- colspan의 숫자는 5개 칸(열)만큼 한 칸으로 합쳐서 쓰겠다는 뜻 -->
				</tr>
				<%
					} else {//조회된 게시글정보가 있을떄..
						//Vector배열에 BoardDTO객체들이 저장되어 있다면?

						int virtualNum = 0;//화면상에서의 게시물 글번호
						
						
						int countNum = 0;
						

						//조회된 게시글 정보(BoardDTO객체들)는 모두 Vector배열에 저장되어 있으므로
						//for반복문을 돌면서 하나씩 얻어 출력합니다.
						for (BoardDTO dto : boardLists) {

								//virtualNum = totalCount--;//전체 게시물 수에서 시작해 1씩 감소
								/*
									목록 출력시 사용할 가상번호를 계산한다.
									페이지에 따라 출력되는 게시물 범위가 다르므로 가상번호에도 페이지 번호가 적용되어 계산돼야 한다.
									
									예) 전체 게시물 수(totalCount변수) : 106개
										한 페이지에 보여줄 게시물 수(pageSize변수) : 10
										1페이지일 때
											첫번째 게시물 글번호 : 106 - ( ( (1 - 1) * 10  )  + 0 ) = 106
											두번째 게시물 글번호 : 106 - ( ( (1 - 1) * 10  )  + 1 ) = 105
											
										2페이지일 때
											첫번째 게시물 글번호 : 106 - ( ( (2 - 1) * 10  )  + 0 ) = 96
											두번째 게시물 글번호 : 106 - ( ( (2 - 1) * 10  )  + 1 ) = 95
								*/
								
								
							//글번호 = 조회된 글 갯수 - (((현재 화면의 페이지 번호 -1) + 한페이지에 보여줄 글갯수) + 글번호를 의미하는 가상으로 증가시킬 변수)			
							virtualNum = totalCount - (((pageNum-1) * pageSize) + countNum++);	
								
				%>
				<tr align="center">
					<td><%=virtualNum%></td><!-- 글번호 -->					
					
					<td><a href="View.jsp?number=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
					<!-- 글제목,,클릭했을 때 내용 보여주는 페이지(View.jsp)로 이동하기 위해 <a>태그로 감싸준다
								글번호를 기준으로 조회해오기 위해서  ?뒤에 키=값 형태로 넣어줌 -->					
					
					<td><%=dto.getId()%></td><!-- 작성자 아이디 -->
					<td><%=dto.getPostdate()%></td><!-- 작성일 -->		
					<td><%=dto.getVisitcount()%></td><!-- 조회수 -->
					
				</tr>

				<%
							}

				}
				%>

			</table>

			<div id="table_search">


				<%
					String userId = (String) session.getAttribute("UserId");

				if (userId != null) {//로그인 돼있으면?(session에 아이디 저장돼있으면?)
				%>
				<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'"><!-- onclick 속성값에 자바스크립트코드 입력 가능함 -->

				<%
					}
				%>


			</div>
			<div class="clear"></div>
			<div id="page_control">
				<%-- BoardPage는 static 클래스라서 객체 생성 필요없음!--%>
				<%= BoardPage.pagingStr(totalCount,//조회한 글 수
												pageSize, //한 화면에 보여줄 글 수
												blockPage, //하나의 블럭에 묶여지는 페이지번호 갯수
												pageNum, //현재 보여지는 페이지 번호
												request.getRequestURI() //포트넘버를 제외한 클라이언트가 요청한 context주소(MustHaveJSP/center/notice.jsp)
												)%>
				
				<% System.out.println(request.getRequestURI()); %>
				
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