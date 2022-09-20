package singleProduct;

public class singleBean {

	private int pdNum;
	private String pdName;
	private int pdPrice;
	private String pdImg_Main;
	private String pdImg_Sub;
	private String pdInfo;
	private String pdCategory;

	
	public singleBean() {
		
	}


	public singleBean(int pdNum, String pdName, int pdPrice, String pdImg_Main) {
		
		this.pdNum = pdNum;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.pdImg_Main = pdImg_Main;
		
	}


	public singleBean(int pdNum, String pdName, int pdPrice, String pdImg_Main, String pdImg_Sub, String pdInfo,
			String pdCategory) {
		
		this.pdNum = pdNum;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.pdImg_Main = pdImg_Main;
		this.pdImg_Sub = pdImg_Sub;
		this.pdInfo = pdInfo;
		this.pdCategory = pdCategory;
	}


	public int getPdNum() {
		return pdNum;
	}


	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}


	public String getPdName() {
		return pdName;
	}


	public void setPdName(String pdName) {
		this.pdName = pdName;
	}


	public int getPdPrice() {
		return pdPrice;
	}


	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}


	public String getpdImg_Main() {
		return pdImg_Main;
	}


	public void setpdImg_Main(String pdImg_Main) {
		this.pdImg_Main = pdImg_Main;
	}


	public String getPdImg_Sub() {
		return pdImg_Sub;
	}


	public void setPdImg_Sub(String pdImg_Sub) {
		this.pdImg_Sub = pdImg_Sub;
	}


	public String getpdInfo() {
		return pdInfo;
	}


	public void setpdInfo(String pdInfo) {
		this.pdInfo = pdInfo;
	}


	public String getpdCategory() {
		return pdCategory;
	}


	public void setpdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}





	
	
	
}
