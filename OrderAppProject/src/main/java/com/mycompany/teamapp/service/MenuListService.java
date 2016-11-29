package com.mycompany.teamapp.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.MenuListDao;
import com.mycompany.teamapp.dto.MenuList;

@Component
public class MenuListService {
	
	public static final int ADD_SUCCESS=0;
	public static final int ADD_FAIL=1;
	public static final int DELETE_SUCCESS=0;
	public static final int DELETE_FAIL=1;
	public static final int MODIFY_SUCCESS=0;
	public static final int MODIFY_FAIL=1;
	
	@Autowired
	private MenuListDao menuListdao;
	
	public List<MenuList> list(int pageNo, int rowsPerPage){
		return menuListdao.selectByPage(pageNo, rowsPerPage); 
	}
	
	public List<MenuList> hotlist(int pageNo, int rowsPerPage){
		return menuListdao.selectByHotPage(pageNo, rowsPerPage); 
	}
	
	public int add(MenuList menuList){
		int row = menuListdao.insert(menuList);
		if(row==0){return ADD_FAIL;}
	
		return ADD_SUCCESS;
	}
	
	public int modify(MenuList menuList){
		int row = menuListdao.update(menuList);
		if(row==0){return MODIFY_FAIL;}
		return MODIFY_SUCCESS;
	}
	
	public int delete(int mlresid,String mlname){
		int row = menuListdao.delete(mlresid,mlname);
		if(row==0){return DELETE_FAIL;}
		return DELETE_SUCCESS;
	}
	
	public List<MenuList> resHotList(boolean mlishot){
		return menuListdao.resHotList(mlishot);
	}
	
	public int modifyHot(MenuList menuList){
		int row = menuListdao.update(menuList);
		if(row==0){return MODIFY_FAIL;}
		return MODIFY_SUCCESS;
	}
	
	public MenuList info(int mlresid, String mlname){
		return menuListdao.selectByMlresidAndMlname(mlresid, mlname);
	}

	public int getCount() {
		return menuListdao.count();
	}

	public MenuList hotinfo(int mlresid, String mlname,boolean mlishot) {
		return menuListdao.selectByMlresidAndMlnameAndMlishot(mlresid, mlname, mlishot);
	}

	public List<MenuList> menuList(int mlresid) {
		List<MenuList> menuList = menuListdao.selectMenu(mlresid);
		return menuList; 
	}
	
}