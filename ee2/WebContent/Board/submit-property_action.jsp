<%@page import="board.boardDTO"%>
<%@page import="board.boardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//업로드한 파일이 업로드될 경로 설정
		String directory = application.getRealPath("/upload/");//웹프로젝트의 upload폴더로 바로 가게 설정
	
		//한번에 업로드할 수 있는 파일의 최대 사이즈 지정 1GB(1024MB)
		int maxSize = 1024 * 1024 *1024;
		
		//실제 파일업로드 담당하는 클래스는? cos.jar압축파일 내부에 존재하는 MultipartRequest클래스.
		MultipartRequest multipartRequest;
		
		multipartRequest = new MultipartRequest(request, directory, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		
		/*DB에 업로드하기 위한 작업 시작,,파일명들을 변수에 저장해줌***************************************************************************/				
		
		boardDTO bDto = new boardDTO();
		
		bDto.setPicture1(multipartRequest.getOriginalFileName("picture1"));
		bDto.setPic1(multipartRequest.getFilesystemName("picture1"));
		
		bDto.setPicture2(multipartRequest.getOriginalFileName("picture1"));
		bDto.setPic2(multipartRequest.getFilesystemName("picture1"));
		
		bDto.setPicture3(multipartRequest.getOriginalFileName("picture1"));
		bDto.setPic3(multipartRequest.getFilesystemName("picture1"));
		
		bDto.setPicture4(multipartRequest.getOriginalFileName("picture1"));
		bDto.setPic4(multipartRequest.getFilesystemName("picture1"));
		
		
		for(int i=1; i<=4; i++){
			
			if(multipartRequest.getParameter("picture" + i) != null)//사진 업로드를 했을 때만?
			
				bDto.setPicture1(multipartRequest.getOriginalFileName("picture" + i));
				bDto.setPic1(multipartRequest.getFilesystemName("picture" + i));
			
		}
		
		
		if(multipartRequest.getParameter("video") != null){
		
		bDto.setVideo(multipartRequest.getOriginalFileName("video"));
		bDto.setVideo_real(multipartRequest.getFilesystemName("video"));
		}
		
		new boardDAO.upload(boardDTO bDto); 
		
	%>
</body>
</html>