package com.mycompany.teamapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.ReservationDao;
import com.mycompany.teamapp.dto.Reservation;

@Component
public class ReservationService {
	private static final int ADD_SUCCESS = 0;
	private static final int ADD_FAIL =1;
	
	private static final int TIME_OUT=1;
	private static final int DAY_OUT=1;
	
	private static final int DELETE_SUCCESS = 0;
	private static final int DELETE_FAIL = 1;
	
	@Autowired
	private ReservationDao reservationDao;
	
	public int add(Reservation reservation) {
		String mid = reservation.getRvmid();
		int resid = reservation.getRvresid();
		
		if(reservationDao.selectById(mid, resid)==null)
		{
			int row = reservationDao.insert(reservation);
			return ADD_SUCCESS;
		}else
		{
			return ADD_FAIL;
		}
	}
	
	public int delete(String rvMid, int rvResid) {
		int row = reservationDao.delete(rvMid,rvResid);
		if(row==0)
		{
			return DELETE_FAIL;
		}
		return DELETE_SUCCESS;
	}
	
	public List<Reservation> list(String mid, int pageNo, int rowsPerPage){
		return reservationDao.selectByPage(mid,pageNo, rowsPerPage);
	}
	
	public Reservation info(String rvMid, int rvResid) {
		Reservation reservation = reservationDao.selectById(rvMid, rvResid);
		return reservation;
	}

	public int getCount(){
		return reservationDao.count();
	}
	
	public List<Reservation> reservList(int presid) {
		List<Reservation> list = reservationDao.reservList(presid);
		return list;
	}

}
