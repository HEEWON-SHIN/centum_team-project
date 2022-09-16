<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 여러개의 파일을 업로드 할 수 있도록 여러개의 <input type="file">태그를 만들 때
		 클라이언트가 원하는 갯수만큼 다중 파일 업로드가 가능하도록 화면 및 업로드 처리를 해보자 -->
		 
		 
	<h2>다중 파일 업로드</h2>	 
	
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");

	%>
	
	<%!//변수 또는 메소드를 선언해놓는 공간
		
	
		//1번 form태그 내부에 만들어져 있는 <input>태그 내부 value속성에 넣어줄(호출할) 메소드 만들기
		public String getParam(HttpServletRequest request, String param){
		
		if(request.getParameter(param) != null){//입력한 값이 있다면?
			
			return request.getParameter(param);
		
		}else{//입력한 값이 없으니 ""빈 공백을 리턴
			return "";
		}
	
	}
	
	%>
	
	
	<%-- <form태그 1번> : 클라이언트가 원하는 갯수를 입력하면 입력값을 mutiUpload.jsp서버페이지를 요청하는 태그 --%>
	<form action="multiUpload.jsp">
		이름 : <input type="text" name="name" value='<%=getParam(request, "name")%>'> <br><!-- 따옴표 안쪽부분에서 큰따옴표를 썼으면 바깥은 단일따옴표 써야됨 -->
		주소 : <input type="text" name="addr" value='<%=getParam(request, "addr")%>'> <br>
		하고싶은 말 : <br>
		<textarea rows="3" cols="70" name="note" ><%=getParam(request, "note")%></textarea><br>
		원하는 파일 업로드 갯수 : <input type="text" name="add" size="2">
		<input type="submit" value="확인">
	</form>
		 
		 
	<%
	
		//입력한 파일 업로드 수를 저장할 변수
		int filecnt = 0;//스크립틀릿 기호 안에 선언한 변수는 multiUpload_jsp.java파일에서는 지역변수로 저장됨
	
		
		if(request.getParameter("add") != null){//1번 form태그 내부에 원하는 파일 업로드 갯수 입력했다면?
			
			//반복해서 생성한 <input>태그를 만들기 위해 저장
			filecnt = Integer.parseInt(request.getParameter("add"));
			
		}
	
	%>	 
	
		 
	<%-- <form태그 2번> : <form태그 1번>에서 입력받은 파일업로드수(filecnt)를 받아서 아래 for문에 그 수만큼 <input type="file">인 태그를
						 생성하여 2번 form태그를 이용하여 다중 파일 업로드 요청을 하기 위해 multiUpload_pro.jsp페이지를 요청 --%> 
	<form action="multiUpload_pro.jsp" method="post" enctype="multipart/form-data"><!-- 파일 업로드할 때는 method속성과 enctype 반드시 이렇게 줘야함 -->
	
		<%
			for(int i=0; i<filecnt; i++){
		%>		
			
			
			<%=i+1%>번째 파일 선택 : <input type="file" name="upFile<%=i%>" ><br>
			
				
		<%		
			}
		
		%>
		
		<input type="hidden" name="name"  value='<%=getParam(request, "name")%>'><%--태그가 눈에는 안 보이고 값(value)만 전달하기 위해 hidden속성 처리 --%>
		<input type="hidden" name="addr" value='<%=getParam(request, "addr")%>'>
		<input type="hidden" name="note" value='<%=getParam(request, "note")%>'>
		
		<input type="button" value="다중파일 업로드" onclick="check(this.form)">
	
	</form>
		 
		 
	<script type="text/javascript">
	
		function check(f) {//다중파일 업로드 버튼 누르면 호출될 함수,,유효성 체크하는 역할

			//2번 form태그를 선택해서 form태그 내부에 만들어져 있는 모든 <input>의 갯수를 구하기
			//참고!
			//forms[]배열 : <form>을 선택해서 저장해두는 곳
			//elements 배열: <form>태그 내부에 있는 모든 <input>태그들을 선택한다.
			//length : 배열의 크기, 즉 배열에 저장된 요소들의 갯수를 알 수 있다.
			//var cnt = document.forms[1].elements.length;
			
			//var inputArray = f.elements; -> 변수 설정해서 f.elements[i]자리에 inputArray[i]로도 가능!

			var cnt = f.elements.length;
			
			//누락된 파일 업로드 위치를 나타내는 변수
			var filecnt = 1;
			
			for(var i=0; i<cnt; i++){//2번 form태그 내부에 있는 모든 <input>태그의 갯수만큼 반복
				
				if(f.elements[i].type == "file"){//<input>태그의 type="file"인 <input>이면?
					
					if(f.elements[i].value == ""){//업로드할 파일을 선택하지 않았다면?(value속성값이 없다면?)
						
						var msg = filecnt + "번째 업로드할 파일을 선택하지 않았습니다."; 
							
						alert(msg);	//경고메시지 출력
						
						f.elements[i].focus();//선택하지 않은 <input>에 포커스 주기,,크롬은 포커스 안됨
						
						return;//for반복문 벗어나서 check 함수 빠져나감 => submit이 안됨
							
					}//안쪽 if문
					
					filecnt++;//<input>태그의 type="file"일 때만 filecnt값 증가
					
				}//바깥if문
				
			}//for문
			
			f.submit();//2번 <form>태그 전송
			
		}//check함수 끝
	
	</script>		 
		 
		 
		 
</body>
</html>