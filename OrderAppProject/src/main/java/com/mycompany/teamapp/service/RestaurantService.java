package com.mycompany.teamapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.MemberDao;
import com.mycompany.teamapp.dao.RestaurantDao;
import com.mycompany.teamapp.dto.Restaurant;

@Component
public class RestaurantService {
	public static final int ADD_SUCCESS=0;
	public static final int ADD_FAIL=1;
	
	public static final int REMOVE_SUCCESS=0;
	public static final int REMOVE_FAIL=1;
	
	public static final int MODIFY_SUCCESS=0;
	public static final int MODIFY_FAIL=1;
	private static final Logger logger = LoggerFactory.getLogger(EventService.class);
	
@Autowired
private RestaurantDao restaurantDao; 

@Autowired
private MemberDao memberDao;

		public List<Restaurant> list(int pageNo, int rowsPerPage, String find){
			return restaurantDao.selectByPage(pageNo, rowsPerPage, find);
			
	
		}

		public int add(Restaurant restaurant){
			logger.info("add요청처리");
			int row=restaurantDao.insert(restaurant);
			if(row==0){
				return ADD_FAIL;
			}
			return ADD_SUCCESS;
		}
			
		public int delete(int resid){
			int row=restaurantDao.delete(resid);
			if(row==0){return REMOVE_FAIL;}
			return REMOVE_SUCCESS;
		}
		
		public int modify(Restaurant restaurant){
			int row=restaurantDao.update(restaurant);
			if(row==0){return MODIFY_FAIL;}
			return MODIFY_SUCCESS;
		}
		
		public Restaurant info(int resid){
			return restaurantDao.selectByResid(resid);
		}
		
		
		public int getCount(String find){
			return restaurantDao.count(find);
		}

	
		
	
		
		
}

