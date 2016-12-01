package com.mycompany.teamapp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.CouponDao;
import com.mycompany.teamapp.dto.Coupon;
import com.mycompany.teamapp.dto.CouponBox;
import com.mycompany.teamapp.dto.Reservation;

@Component
public class CouponService {
	public static final int ADD_SUCCESS = 0;
	public static final int ADD_FAIL =1;
	
	public static final int SEND_SUCCESS = 0;
	public static final int SEND_FAIL = 1;
	
	public static final int DELETE_SUCCESS = 0;
	public static final int DELETE_FAIL = 1;
	
	public static final int COUPON_SUCCESS = 0;
	public static final int COUPON_FAIL = 1;						// 쿠폰 조회 안됨
	public static final int COUPON_EXPIRE_DATE = 2;
	
	
	@Autowired
	private CouponDao couponDao;
	
	
	public int add(Coupon coupon) {
		int row=couponDao.insert(coupon);
		if(row==0)
		{
			return ADD_FAIL;
		}
		return ADD_SUCCESS;
	}
	
	
	public int send(CouponBox couponBox) {	
		int row=couponDao.send(couponBox);
		if(row==0)
		{
			return SEND_FAIL;
		}
		return SEND_SUCCESS;
	}
	
	public int delete(int cnumber) {
		int row = couponDao.delete(cnumber);
		if(row==0)
		{
			return DELETE_FAIL;
		}
		return DELETE_SUCCESS;
	}
	
	public Coupon info(int cnumber) {
		Coupon coupon = couponDao.selectById(cnumber);
		return coupon;
	}

	public boolean check(int ranNum) {
		boolean chkNum = couponDao.chkNum(ranNum);
		if(chkNum==false)
		{
			return false;
		}
		return true;	
	}

	public List<CouponBox> list(String mid,int pageNo, int rowsPerPage){
		return couponDao.selectByPage(mid,pageNo, rowsPerPage);
	}

	public int getCount() {
		return couponDao.count();
	}
	
	public int getResCouponCount(int cresid) {
		return couponDao.resCount(cresid);
	}
	
	public int checkCoupon(String cbmid, int cbnumber) {		
		Coupon coupon = couponDao.checkCoupon(cbmid, cbnumber);		
		Date now = new Date();
		
		if (coupon == null) {
			return COUPON_FAIL;
		} else if (now.after(coupon.getCdday())) {		// 쿠폰 유효기간 확인
			return COUPON_EXPIRE_DATE;				
		} 	
		return coupon.getCdiscount();
	}

	public List<Coupon> resCouponList(int cresid, int pageNo, int rowsPerPage) {
		List<Coupon> resCouponList = couponDao.resCouponList(cresid, pageNo, rowsPerPage);
		return resCouponList;
	}

}
