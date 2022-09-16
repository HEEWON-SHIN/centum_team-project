package t_member;

import java.sql.Date;

/*DTO역할을 하는 클래스*/
//T_MEMBER테이블의 열이름과 자료형을 참고하여 변수 선언을 하고
//변수 하나당 getter, setter메소드를 각각 만들어주자.
//또한 필요로 하는 생성자가 있다면 만들어주자
public class MemberBean {
	
	/*T_MEMBER테이블의 열이름과 동일하게 변수이름, 자료형을 선언하자*/
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date joinDate;
	
	
	/*기본생성자*/
	public MemberBean() {}

	/*객체 생성시 위 id, pwd, name, email 인스턴스 변수의 값을 초기화할 생성자*/
	public MemberBean(String id, String pwd, String name, String email) {

		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}

	
	
	/*객체 생성시 위 id, pwd, name, email, joinDate 인스턴스 변수의 값을 초기화할 생성자*/
	public MemberBean(String id, String pwd, String name, String email, Date joinDate) {

		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}
	
	
	
	
	/*getter, setter메소드들*/
	
	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
	
	
}
