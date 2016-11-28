package com.mycompany.teamapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.teamapp.dao.PosDao;
import com.mycompany.teamapp.dto.Pos;
import com.mycompany.teamapp.dto.Reservation;

@Component
public class PosService {
	
	public static final int ADD_SUCCESS = 0;
	public static final int ADD_FAIL =1;
	
	public static final int MODIFY_SUCCESS=0;
	public static final int MODIFY_FAIL=1;
	
	public static final int DELETE_SUCCESS = 0;
	public static final int DELETE_FAIL = 1;
	
	public static final int COUPON_SUCCESS = 0;
	public static final int COUPON_FAIL = 1;						// 쿠폰 조회 안됨
	public static final int COUPON_EXPIRE_DATE = 2;
	
	@Autowired
	private PosDao posDao;

	public void add(Pos pos) { 
		String[] arrMenu = pos.getTempmenu();			// 주문 메뉴
		int[] arrCount = pos.getTempcount();				// 수량 배열
				
		for (int i = 0; i < arrMenu.length; i++) {
			pos.setPmlname(arrMenu[i]);
			pos.setPcount(arrCount[i]);
			
			Pos dbPos = posDao.selectInfo(pos.getPresid(), pos.getPtableno(), pos.getPmlname());
			if(dbPos == null) {
				posDao.insert(pos);	
			} else {
				dbPos.setPcount(pos.getPcount());
				posDao.update(dbPos);
			}
		}
	}

	public int modify(Pos pos) {
		int row = posDao.update(pos);
		if(row == 0){
			return MODIFY_FAIL;
		}
		return MODIFY_SUCCESS;
	}
	
	public int delete(int presid, int ptableno) {
		int row = posDao.delete(presid, ptableno);
		if(row == 0){
			return DELETE_FAIL;
		}
		return DELETE_SUCCESS;
	}
	
	public List<Pos> info(int presid, int ptableno) {
		List<Pos> list = posDao.selectInfo(presid, ptableno);
		return list;
	}
	
	public List<Pos> info(int presid) {
		List<Pos> list = posDao.selectInfo(presid);
		return list;
	}

	public List<Integer> calcSum(int presid, int ptableno) {		
		List<Integer> list = posDao.calc(presid, ptableno);
		return list;
	}

/*	public List<MenuList> menuList(int presid) {
		List<MenuList> menuList = posDao.selectMenu(presid);
		return menuList;
	}*/

/*	public List<Reservation> reservList(int presid) {
		List<Reservation> list = posDao.reservList(presid);
		return list;
	}*/
	
/*	public int checkCoupon(String cbmid, int cbnumber) {		
		Coupon coupon = posDao.checkCoupon(cbmid, cbnumber);		
		Date now = new Date();		
		
		if (coupon == null) {
			return COUPON_FAIL;
		} else if (now.after(coupon.getCdday())) {		// 쿠폰 유효기간 확인
			return COUPON_EXPIRE_DATE;				
		} 	
		return coupon.getCdiscount();
	}*/
	
	public List<Integer> checkEvent(int eresid, int ptableno) {
		List<Integer> list = posDao.checkEvent(eresid, ptableno);
		return list;
	}
	
	public int getCount(int presid) {
		int result = posDao.count(presid);		
		return result;
	}
}

