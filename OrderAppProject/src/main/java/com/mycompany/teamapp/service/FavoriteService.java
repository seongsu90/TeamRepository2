package com.mycompany.teamapp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.FavoriteDao;
import com.mycompany.teamapp.dao.RestaurantDao;
import com.mycompany.teamapp.dto.Restaurant;

@Component
public class FavoriteService {
	
	@Autowired
	private FavoriteDao favoriteDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	public int add(String fmid, int fresid) {
		int result = favoriteDao.insert(fmid, fresid);
		return result;	
	}
	
	public int delete(String fmid, int fresid) {
		int result = favoriteDao.delete(fmid, fresid);
		return result;	
	}
	
	public List<Restaurant> list(String fmid) {
		List<Integer> residList = favoriteDao.selectByFmid(fmid);
		List<Restaurant> resList = new ArrayList<>();
		
		if ( residList == null ) return null;
		
		for ( int i = 0 ; i < residList.size() ; i++ ) {
			resList.add( restaurantDao.selectByResid(residList.get(i)) );
		}
		return resList;
	}
}
