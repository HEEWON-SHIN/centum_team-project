<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 기능을 처리하는 fileDownloadAction.jsp서버페이지</title>
</head>
<body>
	<%
		/*1.한글처리*/
		request.setCharacterEncoding("utf-8");
	
		/*2. 파일 다운로드 요청시, 즉 fileDownloadList.jsp페이지에서 다운로드할 실제 파일명이 적힌 <a>태그를 클릭했을 때...
			 전달받는 값(쿼리스트링에 담겨있음) 얻기*/
		String fileRealName = request.getParameter("file");//서버에 저장돼있는 다운로드할 실제 파일명 얻기
		
		String fileDir = request.getParameter("directory");//다운로드할 파일이 서버에 저장된 폴더 이름 얻기
		
		//위 폴더명 upload를 이용해 실제 서버에 저장된, 다운로드 할 파일의 폴더 경로 얻기
		String directory = application.getRealPath(fileDir);//C:\02Workspace\MustHaveJSP\WebContent	\      upload
		 
		/*3. 물리적 파일에 접근해서 삭제, 이름 변경 등 조작할 수 있는 java.io패키지의 File클래스 객체 생성*/
		//File file = new File(파일이 저장된 경로 + 다운로드할 파일명);
		File file = new File(directory+ "/"+fileRealName);
		 
		
		/*4. 클라이언트의 웹브라우저로 응답할 데이터를 파일데이터로 설정하기 위해 작성*/
		//mimetype : 클라이언트의 웹브라우저로 응답할 데이터의 타입
		String mimeType = getServletContext().getMimeType(file.toString());//바이너리 데이터를 파일데이터로 변형
		//System.out.print(mimeType);
		//파일 다운로드할 때는,,
	    //바이너리데이터 ---> 파일데이터 ---> 바이너리 데이터(다운로드완료)
	    //            요청          응답
		
		
		if(mimeType == null){//허용하는 MIME 타입 목록에 포함되는지 확인,,허용되지 않는다면?	 or 다운로드가 완료됐다면..?
			//이진데이터 형식의 파일 관련 데이터를 웹브라우저에 전달(응답)하기 위해
			//응답할 데이터의 유형(mimeType)을 octet-stream유형으로 설정
			response.setContentType("application/octet-stream");//파일데이터를 바이너리 데이터로 바꿔주는 구문
			//옥텟 스트림은 이름에서처럼 8비트 단위의 바이너리 데이터를 의미합니다.
			
			
		}
		
		
		/*5. 한글파일 다운로드시 한글 깨짐 현상을 피하기 위해서 웹브라우저 별로 각각 다른 대응이 필요하다.*/
		//	먼저 웹브라우저를 분류하기 위해서는 다음과 같은 로직을 필요로 한다.
		
		//웹브라우저 종류별로 다운로드시킬 파일명에 대한 인코딩을 설정 해주고 다시 저장할 파일명 변수 선언
		String downloadName = null;
		
		//사용자가 어떤 웹브라우저를 사용해서 다운로드 요청하는지 웹브라우저 정보(종류) 얻기
		String header = request.getHeader("User-Agent");//어떤 웹브라우저를 사용했는지 얻어서 변수에 저장(header는 요청에 대한 정보를 말한다.)
		//크롬, 인터넷익스플로어, 파이어폭스 등등
		
		
		if(header.contains("MSIE") || header.contains("Trident")){//인터넷익스플로어(MSIE, Trident)웹브라우저를 사용하는 사용자라면?
				//익스플로어 11버전 이하		Trident : 익스플로어 11버전 이상
				
				//다운로드시킬 파일명을 UTF-8로 변경하여 웹브라우저로 전달하게 되면
				//다운로드시킬 한글 파일명이 깨지지 않고 웹브라우저로 전달되어 다운로드되게 된다.
				//인터넷익스플로어일 경우 다운로드될 파일명에 공백이 '+'기호로 처리되는 것을(인코딩 된것을) 
				//다시  수정한다.(공백 "%20"으로 바꿔준다)
				//URLEncoder.encode를 하면 공백부분에 +가 생긴다. 그래서 replaceAll로 +를 공백 인코딩문자(%20) 으로 바꿔준다. replaceAll을 안하면 공백에 +가 보일것이다.
				downloadName = URLEncoder.encode(fileRealName, "utf-8").replaceAll("\\+", "%20");
																		
			
		}else{//인터넷 익스플로어 웹브라우저를 제외한 다른 웹브라우저를 사용해서 다운로드 한다면?
			
			/*다운로드 될 파일 이름을 설정*/
			downloadName = new String(fileRealName.getBytes("utf-8"), "8859_1");
			//	=> 다운로드시킬 파일 이름(문자열)을 전세계 거의 모든 문자를 포함한 체계(UTF-8)의 데이터를 사용하기 위해서
			//		문자열들을(바나나.jpg) 바이트 크기의 데이터들로 모두 변환 하여 새로운 byte[]배열에 저장해 byte[]배열 자체를 반환해 온다.
			//		요약 : 다운로드시킬 파일명을 인코딩방식 utf-8로 설정,,fileRealName.getBytes("utf-8")
			//	=> 그 후에 다운로드할 파일명 문자열은 바이트 데이터로 변환되어 byte[]저장되는데,
			//		byte[]배열에 저장된 다운로드할 파일명을 다시 웹브라우저로 전달하여 다운로드 시킬 때,
			//		웹브라우저가 인식할 수 있도록 다시 8859_1 체계로 변형 후 다운로드할 파일명을 변수에 저장킨다.
			
			
			/* 참고
				
				컴퓨터는 문자를 사람이 보듯이 컴퓨터에 저장하는게 아니라 이진수로 변환 후 비트 단위로 저장한다.
				이것을 사람이 읽을 수 있도록 문자로 표현 및 저장하는 규칙이 필요한데
				이 규칙을 characterSet(문자처리 방식, 인코딩방식)이라고 한다.
				한국인끼리 쓰는 시스템 체계는 EUC-KR characterSet으로 문자를 사용하면 되지만
				외국인에게도 서비스를 하려면 더 많은 전세계 문자를 지원해야하기 때문에 UTF-8 characterSet체계를 사용해준다.
				
			*/
		
		
		}//if문 끝
		
		
		/*6. 웹브라우저로 응답할 데이터(다운로드시킬 파일)을 response객체의 헤더영역에 설정*/
			//6-1. 다운로드시킬 파일명 설정
			//6-2. Content-Disposition속성을 명시하여 브라우저로 전송(응답)된 파일을 디스크에 직접 다운로드 받을 것인지
			//	   혹은 브라우저로 바로 보여줄 것인지 설정할 수 있다.(저장경로 지정하는 등 저장여부 메시지창 띄울건지 아니면 웹브라우저에 출력해서 바로 보여줄건지 설정)
			//	   Content-Disposition : inline <- 브라우저에 응답을 받으면 브라우저에서 바로 보여준다.
			//	   Content-Disposition : attachment <- 브라우저에 응답을 받으면 다운로드 창(메시지 창)이 뜬다.
		response.setHeader( "Content-Disposition", "attachment;filename=\"" + downloadName + "\";" );
											//attachment;filename=\다운할파일명\;
											//NOW: "Content-Disposition"=>"attachment;filename=\"Name of your file.pdf\""
			 
		/*7. 다운로드할 파일에서 데이터를 읽어와 버퍼공간에 저장하고 버퍼공간에 저장된 데이터를 브라우저로 출력할 스트림 통로 객체들을 생성*/
			
		//다운로드할 파일을 바이트 단위로 읽어들일 스트림 통로 생성
		FileInputStream fileIS =  new FileInputStream(file);

		//읽어들인 다운로드할 파일의 데이터를 new FileInputStream(file);통로에서 꺼내서
		//바이트 단위로 웹브라우저에 출력(응답, 즉 다운로드)할 출력 스트림 통로 생성
		ServletOutputStream servletOS = response.getOutputStream();
		
		
		/*
			inputStream으로 읽어들인 데이터를 임시 저장공간인 buffer공간에 저장 후에 outputStream으로 내보낸다,,	
		
			일반적으로 화면은 JSP에 구현하고 기능은 JAVA파일로 구현한다.
			하지만 종종 JSP페이지에 자바코드를 입력하여 구현하는 경우가 있다.
			만약 이 때 다운로드 로직을 구현한다면 주의해야할 점이 있다.
			
			클라이언트의 웹브라우저에 write를 하기 전에 아래의 로직 2줄을 추가해줘야 하는데,
			이유는 JSP페이지에서 다른 jsp페이지를 호출해서 다운로드 로직을 실행하는 경우
			이미 out버퍼공간이 열려있는 상태가 된다.
			그러므로 out버퍼 공간을 사용하기 전에 버퍼공간을 한 번 비워주고 깔끔하게 웹브라우저로 전송해야한다.
			out.clear(); 메소드를 호출하면 버퍼 공간의 데이터들을 깔끔하게 비워준다.
			그렇게 하면 버퍼공간이 비워지고, 버포 공간을 지나갈 탈 것이 필요해진다.
			out = pageContext.pushBody(); <-jsp페이지에 대한 정보를 저장하는 기능을 한다.
			여기서 말하는 jsp페이지에 대한 정보는 다운로드할 파일의 정보를 의미한다.(파일명 등)
			따라서 밑의 두 줄로 페이지의 정보를 보내는 부분의 버퍼 공간을 초기화 하는 작업을 한다고 생각하면 된다.
		
		*/
		out.clear();
		out = pageContext.pushBody();
		
		
		/*8. 파일 입출력 부분(파일의 내용을 읽어서 웹브라우저로 내보내서 다운로드 시키기)*/
			// => 다운로드할 파일에서 데이터를 1MB단위(1048576byte)로 읽어와 저장할 byte[]배열 생성
			byte[] b = new byte[1048576];
			
			while(true){//무한반복
				
				//다운로드할 파일의 내용을 약 1MB단위로 한번~ 읽어와 변수에 저장
				int count = fileIS.read(b);//읽어들인 byte 갯수를 반환해줌,,못 읽어들이면 -1을 반환
				
				if(count == -1){//다운로드할 파일에 더 이상 읽어들일 데이터가 없다면?
					
					break;//더 이상 읽어들이지 않고 while문 빠져나감
				}
				
				//다운로드할 파일에서 한번씩 읽어들인 데이터가 있으면
				//한번씩 읽어들인 1048576byte(1MB)전체를 출력스트림을 통해 웹브라우저의 아웃 내장객체(버퍼공간),,출력스트림 통로를 통해
				//웹브라우저로 응답(다운로드시키기 위해 보낸다.)
				servletOS.write(b, 0, count);//배열, 처음으로 읽어들일 데이터의 인덱스 번호, 마지막으로 읽어들일 데이터의 인덱스 번호 
				
			}
			
			
			//웹브라우저로 다운로드된 파일에 관하여 DB fileInfo테이블의 다운로드 횟수 1 증가 시키기
			int result = new FileDAO().hit(fileRealName);//반환값 받아서 다운로드 성공시 db에 업데이트가 제대로 됐는지 여부를 나타낼 수 있다.
			
			//출력 스트림 통로에 다운로드 시킬 파일에서 읽어들인 데이터가 남아있다면 
			//완전히 웹브라우저로 내보내기 전에 out퍼버공간으로 내보내기
			servletOS.flush();
			
			//자원해제(스트림 통로 자원해제)
			servletOS.close();
			fileIS.close();
	
	%>

		
	
</body>
</html>