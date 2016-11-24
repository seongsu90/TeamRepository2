package com.mycompany.teamapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.ReviewDao;
import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.dto.Review;

@Component
public class ReviewService {
	
	public static final int WRITE_SUCCESS = 0;
	public static final int WRITE_FAIL =1;
	
	public static final int DELETE_SUCCESS = 0;
	public static final int DELETE_FAIL = 1;
	
	@Autowired
	private ReviewDao reviewDao;
	
	public int write(Review review) {
		int row = reviewDao.insert(review);
		if(row == 0) {
			return WRITE_FAIL;
		}
		return WRITE_SUCCESS;		
	}

	public int delete(int revno) {
		int row = reviewDao.delete(revno);
		if(row == 0) {
			return DELETE_FAIL;
		}
		return DELETE_SUCCESS;
	}
	
	public Review info(int revno, int revresid) {
		Review review = reviewDao.selectInfo(revno, revresid);
		return review;
	}

	public List<Restaurant> list(int pageNo, int rowsPerPage) {		
		return reviewDao.selectByPage(pageNo, rowsPerPage);
	}
	
	public List<Review> revList(int revresid, int pageNo, int rowsPerPage) {		
		return reviewDao.selectByRevPage(revresid, pageNo, rowsPerPage);
	}
	
	public int getCount() {
		return reviewDao.count();
	}
}
