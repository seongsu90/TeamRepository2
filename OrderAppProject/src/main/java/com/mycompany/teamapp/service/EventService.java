package com.mycompany.teamapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.controller.EventController;
import com.mycompany.teamapp.dao.EventDao;
import com.mycompany.teamapp.dto.Event;
import com.mycompany.teamapp.dto.Restaurant;

@Component
public class EventService { 
	public static final int ADD_SUCCESS=0;
	public static final int ADD_FAIL=1;
	public static final int DELETE_SUCCESS=0;
	public static final int DELETE_FAIL=1;
	public static final int MODIFY_SUCCESS=0;
	public static final int MODIFY_FAIL=1;
	
	private static final Logger logger = LoggerFactory.getLogger(EventService.class);
	
	@Autowired
	private EventDao eventdao;
	
	public int add(Event event){
		logger.info("add 요청처리");
		int row = eventdao.insert(event);
		if(row == 0){
			return ADD_FAIL;
		}
		return ADD_SUCCESS;
	}
	
	public int delete(int eresid,String emlname){
		logger.info("delete 요청처리");
		int row = eventdao.delete(eresid, emlname);
		if(row==0){return DELETE_FAIL;}
		return DELETE_SUCCESS;
	}
	
	public int modify(Event event){
		logger.info("modify 요청처리");
		int row = eventdao.update(event);
		if(row==0){return MODIFY_FAIL;}
		return  MODIFY_SUCCESS;
	
	}
	
	public Event info(int eresid, String emlname){
		logger.info("info 요청처리");
		return eventdao.selectByEresidAndEmlname(eresid,emlname);
	}
	
	public List<Event> list(int pageNo, int rowsPerPage){
		return eventdao.selectByPage(pageNo, rowsPerPage);
	}
	
	public int getCount(){
		return eventdao.count();
	}
	
	/*public List<Integer> checkEvent(int eresid, int ptableno) {
		List<Integer> list = eventdao.checkEvent(eresid, ptableno);
		return list;
	}*/
}