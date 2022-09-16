package sec01.ex01;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/*
	HttpServeletRequest클래스의 getParameterNames()메소드의 역할
	
		- <form>태그 내부에서 전송되어 오는 데이터들은 모두 <input>태그에 의해 입력 받는다.
			서블릿으로 전송되는 데이터가 많은 경우 <input>태그들의 name속성값들을 일일이 기억할 필요 없이
			getParameterNames()메소드를 호출하면 요청한 값들에 대한 <input>태그들의 name속성값들을 
			모두!!!!! Enumeration배열에 담아 반환 받는다.

*/



/*input.html페이지 화면에서 이름, 비번, 체크박스 과목들을 체크해서 전송버튼을 눌렀을 때 요청 받는 서블릿 페이지*/

@WebServlet("/input2")//맵핑 이름을 톰캣에게 알려주기 위한 어노테이션 기호 @WebServlet
					//서블릿을 요청할 매핑 이름은 <form>태그의 action속성값과 동일해야 한다



public class InputServlet2 extends HttpServlet {
	


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet메소드 호출됨");
		
		//1. 클라이언트가 요청한 데이터들(입력한 아이디, 비번)은 모두 매개변수로 전달받아 HttpServletRequest객체 메모리에 저장되고,
		// 	 전달받은 데이터들 중에 한글이 하나라도 존재 할 경우 꺼내올 때 한글이 깨질 수 있기 때문에 
		//   그걸 방지하기 위해 인코딩방식을 utf-8로 하자
		//	 요약 : 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		//input2.html에서 입력을 받은 <input>태그들의 name속성값들을 얻기 위해
		//HttpServletRequest객체의 getParameterNames()메소드를 호출함
		//getParameterNames()메소드 : Enumeration부모인터페이스의 자식 배열 공간에
		//							 <form>태그 내부에 있는 요청한 모든 HTML태그들에 대한 name속성값들을 저장한 후
		//							 자식배열 자체를 반환해준다.
		Enumeration enu = request.getParameterNames();
		
		
		while(enu.hasMoreElements()) {//배열에 name속성갑들이 저장돼 있는 동안 반복
			
			//<form>태그 내부의 모든 HTML태그의 name속성값들은 위 배열에 저장돼있다.
			//그러므로 배열의 0번째 인덱스 위치에 저장된 name속성값부터 차례대로 꺼내와서 사용해야함.
			Object obj = enu.nextElement();//object타입으로 반환,, name속성값들은 String인데 Object타입이 된다(업캐스팅)
			
			String name = (String)obj;//다운캐스팅
			//name변수에는 user_id, user_pw, subject가 반복해서 저장됨
			
			
			//위의 name변수에 저장된 <input>태그의 name속성값들을 
			//getParameterValues메소드의 매개변수로 전달해
			//입력한 데이터들과, 체크된 데이터들을 모두 배열에 담아 반환 받는다.
			String[] values = request.getParameterValues(name);
			
			
			for(String value : values) {
				
				System.out.println("name속성값 = "+name + ", value속성값 = "+value);
				
			}//for문 끝
			
		}//while반복문 끝
		
		
		
		
	}

}
