package sec01.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*input.html페이지 화면에서 이름, 비번, 체크박스 과목들을 체크해서 전송버튼을 눌렀을 때 요청 받는 서블릿 페이지*/

@WebServlet("/input")//맵핑 이름을 톰캣에게 알려주기 위한 어노테이션 기호 @WebServlet
					//서블릿을 요청할 매핑 이름은 <form>태그의 action속성값과 동일해야 한다



public class InputServlet extends HttpServlet {
	


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet메소드 호출됨");
		
		//1. 클라이언트가 요청한 데이터들(입력한 아이디, 비번)은 모두 매개변수로 전달받아 HttpServletRequest객체 메모리에 저장되고,
		// 	 전달받은 데이터들 중에 한글이 하나라도 존재 할 경우 꺼내올 때 한글이 깨질 수 있기 때문에 
		//   그걸 방지하기 위해 인코딩방식을 utf-8로 하자
		//	 요약 : 한글처리
		request.setCharacterEncoding("utf-8");
		
		//2. input.html에서 입력하여 서블릿에 요청한 값들을 HttpServletRequest객체에서 꺼내오기
		//	 요약 : 요청한 값 얻기
		String user_id = request.getParameter("user_id");//<- <input>태그의 name값 넣어줌
		String user_pw = request.getParameter("user_pw");
		
		//input.html의 체크박스들 중 선택된 과목들 얻기
		// 참고 : <input>태그의 name="subject"로 여러값들을 한꺼번에 전송받아 얻을 경우
		//		 HttpServletRequest객체의 getParameterValues()메소드를 호출하여 매개변수로 <input>태그의 name값을 넣어준다.
		String[] subject = request.getParameterValues("subject");//String 배열 반환해주는 메소드이다..
		
		
		
		
		//3. 요청한 값 확인을 위해 이클립스 콘솔탭에 출력하기
		System.out.println("입력하여 요청한 아이디 : "+user_id);
		System.out.println("입력하여 요청한 비밀번호 : "+user_pw);
		
		
		//향상된 for반복문을 이용해 subject배열에 저장된 체크된 모든 값들을 얻어 반복해서 출력
		for(String str : subject) {
			
			System.out.println("체크된 과목 : " + str);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
