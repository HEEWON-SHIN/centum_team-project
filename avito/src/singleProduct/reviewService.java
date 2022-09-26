package singleProduct;

import java.util.ArrayList;
import java.util.List;

public class reviewService {

	reviewDao rDao;
	
	
	public reviewService() {
		rDao = new reviewDao();
	}
	
	
	/*리뷰 보여주기*/
	public List<reviewBean> show(int os, int pdNum) {
		
		return rDao.show(os, pdNum);
		
		
	}

	/*전체 부모글의 갯수 조회*/
	public int countReviews(int pdNum) {
		
		return rDao.count(pdNum); 
	}


	public List<reviewBean> reply(int pdNum, List rList) {
	
		return rDao.reply(pdNum, rList);
	}

}
