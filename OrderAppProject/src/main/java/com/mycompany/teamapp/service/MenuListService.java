package com.mycompany.teamapp.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.MenuDao;
import com.mycompany.teamapp.dto.Menu;

@Component
public class MenuListService {
	
	public static final int ADD_SUCCESS=0;
	public static final int ADD_FAIL=1;
	public static final int DELETE_SUCCESS=0;
	public static final int DELETE_FAIL=1;
	public static final int MODIFY_SUCCESS=0;
	public static final int MODIFY_FAIL=1;
	
	@Autowired
	private MenuDao menuListdao;
	
	public List<Menu> list(int pageNo, int rowsPerPage){
		return menuListdao.selectByPage(pageNo, rowsPerPage); 
	}
	
	public List<Menu> hotlist(int pageNo, int rowsPerPage){
		return menuListdao.selectByPage(pageNo, rowsPerPage); 
	}
	
	public int add(Menu menuList){
		int row = menuListdao.insert(menuList);
		if(row==0){return ADD_FAIL;}
	
		return ADD_SUCCESS;
	}
	
	public int modify(Menu menuList){
		int row = menuListdao.update(menuList);
		if(row==0){return MODIFY_FAIL;}
		return MODIFY_SUCCESS;
	}
	
	public int delete(int mlresid,String mlname){
		int row = menuListdao.delete(mlresid,mlname);
		if(row==0){return DELETE_FAIL;}
		return DELETE_SUCCESS;
	}
	
	public List<Menu> resHotList(boolean mlishot){
		return menuListdao.resHotList(mlishot);
	}
	
	public int modifyHot(Menu menuList){
		int row = menuListdao.update(menuList);
		if(row==0){return MODIFY_FAIL;}
		return MODIFY_SUCCESS;
	}
	
	public Menu info(int mlresid, String mlname){
		return menuListdao.selectByMlresidAndMlname(mlresid, mlname);
	}

	public int getCount() {
		return menuListdao.count();
	}

	public Menu hotinfo(int mlresid, String mlname,boolean mlishot) {
		return menuListdao.selectByMlresidAndMlnameAndMlishot(mlresid, mlname, mlishot);
	}

	public List<Menu> menuList(int mlresid) {
		List<Menu> menuList = menuListdao.selectMenu(mlresid);
		return menuList; 
	}
	
}