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

//notice.jsp페이지에서 조회된 글 목록의 행에 있는 글목록을 눌렀을 때,
//글번호를 전달 받아 저장
String num = request.getParameter("number");

BoardDAO dao = new BoardDAO();

dao.updateVisitCount(num);//조회된 글의 글조회수 1증가

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





<script type="text/javascript">
	/*아래의 글삭제 버튼을 누르면 onclick속성에 의해서 실행되는 함수*/
	//진짜로 삭제할건지 물음창을 띄워 확인하고, 확인 버튼을 누르면 <form>태그의 action속성의 주소를
	//자바스크립트 구문으로 지정한 후 <form>태그 내부의 삭제할 글번호 <input type="hidden">태그의 값을 
	//request에 담아서 같이 전송시키는 일을 하는 함수
	function deletePost() {

		var confirmed = window.confirm("정말로 삭제하시겠습니까?");//컨펌창 띄워 확인을 하고,,삭제를 누르면 true반환 취소를 누르면 false 반환

		if (confirmed) {//삭제하겠다고 하면?( true)

			var form = document.writeFrm;//<form>태그의 name속성값 적어줌
			form.method = "post";//전송방식을 설정

			form.action = "deletePro.jsp";//삭제 요청을 전송할 서버페이지 속성(submit 했을 때 이동할 페이지 설정)

			form.submit();//함수가 호출돼서 true값이 반환되면 자동으로 submit이 되어 delte.jsp페이지로 이동하도록 설정

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
			<h1>게시판 글정보</h1>


			<!-- 게시물 목록 테이블(표) -->

			<table id="notice">
				<tr>
					<td>글번호</td>
					<td><%=dto.getNum()%></td>
					<td>조회수</td>
					<td><%=dto.getVisitcount()%></td>
				</tr>

				<tr>
					<td>글작성자</td>
					<td><%=dto.getId()%></td>
					<td>작성일</td>
					<td><%=dto.getPostdate()%></td>
				</tr>

				<tr>
					<td>글제목</td>
					<td colspan="3"><%=dto.getTitle()%></td>

				</tr>

				<tr>
					<td>글내용</td>
					<td align="left" colspan="3"><%=dto.getContent().replace("\r\n", "<br>")%></td>
					<!-- replace("조회한 글내용에서 엔터키 누른 것을",<br>로 해줌) -->

				</tr>
			</table>

			<form name="writeFrm"><!-- 참고로 onsubmit속성은 return을 항상 적어줘야하며, return된 값을 받아서 action에 적은 페이지로 넘어가기 전에 
										onsubmit에 적은 함수가 먼저 실행된다(onsubmit은 submit행위 자체를 등록하는 속성이다.)
										
										그리고 <form>태그의 하위 버튼 중에 반드시 ㅣsubmit버튼이 있어야 onsubmit을 줄 수 있다.
										
										onclick속성을 가진 버튼만 있다면 submit버튼 없이 type ="button"인 버튼만 있어야 한다.  -->

				<div id="table_search">


					<%
						String userId = (String) session.getAttribute("UserId");//session에서 로그인한 아이디값 얻어서 변수에 저장

					if (userId != null && userId.equals(dto.getId())) {//로그인 돼있고 로그인한 아이디와 dto.getId()같으면?
						//										(session에 아이디 저장돼있으면,,dto.getId()에는 글작성한 아이디가 저장됨)
					%>
					<input type="button" value="글 수정" class="btn" onclick="location.href='update.jsp?number=<%=dto.getNum()%>'">
						
					<!-- 클릭하면 update.jsp페이지 재요청하고, 글번호를 request객체에 키는 number로 값은 글번호로 지정함 -->

					<input hidden name="num" value="<%=dto.getNum()%>">
					<!-- hidden속성 주고 이름을 부여해서 글번호를 활용해 삭제할 수 있도록 함 -->
					
					
					
					<input type="button" value="글 삭제" class="btn" onclick="deletePost();">
										<!-- onclick속성이 있을 때는 type="submit"이면 안됨!!! -->



					<%
						}
					%>
					<input type="button" value="글목록" class="btn"
						onclick="location.href='notice.jsp'">
						
						
			</form>
			
			
		</div>
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