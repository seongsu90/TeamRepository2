package com.mycompany.teamapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.teamapp.dao.FavoriteDao;
import com.mycompany.teamapp.dto.Member;
import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.service.MemberService;
import com.mycompany.teamapp.service.RestaurantService;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MemberService memberService;
	

	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(String pageNo, @RequestParam(required=false, defaultValue="") String find, Model model, HttpSession session){
		
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
		return "restaurant/list";
	}
	
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String findList(String pageNo, String find, Model model) {
		logger.info("findList() POST 실행");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("find", find);

		return "redirect:/restaurant/list";		
	}
	
	
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Restaurant restaurant, HttpSession session, Model model){
		logger.info("add() 실행");

		if (restaurant.getResphoto() != null && ! restaurant.getResphoto().isEmpty() ) {
			restaurant.setResoriginfile(restaurant.getResphoto().getOriginalFilename());
			String ressavedfile = new Date().getTime() + restaurant.getResphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
			String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+ressavedfile);
			try {
				restaurant.getResphoto().transferTo(new File(realPath));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			restaurant.setRessavedfile(ressavedfile);
			
			restaurant.setResmime(restaurant.getResphoto().getContentType());
			
			
			int i=1;
			int size=restaurant.getCloseday().length;
			String close="";
		        for(String closeday : restaurant.getCloseday()){		        	
		        	close+=closeday;
		        	if(i<size){	
		        		close+="/";
		        		i++;
		        	}
		        }        
		    restaurant.setRescloseday(close);	
		}
		
		int result = restaurantService.add(restaurant);
		if(result == RestaurantService.ADD_SUCCESS) {
			model.addAttribute("result", "success");
		} else {
			model.addAttribute("result", "fail");
		}
	
		return "restaurant/add";	
	}
	
	// getCity
	@RequestMapping(value="/getCity", method=RequestMethod.GET)
	public String getCity() {
		return "backup/restaurant/getCity";	
	}
	
	// getProvince
	@RequestMapping(value="/getProvince", method=RequestMethod.GET)
	public String getProvince() {
		return "backup/restaurant/getProvince";	
	}
	
	@RequestMapping(value="/getDetail", method=RequestMethod.GET)
	public String getDtail() {
		return "backup/restaurant/getDetail";	
	}	
	
	@RequestMapping(value="/delete")
	public String delete(int deleteresid, int inputresid, Model model){
		logger.info("delete() POST 실행");
		int result = restaurantService.REMOVE_FAIL;
		if ( deleteresid==inputresid){
			restaurantService.delete(deleteresid);
			result=restaurantService.REMOVE_SUCCESS;
		}
		model.addAttribute("result", result);
		return "restaurant/result";
	}

	@RequestMapping("/showPhoto")
	public void showPhoto(String ressavedfile, HttpServletRequest request, HttpServletResponse response){
		try{
		String fileName=ressavedfile;
		
		
		String resmime=request.getServletContext().getMimeType(fileName);
		response.setContentType(resmime);
		
		OutputStream os=response.getOutputStream();
		
		String filePath=request.getServletContext().getRealPath("/WEB-INF/photo/"+fileName);
		InputStream is=new FileInputStream(filePath);
		
		byte[] values=new byte[1024];
		int byteNum=-1;
		while((byteNum=is.read(values))!=-1){
			os.write(values, 0, byteNum);
		}
		os.flush();
		is.close();
		os.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@RequestMapping("/info")
	public String info(int resid, Model model){
		Restaurant restaurant=restaurantService.info(resid);
		model.addAttribute("restaurant", restaurant);
		return "restaurant/info";
	}
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm(int mresid, Model model){
		
		Restaurant restaurant=restaurantService.info(mresid);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("resid", restaurant.getResid());
		
		
		return "restaurant/modify";
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Restaurant restaurant , Model model, HttpSession session) throws Exception{
	
		Restaurant preRestaurant=restaurantService.info(restaurant.getResid());
		
		if(restaurant.getResphoto() != null && !restaurant.getResphoto().isEmpty()) {
			
			restaurant.setResid(restaurant.getResid());
			
			restaurant.setResoriginfile(restaurant.getResphoto().getOriginalFilename());
			String ressavedfile = new Date().getTime() + restaurant.getResphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
			String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+ressavedfile);
			restaurant.getResphoto().transferTo(new File(realPath)); 
			restaurant.setRessavedfile(ressavedfile);
			
			restaurant.setResmime(restaurant.getResphoto().getContentType());
			
			int i=1;
			int size=restaurant.getCloseday().length;
			String close="";
		        for(String closeday : restaurant.getCloseday()){		        	
		        	close+=closeday;
		        	if(i<size){	
		        		close+="/";
		        		i++;
		        	}
		        	
		        }      
		    restaurant.setRescloseday(close);
		    
		} else{
			restaurant.setRessavedfile(preRestaurant.getRessavedfile());
			restaurant.setResoriginfile(preRestaurant.getResoriginfile());
			restaurant.setResmime(preRestaurant.getResmime());
			int i=1;
			int size=restaurant.getCloseday().length;
			String close="";
		        for(String closeday : restaurant.getCloseday()){		        	
		        	close+=closeday;
		        	if(i<size){	
		        		close+="/";
		        		i++;
		        	}
		        	
		        }      
		    restaurant.setRescloseday(close);
		}

		try {
			int result = restaurantService.modify(restaurant);
			if(result == RestaurantService.MODIFY_SUCCESS) {
				model.addAttribute("result", "success");
			} else {
				model.addAttribute("result", "fail");
			}
		} catch (Exception e) {
			model.addAttribute("result", "fail");
		}
		return "restaurant/modify";
	}
	
		
		
	@RequestMapping("/index")
	public String index(HttpSession session,  Model model) {
		String mid=(String)session.getAttribute("login");
		Member member=memberService.info(mid);
	
		model.addAttribute("mrank", member.getMrank());
		model.addAttribute("resid", member.getMresid());
	
		return "restaurant/index";
	}
	
	@RequestMapping("/myres")
	public String myres(HttpSession session,  Model model) {
		String mid = (String) session.getAttribute("login");
		Member member = memberService.info(mid);
		Restaurant restaurant=restaurantService.info(member.getMresid());
		model.addAttribute("restaurant", restaurant);
		return "restaurant/myres";
	}


}
