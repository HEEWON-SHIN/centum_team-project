<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%--jsp에서 서블릿이나 EL을 이용할 경우 로딩된 페이지에서 소스보기를 해 보면(console창 보면) 공백으로 표기가 된다.
	trimDirectiveWhitespaces 속성을 true로 할 경우 해당 공백을 모두 제거해 준다.(기본값은 false)
--%>

<%
	/*쿠키를 생성해서 응답객체(response)에 추가하는 페이지*/

	
	//체크박스 체크여부값을 얻어서 chkVal변수에 저장
	String chkVal = request.getParameter("inactiveToday");//1 (체크된 상태) 혹은 undefined(체크안됨)


	
	if(chkVal != null && chkVal.equals("1")){//체크여부의 값이 "1"이면 쿠키를 생성
		
		//쿠키 생성
		Cookie cookie = new Cookie("popupClose", "off");//popupMode변수의 값이 popupClose("off")로 저장된다.
		
		//쿠키 저장 경로 설정
		cookie.setPath(request.getContextPath());
		
		//쿠키 유지 기간 하루로 설정
		cookie.setMaxAge(60*60*24);//하루(초*분*24시간)
		
		//클라이언트의 웹브라우저로 응답할 데이터를 설정하는 response객체에 쿠키 저장
		response.addCookie(cookie);
		
		
		out.print("쿠키 : 하루동안 열지 않음");//클라이언트의 웹브라우저로 응답한 데이터는 웹브라우저로 바로 전송되지 않고
											//현재 PopupCookie.jsp서버페이지를 
											//비동기 방식으로 요청했던
											//$.ajax메소드 내부에 작성된
											//success:function(매개변수){}의
											//매개변수(resData)로 전달된다.
	}





%>