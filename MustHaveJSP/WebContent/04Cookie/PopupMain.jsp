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
    
	Cookie[] cookies = request.getCookies();//쿠키를 읽어 popMode변수에 값 설정
	
	
	if(cookies != null){//쿠키값을 제대로 받아왔다면? cookies변수에 쿠키값이 제대로 저장됐다면?
		
			for(Cookie c : cookies){
				
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				
				if(cookieName.equals("popupClose")){//"popupClose"라는 쿠키가 존재하면?
					
					popupMode = cookieValue;//popupMode변수 쿠키값 갱신
						
				}//안쪽if
			}//for문
		
		
	}//바깥 if
    
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
				
				
				//id속성값이 inactiveToday이면서 <input type=checkbox">인 체크된 상태의 체크박스의 체크된 값을 얻어 변수에 저장.				
				var chkVal = $("input[id=inactiveToday]:checked").val();//체크 여부
				
			
				
				/*참고
					체크박스를 체크하면 chkVal변수에 "1"이 저장되고, 
					체크하지 않으면 아무런 값도 저장되지 않는다.(undefined)
				*/
				
				
				/*
					Ajax기술
						클라이언트의 요청한 값들을 서버페이지로 보내는 비동기 방식! 요청 기술
						
						jquery언어에서 Ajax기술을 사용하기 위해서는
						$.ajax()메소드를 사용하면 된다.	
						
						문법
						$.ajax({속성명:속성값, 속성명:속성값, .....});
				*/
				$.ajax(
						{						
							url:"./PopupCookie.jsp",//비동기방식으로 요청을 보낼 서버페이지의 URL.
							
							type:"get",//전송방식을 get 혹은 post 중에 하나를 지정.
							
							data:{inactiveToday : chkVal},//서버페이지로 요청시 전송할 데이터를 지정(request객체에 저장될 값을 의미한다.)
							
							dataType:"text",//서버페이지로부터 응답받을 데이터의 타입을 지정한다.("xml", "jason", "image" 등등의 값 지정 가능)
							
							success:function(resData){//서버페이지의 (비동기방식으로) 요청에 성공했을때...
												//서버페이지가 응답하는 응답데이터를 받을 콜백함수function이 자동으로 호출되어 
												//매개변수로 (응답데이터를)전달 받아 처리하게 된다.
								
										console.log(resData);//F12눌러서 웹브라우저의 console탭에 빈공백이 같이 출력됐는지 확인
												
								 	if(resData != ""){//서버페이지가 응답하는 데이터 resData매개변수로 받은 값이 있다면?			
								 			
								 			
											location.reload();//현재 페이지를 재요청해 새로고침이 일어나게 함,,쿠키설정 확인을 위해 해주는 것임
											
										}		
								}//success끝
							
						}
				);
				
				
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
				<!-- 
					<form>태그의 역할
						: <form>태그 내부에 <inpuit>태그들에 입력한 요청한 값들을
						  동기화 방식으로! action속성에 작성한 서버페이지로 요청하는 역할
				
				 -->
				<form action="popFrm"><!-- 동기화 방식으로 재요청함! 단점: 톰캣이 필요없는 정보?까지 모두 읽어들인 후에 응답해서 응답 속도가 느리다 -->
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