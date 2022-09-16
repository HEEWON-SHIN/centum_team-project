package member;
import java.sql.Date;
/*
	
<자바빈 클래스 2가지>★★★★★
	
	1. DTO 클래스
		- 데이터를 교환하기 위해 생성하는 객체이다.
		  별다른 로직 없이 속성(멤버변수)과 그 속성(멤버변수)에 접근하기 위한
		  get으로 시작하는 getter메소드와 set으로 시작하는 setter메소드만 갖춘 클래스이다.
		  그래서 값 객체 Value Object(VO)라고도 한다.
		
		- 구성
			멤버변수
			
			생성자
			
			getter메소드
			
			setter메소드
	
	
	
	2. DAO 클래스
		- 데이터베이스의 데이터에 접근하기 위한 객체(클래스)이다.
		  보통 JDBC를 통해 구현하며, 하나의 테이블에서 수행할 수 있는 CRUD를 전담한다.
		  	CRUD란?
		  		Create(생성), Read(읽기,, SELECT), Update(갱신), Delete(삭제) 작업을 의미한다.	
	
*/


public class MemberDTO {//가입할 회원 또는 조회한 한 사람의 회원정보를 저장시킬 클래스

	
	/*멤버변수 선언*/
	private String id;  
	private String pass;
	private String name;
	private java.sql.Date regidate;       
	private String email;
	private String address;
	private String tel;
	private String hp;
	
	
	
	/*생성자*/
	public MemberDTO() {
		
	}



	public MemberDTO(String id, String pass, String name, Date regidate, String email, String address, String tel,
			String hp) {
		
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
		this.email = email;
		this.address = address;
		this.tel = tel;
		this.hp = hp;
	}


	
	/*멤버변수 하나당 getter, setter메소드 선언*/
	
	public String getId() {
		return id;
	}



	public String getPass() {
		return pass;
	}



	public String getName() {
		return name;
	}



	public java.sql.Date getRegidate() {
		return regidate;
	}



	public String getEmail() {
		return email;
	}



	public String getAddress() {
		return address;
	}



	public String getTel() {
		return tel;
	}



	public String getHp() {
		return hp;
	}



	public void setId(String id) {
		this.id = id;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}



	public void setName(String name) {
		this.name = name;
	}



	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public void setHp(String hp) {
		this.hp = hp;
	}
	
	
	
	
	
	
	
	
	
	
}
