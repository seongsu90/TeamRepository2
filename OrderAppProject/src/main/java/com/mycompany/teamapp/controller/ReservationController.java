package com.mycompany.teamapp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.teamapp.dto.Reservation;
import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.service.MemberService;
import com.mycompany.teamapp.service.ReservationService;
import com.mycompany.teamapp.service.RestaurantService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationservice;
	
	
	@Autowired
	private RestaurantService restaurantservice;
	
	@Autowired
	private MemberService memberservice;
	
	
	@RequestMapping("/index")
	public String index()
	{
		logger.info("index 처리 요청");
		return "/reservation/index";
	}
	
	
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Reservation reservation,HttpSession httpsession,Model model){
		logger.info("add 처리");
	
		int resid = reservation.getRvresid();
		String result = "success";
		
		Restaurant rs = restaurantservice.info(resid);
		String optime = rs.getResopen();
		optime = optime.substring(0, 2);
		int op = Integer.parseInt(optime);
		String cltime = rs.getResclose();
		cltime  = cltime.substring(0, 2);
		int cl = Integer.parseInt(cltime);
		
		String revtime =reservation.getRvtime().substring(0, 2);
		int rvt = Integer.parseInt(revtime);
		
		String[] cloday = rs.getRescloseday().split("/");
		String[] sevenday = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일","휴일없음"};
		Date date = new Date();
		
		for(int i=0; i<cloday.length;i++)
		{
			for(int j=0;j<sevenday.length;j++)
			{
				if(cloday[i].equals(sevenday[j]))
				{
					if(j==date.getDay())
					{
						model.addAttribute("error1", "DAY_OUT");
						result = "fail";
					}
					if(j==7){
						break;
					}
				}
			}
		}

		if(op>rvt || cl<rvt)
		{
			model.addAttribute("error1", "TIME_OUT");
			result = "fail";
		}else{
			int returnValue = reservationservice.add(reservation);
			
			if(returnValue==0)
			{	
				model.addAttribute("rvresid", reservation.getRvresid());
				httpsession.removeAttribute("rvresid");
			}

			model.addAttribute("error1", "ALREADY");
		}
		
		logger.info("result : " + result);
		model.addAttribute("result", result);
		return "reservation/addform";
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteform(int rvresid,HttpSession httpsession)
	{
		logger.info("deleteform 처리");
		httpsession.setAttribute("rvresid", rvresid);
		return "/reservation/deleteform";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete (String rvmid, int rvresid,HttpSession httpsession,Model model)
	{
		Date now = new Date();
		Reservation rsv = reservationservice.info(rvmid, rvresid);
		String rsvTime = rsv.getRvtime();

		String h = rsvTime.substring(0, 2);
		String m = rsvTime.substring(3);
		int hour = Integer.parseInt(h);		
		int minute = Integer.parseInt(m);
		
		String mid = memberservice.getMid(rvresid);
		if(httpsession.getAttribute("login").equals(mid)){
			int mrank = memberservice.info(mid).getMrank();
			if(mrank==1)
			{
				reservationservice.delete(rvmid, rvresid);
				httpsession.removeAttribute("rvresid");
				return "redirect:/pos/index";
			}
		}
		

		if(now.getHours()==hour)
		{
			if((minute-now.getMinutes())<20||(minute-now.getMinutes())<0)
			{
				model.addAttribute("error", "TIME_LIMIT");
				return "/reservation/deleteform";
			}
		}

		reservationservice.delete(rvmid, rvresid);
		httpsession.removeAttribute("rvresid");

		return "redirect:/reservation/index";
	}
	
	@RequestMapping("/list")
	public String list(String mid,String pageNo,Model model,HttpSession session){
	
	
				
		int intPageNo =1;
		if(pageNo==null)
		{
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo != null) //넘어오지도 않고 세션에 존재하지도 않을 때는 1페이를 넘겨주게끔 셋팅
				{
					intPageNo =Integer.parseInt(pageNo)	;
				}
		}else
		{
			intPageNo = Integer.parseInt(pageNo);
		}
		session.setAttribute("pageNo", String.valueOf(intPageNo));
		
		int rowsPerPage = 8;
		int pagesPerGroup =5;
		
		int totalBoardNo = reservationservice.getCount();
		
		int totalPageNo = totalBoardNo/rowsPerPage + ((totalBoardNo%rowsPerPage!=0)?1:0); //나머지가 있다면 1을 더하고 없으면 0을 더한다.
	
/*		Restaurant restaurant = restaurantservice.info(rvresid);	
		restaurant.getResname();*/
		List<Reservation> list = reservationservice.list(mid,intPageNo, rowsPerPage);
		List<String> list2 = new ArrayList<>();
		for(Reservation rs : list)
		{
			int resid = rs.getRvresid();
			Restaurant rst=restaurantservice.info(resid);
			list2.add(rst.getResname());
		}
		
		for(int i=0; i<list.size();i++)
		{
			list.get(i).setRvresname(list2.get(i));
		}
		
		model.addAttribute("pageNo",intPageNo);
		model.addAttribute("rowsPerPage",rowsPerPage);
		model.addAttribute("pagesPerGroup",pagesPerGroup);
		model.addAttribute("totalPageNo",totalPageNo);
		model.addAttribute("totalBoardNo",totalBoardNo);
		model.addAttribute("list",list);

		return "reservation/list";
	}
	
}
