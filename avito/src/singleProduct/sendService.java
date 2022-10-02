package singleProduct;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class sendService extends HttpServlet{

	public static int sendProccess(String email, HttpServletRequest req, HttpServletResponse resp) {

		int result = 0;
		
		// 폼값(이메일 내용) 저장
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", "kahncho0713@naver.com");  // 보내는 사람
		emailInfo.put("to", email);      // 받는 사람
		emailInfo.put("subject", "쿠폰코드입니다");  // 제목

		// 내용은 메일 포맷에 따라 다르게 처리
		String content = "프로모션 코드 : "+promoCode.randomCode(10)+"(발급일로부터 24시간 동안 유효합니다.)";  // 내용
		
	
		    
		    // 변환된 내용을 저장
		    emailInfo.put("content", content);
		    emailInfo.put("format", "text/html;charset=UTF-8");
		
		try {
			//쿠키에 프로모션코드 저장
			cookie.setCookie(resp, content, "cookie");
			
			
			 NaverSMTP smtpServer = new NaverSMTP();  // 메일 전송 클래스 생성
			    smtpServer.emailSending(emailInfo);      // 전송
			
			 result = 1;//성공하면 1 반환
			
		} catch (Exception e) {
			System.out.println("sendService 내부 오류 발생 "+e);
			e.printStackTrace();
			
			result = -1;//실패하면 
		}
		
		return result;
	}
	
	
}
