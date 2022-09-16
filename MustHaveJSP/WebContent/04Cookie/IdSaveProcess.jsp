<%@page import="utils.JSPFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%/*로그인 및 아이디 저장기능 구현하기*/
    	//한글처리
    	request.setCharacterEncoding("UTF-8");
    
    	//클라이언트의 요청값 받기
    	//로그인을 위해 입력한 값과 체크값을 request객체에서 얻는다.
    	String user_id = request.getParameter("user_id");
    	String user_pw = request.getParameter("user_pw");
    	String save_check = request.getParameter("save_check");
    
    
    	//데이터베이스에 저장된 아이디는 "must", 비번은 "1234"라고 가정하자
    
    	//데이터베이스에 저장된 아이디와 패스워드를 로그인 처리를 위해 입력한 아이디, 패스워드와 비교
    	if("must".equals(user_id) && "1234".equals(user_pw)){
    		
    		//로그인에 성공하면 [아이디 저장하기]체크박스에 체크여부를 확인
    		if(save_check != null && save_check.equals("Y")){//체크하고 로그인한 상태라면?
    			
    				CookieManager.makeCookie(response, "loginId", user_id, 86400);
    				
    		}else{
    			
    			//쿠키 삭제
    			CookieManager.deleteCookie(response, "loginId");
    			
    		}//안쪽 else 끝
    		
    		
    		/*로그인 성공 알림창을 띄워준 후 메인페이지(IdSaveMain.jsp)로 재요청해 이동시킨다.*/
    			//-> 이 기능은 JSPFunction클래스에 만들어놓은 alertLocation메소드를 호출하여 실행하자
    		JSPFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
    			
    			 
    	}else{//로그인 실패한 경우
    		//단순히 로그인 실패 알림창을 띄운 후 이전페이지로 되돌아가게 한다.
    		JSPFunction.alertBack("로그인 실패", out);
    		 
    	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>