<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//1. request객체 영역의 데이터 한글처리
		request.setCharacterEncoding("utf-8");
	
		//2. 클라이언트가 요청한 값 얻기
		int dan = Integer.parseInt(request.getParameter("dan"));
	%>
	<!-- 3. 클라이언트에게 응답할 값 마련
		 4. 클라이언트가 사용하는 웹브라우저로 응답(출력) -->
	<table border="1" width="100%">
		<tr bgcolor="cornflowerblue" align="center">
			<td colspan="2"><%=dan %>단 출력</td>
			<!-- colspan속성에 숫자 2를 넣으면 두칸을 한칸으로 합쳐서 사용한다..
								  3을 넣으면 세칸을 한칸으로 합쳐서 사용 -->
		</tr>
	<%
		for(int i=1; i<10; i++){//9번 반복
	%>	
			<tr align="center"><!-- align속성: 중앙정렬 -->
				<td width="50%"><%=dan %>*<%=i %></td>
				<!-- width는 테이블 폭의 50%만큼 차치 -->
				<td width="50%"><%=dan*i %></td>
			</tr>
	<%
		}//for문 끝
	%>
	</table>
</body>
</html>