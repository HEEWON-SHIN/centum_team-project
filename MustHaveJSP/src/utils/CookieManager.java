package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*쿠키를 생성하거나 생성된 쿠키를 읽어오는 프로그램*/

//쿠키를 생성할 때는 Cookie객체 생성, 경로, 유지기간 등의 설정이 필요하다.

//한편, 쿠키를 읽을 때는 쿠키를 배열로 가져오기 때문에 반복문과 조건문이 필요하다.
//사용하는 쿠키가 많아진다면 조건문은 계속 복잡해질 수 밖에 없다.

public class CookieManager {//쿠키 관리자 역할을 하는 CookieManager클래스
	
	/* 총 3개의 메소드를 만들어야 한다.
	
	 	1. 총 4개의 값(응답헤더값(response객체), 쿠키이름, 쿠키값, 쿠키유지기간)을 매개변수로 전달받아야 한다.
	  		새로운 쿠키를 생성시키는 makeCookie메소드 만들기 */
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime ) {
		
		//쿠키 생성
		Cookie cookie = new Cookie(cName, cValue);
		
			cookie.setPath("/");//<- "/" 자체가 contextpath를 의미,,쿠키 저장 경로를 프로젝트의 컨텍스트주소로 설정
			
			cookie.setMaxAge(cTime);//쿠키 유지기간 설정
			
			response.addCookie(cookie);//웹브라우저로 응답할 정보를 지니는 response객체(응답헤더)에 생성한 쿠키를 추가로 저장해줌			
	}
	
	
	/*2. 명시한 이름의 쿠키를 찾아 쿠키값을 반환하는 readCookie메소드*/
		//이 메소드는 request내장객체로부터 클라이언트가 보내온 쿠키 목록을 받아서
		// 그 중 cName과 이름이 같은 쿠키가 있다면 그 밸류값을 반환한다.
	public static String readCookie(HttpServletRequest request, String cName) {
		
		//반환할 값을 저장할 변수
		String cookieValue = "";
		Cookie[] cookies = request.getCookies();//배열로 쿠키값들을 받아오는 getCookie메소드
		
		if(cookies != null) {//쿠키값을 제대로 받아왔다면?
			
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				
				if(cookieName.equals(cName)) {
					
					cookieValue = c.getValue();
				}//안쪽 if 끝
			}//for문 끝
		
		}//바깥 if문 끝
		
		return cookieValue;
		
	}//메소드 끝
	
	
	
	/*3. 매개변수로 전달받는 명시한 이름의 쿠키를 삭제하는 deleteCookie메소드*/
	public static void deleteCookie(HttpServletResponse response, String cName) {
		
		//쿠키 삭제는 쿠키 생성시 값을 빈 문자열로, 유지기간을 0으로 부여하면 되므로
		//makeCookie메소드를 재활용하여 호출시 값을 전달한다.
		//요약 : 쿠키 삭제
		
		makeCookie(response, cName, "", 0);
		
		
	}

}
