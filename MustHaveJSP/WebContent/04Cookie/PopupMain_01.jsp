<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	응용 - 레이어 팝업창 제어 기능
    	
    	설명 
    		쿠키의 기본 사용법을 알아봤으니 실무에서 응용할 수 있는 예제를 만들어보자.
    		
    		웹애플리케이션을 개발할 때 팝업창을 많이 사용하게 된다.
    		팝업창은 회원가입시 아이디 중복체크나 간단한 공지사항을 띄어주는 용도로 자주 사용한다.
    		과거에는 별도의 URL을 가지는 팝업창을 주로 사용했었으나 불법광고를 홍보하는 데 많이 악용되어
    		최근에는 레이어를 이용한 형태의 팝업창을 주로 사용한다.
    		
    	주제 
    		쿠키를 사용하지 않는 기본 기능 구현하기
    
     --%>
<%
	//레이어 팝업창을 띄울지 여부를 알려주는 popupMode변수 선언,,이 값이 "on"이면 팝업창을 보여준다.
	String popupMode = "on";
    
    
    
%>
     
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리 ver 0.1</title>

	<style type="text/css">
		
		div#popup{
			/*css로 레이어 팝업창의 위치 지정*/
			position: absolute;/*웹브라우저상에서 절대위치로 위치 지정*/
			top: 100px; left: 50px; 
			color: OrangeRed;
			width: 270px; height: 100px;
			background-color: Lavender;
		}
	
		div#popup div{
			position: relative;
			background-color: snow;
			top: 0px;
			border: 1px solid gray;
			color: black;
			padding: 10px;
		}
	
	
	</style>



		<!-- CDN방식으로 항상 최신버전으로 업데이트된 제이쿼리를 불러와 설치 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function () {
			
			//닫기버튼(id="closeBtn")을 클릭하는 이벤트 등록
			$("#closeBtn").click(function () {
				//팝업창 div영역(id="popup")을 숨김 처리
				$("#popup").hide();
				
				
			});
			

		});	
	
	
	</script>		
			




</head>
<body>
	<h2>팝업 메인 페이지(ver 0.1)</h2>
<%
		for(int i=1; i<=10; i++){
			
			out.print("현재 팝업창은 "+popupMode +"상태이다.<br>");
		}
		
	if(popupMode.equals("on")){//popupMode변수 값이 "on"일 때만 팝업창 표시
%>		
		
	<%--공지사항 팝업창의 HTML코드 --%>	
		<div id="popup">
			
			<h2 align="center">공지사항 팝업입니다.</h2>
			<div align="right">
				<form action="popFrm">
					<input type="checkbox" id="inactiveToday" value="1">하루동안 열지 않음
					<input type="button" value="닫기" id="closeBtn">
				</form>
			
			</div>		
		</div>
		
			
<%			
	}	
%>
</body>
</html>