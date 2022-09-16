package file;

public class FileDTO {

	
	private String filename;		/*업로드한 파일의 원본명*/
	private String fileRealname;	/*실제 업로드된 파일이름*/
	private int downloadCount;		/*파일을 다운로드한 횟수 저장*/
	
	
	/*기본 생성자 : 아무런 일도 하지 않음*/
	public FileDTO() {
		
	}

	
	
	/*FileDTO객체 생성시 위 filename, fileRealname, downloadCount 인스턴스 변수의 값을 추가시킬 생성자 */
	public FileDTO(String filename, String fileRealname, int downloadCount) {
		//super(); <- 생략 가능
		this.filename = filename;
		this.fileRealname = fileRealname;
		this.downloadCount = downloadCount;
	}



	/*getter, setter메소드 생성*/
	
	public String getFilename() {
		return filename;
	}



	public String getFileRealname() {
		return fileRealname;
	}



	public int getDownloadCount() {
		return downloadCount;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public void setFileRealname(String fileRealname) {
		this.fileRealname = fileRealname;
	}



	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	
	
	
	
	
	
	
	
	
	
	
}
