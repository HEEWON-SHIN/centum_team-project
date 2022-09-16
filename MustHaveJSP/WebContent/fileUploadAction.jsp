<%@page import="file.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드를 처리하는 서버페이지 fileUploadAction.jsp</title>
</head>
<body>

	<%
		/***서버에 업로드 시작*****************************************************************************************************/
		//application내장객체는 전체 프로젝트에 대한 자원을 관리하는 객체이다.
		//서버(톰캣)의 실제 프로젝트 경로에서 자원을 찾을 때 가장 많이 사용한다.
		
		//파일을 업로드할 실제 서버경로 얻기
		//String directory = application.getRealPath("/");
	
		//out.print(directory);//C:\02Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MustHaveJSP\
								// => 복사된 톰캣서버(tmp0) 속의 프로젝트명까지 경로가 나타남
		
		String directory = application.getRealPath("/upload/");	//서버 설정해주면 meta폴더로 안 가고 바로 프로젝트 속 upload폴더에 업로드됨. 				
		//out.print(directory);//C:\02Workspace\MustHaveJSP\WebContent\   upload\
	
		
		//한번에 업로드할 수 있는 파일의 최대 사이즈 지정 1GB(1024MB)
		int maxSize = 1024 * 1024 *1024;//1024바이트 * 1024바이트 * 1024메가바이트 = 1GB
		
		//참고 : MultipartRequest클래스에 대한 객체 생성시..
		//		생성자로 업로드할 정보를 전달해 저장시키면
		//		자동으로 우리가 지정한 경로에 파일을 업로드시킬 수 있다.
		
		//실제 파일업로드 담당하는 클래스는? cos.jar압축파일 내부에 존재하는 MultipartRequest클래스.
		MultipartRequest multipartRequest;
	
		
		
													/*객체 생성시 생성자로 전달할 데이터들*/ 
		multipartRequest = new MultipartRequest( request, //1. fileUpload.jsp의 form태그에 의해서 전달받은 업로드할 파일의 정보를 가지고 있는 request내장객체
												 directory, //2. 업로드할 파일의 실제 서버 폴더 경로 (directory,,\   upload\폴더 경로)
												 maxSize, //3. 한번에 업로드할 수 있는 파일의 최대 사이즈 지정,,maxSize
												 "utf-8", //4. 업로드하는 파일 이름이 한글이 경우 깨져서 업로드되므로 인코딩 방식을 UTF-8로 설정하기 위해 전달
												 new DefaultFileRenamePolicy()//5. 업로드되는 실제 서버폴더 경로에 똑같은 이름의 파일을 업로드하면..
																			  //	파일명 끝에 자동으로 1을 붙여서 파일을 만들어주는 역할을 하는 객체 생성 
											);
	
						
		/*DB에 업로드하기 위한 작업 시작,,파일명들을 변수에 저장해줌***************************************************************************/											
													
		//서버경로에 업로드할 파일의 업로드하기 전의 원본 파일명 얻기
		String filename = multipartRequest.getOriginalFileName("file");//<input>태그의 name값 적어줌
		
		//서버경로에 업로드돼서 올라가 있는 실제 파일명 얻기
		String fileRealname = multipartRequest.getFilesystemName("file");
	
		out.write("업로드한 원본 파일명 : " + filename + "<br>");
		out.write("업로드된 실제 파일명 : " + fileRealname + "<br>");
		
		//DB에 INSERT
		//	=> 업로드할 파일의 원본 파일명과 업로드된 실제 파일명을 DB의 fileinfo테이블에 INSERT해줌
		new FileDAO().upload(filename, fileRealname);//성공하면 1반환, 실패하면 -1반환받음
		
		
		
		
	%>


</body>
</html>