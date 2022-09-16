package utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;//ctrl + shift + o : 필요한 클래스 자동 import해주는 단축키!!



/*
 
	응용 - 로그인 아이디 저장
	
	설명
		로그인 페이지에서 아이디를 저장하는 기능을 구현해 보겠습니다.
		
		쿠키를 이용한 아이디 저장 시나리오는 다음과 같다.
		1. 로그인에 성공한 경우에만 쿠키를 생성 및 삭제한다.
		2. 쿠키에 저장된 아이디가 있으면 로그인 페이지에서는 아이디가 자동 입력된다.
		3. [아이디 저장하기] 체크박스를 해제하고 로그인에 성공하면 쿠키가 삭제된다.

 
 	결론
 		쿠키는 클라이언트의 상태정보를 저장할 수 있으므로 아이디 저장뿐 아니라 로그인 유지용도로 사용할 수 있다.
 		하지만 로그인 유지에는 쿠키보다 세션을 주로 사용한다.
 		그 이유는 쿠키값은 클라이언트의 웹브라우저에 저장되어 노출위험이 있기 때문에,
 				서버측의 저장소인 session을 사용한다.
 		
 		쿠키는 생성 직후에는 바로 사용할 수 없다. 클라이언트가 재요청을 했을 때부터 사용할 수 있다.
 */





//JSPFunction클래스는 메시지 알림창을 띄운 후 특정 페이지로 이동하는 자바스크립트 코드를 추가해주는 메소드들을 담고있다.
public class JSPFunction {

	
	//메시지 알림창을 띄운 후 명시한 URL로 재요청하여 보여준다.(이동하여 보여준다.)
	public static void alertLocation(String msg, String url, JspWriter out) {
		
		try {
		String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+"		location.href='"+url+"'"
						+"</script>";
		
		
			out.println(script);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
	}//메소드 끝
	
	
	
	/*메시지 알림창을 띄운 후 이전 페이지를 요청해 되돌아가게하는 기능의 메소드(이전 페이지를 보여준다.)*/
	public static void alertBack(String msg, JspWriter out) {
		
		
		try {
			String script = ""
							+ "<script>"
							+ "		alert('" + msg + "');"
							+"		history.back();"//혹은 go -1?해줘도 된다.
							+"</script>";
			
			
				out.println(script);
			} catch (IOException e) {
			
				e.printStackTrace();
			}
		
	}
	
	
	
	
}
