package com.mycompany.teamapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.service.RestaurantService;

@Controller
public class AndroidController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping("/reslist")
	public String reslist(String pageNo, @RequestParam(required=false, defaultValue="") String find, Model model, HttpSession session)
	{
		int intPageNo = 1;
		if ( pageNo == null ) {
			pageNo = (String) session.getAttribute("pageNo");
			if ( pageNo != null ) {
				intPageNo = Integer.parseInt(pageNo);
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}
		session.setAttribute("pageNo", String.valueOf(intPageNo));
		
		
		//관심지역 주소 얻기
	/*	String mid=(String)session.getAttribute("login");
		model.addAttribute("mid", mid);
		Member member=memberService.info(mid);
		String loc=member.getMlocation();*/

		int rowsPerPage=7;
		int pagesPerGroup=5;
		int totalRestaurantNo=restaurantService.getCount(find);
		
		int totalPageNo=totalRestaurantNo/rowsPerPage+((totalRestaurantNo%rowsPerPage!=0)?1:0);
		int totalGroupNo=totalPageNo/pagesPerGroup+((totalPageNo%pagesPerGroup!=0)?1:0);
		
		int groupNo=(intPageNo-1)/pagesPerGroup+1;
		int startPageNo=(groupNo-1)*pagesPerGroup+1;
		int endPageNo=startPageNo+pagesPerGroup-1;
		if(groupNo==totalGroupNo){
			endPageNo=totalPageNo;
		}
		
		List<Restaurant> list=restaurantService.list(intPageNo, rowsPerPage, find);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", intPageNo);
		model.addAttribute("rowsPerPage", rowsPerPage);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalRestaurantNo", totalRestaurantNo);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("find", find);
		return "android/reslist";
	}
}
