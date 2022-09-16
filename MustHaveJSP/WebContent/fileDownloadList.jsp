<%@page import="java.net.URLEncoder"%>
<%@page import="file.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="file.FileDAO"%>
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
		/*********************파일 목록을 보여주는 페이지*************************/
	
		//참고 : 클라이언트가 fileUpload.jsp페이지에서 
		//<a>태그의 링크를 클릭하여 fileDownloadList.jsp페이지를 요청하면
		//요청한 주소 중에서 톰캣이 웹프로젝트까지 찾아갈 수 있게 작성된 컨텍스트 주소를 얻을 수 있다.
		String contextPath = request.getContextPath();///MustHaveJSP
		
		//DB의 fileinfo테이블에 저장된 실제 다운로드할 파일명(fileRealname) 검색해서 얻기
		ArrayList<FileDTO> fileList  = new FileDAO().allSelect();
		
		
		//위 ArrayList배열에 각 index위치에 저장된 FileDTO객체의 갯수만큼 반복해서 
		//ArrayList배열에서 FileDTO객체를 하나씩 꺼내와서 정보를 출력!
		for(FileDTO dto : fileList){
		
		//다운로드할 파일의 원본이름(업로드 당시 선택했던 파일의 원본이름) 얻기
		String fileName = dto.getFilename();
		
		//다운로드할 파일의 실제 이름 얻기
		String fileRealName = dto.getFileRealname();
		
		//다운로드한 횟수 얻기
		int downloadCount = dto.getDownloadCount();
		
		
		/*파일목록 출력*///파일 이름을 주소창에 띄우면서 한글이 깨질 수 있기 때문에 인코딩해줌.
		out.print("<a href='" + contextPath + "/fileDownloadAction.jsp?directory=upload&file=" + URLEncoder.encode(fileRealName, "utf-8") + "'>" +
		///MustHaveJSP/fileDownloadAction.jsp?=upload&file=fileRealName
		fileRealName + " (다운로드 횟수 : " + downloadCount + ") </a><br>");
		//위의 <a>태그 링크 클릭시.. fileDownloadAction.jsp페이지로 다운로드 요청한다.
		//요청시 전달값(parameter)은 다운로드할 파일이 실제 저장되어 있는 실제 폴더의 경로명을 전달하고, 
		//다운로드할 파일명을 전달한다.
		
		
		
		
		 
		}//for문 끝
		
		
	
	
	
	
	%>
</body>
</html>