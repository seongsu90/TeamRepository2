package com.mycompany.teamapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.teamapp.dto.Coupon;
import com.mycompany.teamapp.dto.CouponBox;
import com.mycompany.teamapp.dto.Member;
import com.mycompany.teamapp.service.CouponService;
import com.mycompany.teamapp.service.MemberService;
import com.mycompany.teamapp.service.RestaurantService;



@Controller
@RequestMapping("/coupon")
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	private String mid=null;
	
	@Autowired
	private CouponService couponservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private RestaurantService restaurantservice;
	
	
	@RequestMapping("/index")
	public String index(String mid){
		this.mid = mid;
		logger.info("index 처리요청");
		return "/coupon/index";
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
		
		int totalBoardNo = couponservice.getCount();
		
		int totalPageNo = totalBoardNo/rowsPerPage + ((totalBoardNo%rowsPerPage!=0)?1:0); //나머지가 있다면 1을 더하고 없으면 0을 더한다.
		int totalGroupNo = (totalPageNo/pagesPerGroup)+((totalPageNo%pagesPerGroup!=0)?1:0);
		
		int groupNo = (intPageNo-1)/ pagesPerGroup +1;
		int startPageNo = (groupNo-1)*pagesPerGroup +1;
		int endPageNo = startPageNo + pagesPerGroup -1;
		
		if(groupNo==totalGroupNo){endPageNo= totalPageNo;}
		
		List<CouponBox> couponlist = couponservice.list(mid,intPageNo, rowsPerPage);
		List<Coupon> coupon = new ArrayList<>();
		int cn = 0;
		for(int i=0; i<couponlist.size();i++)
		{
			CouponBox cb =couponlist.get(i);
			cn=cb.getCbnumber();
			coupon.add(couponservice.info(cn));
		}
		for(int i=0;i<coupon.size();i++)
		{
			coupon.get(i).setCresname(restaurantservice.info(coupon.get(i).getCresid()).getResname());
		}
		
		
		model.addAttribute("pageNo",intPageNo);
		model.addAttribute("rowsPerPage",rowsPerPage);
		model.addAttribute("pagesPerGroup",pagesPerGroup);
		model.addAttribute("totalPageNo",totalPageNo);
		model.addAttribute("totalBoardNo",totalBoardNo);
		model.addAttribute("totalGroupNo",totalGroupNo);
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("startPageNo",startPageNo);
		model.addAttribute("endPageNo",endPageNo);
		model.addAttribute("couponlist",couponlist);
		model.addAttribute("coupon",coupon);
		return "coupon/list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addform(HttpSession session){
		logger.info("addform 요청처리");
		int cnumber=0;
		int ranNum =0;
		boolean chkNum = false;
		int cresid = 0;
		for(;;)
		{
			if(chkNum!=true)
			{
			ranNum =(int)(Math.random()*100000000)+1;
			chkNum = couponservice.check(ranNum);
			}
			cnumber = ranNum;
			Member member = memberservice.info(mid);
			cresid = member.getMresid();
			break;
		}
		session.setAttribute("cresid", cresid);
		session.setAttribute("cnumber", cnumber);
		return "coupon/addform";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Coupon coupon){
		couponservice.add(coupon);
		logger.info("add 요청처리");
		return "redirect:/coupon/index";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteForm(){
		logger.info("deleteForm 처리");
		return "/coupon/deleteForm";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(int cnumber,Model model){
		logger.info("delete 처리");
		int result = couponservice.delete(cnumber);
		if(result == CouponService.DELETE_FAIL)
		{
			model.addAttribute("error", "DELETE_FAIL");
			return "/coupon/deleteForm";
		}
		model.addAttribute("success", "DELETE_SUCCESS");
		return "redirect:/coupon/index";
	}
	
	@RequestMapping("/info")
	public String info(int cnumber, Model model)
	{
		logger.info("info 처리 요청");
		Coupon coupon = couponservice.info(cnumber);
		model.addAttribute("coupon",coupon);
		return "/coupon/info";
	}
	
	@RequestMapping(value="/send",method=RequestMethod.GET)
	public String sendForm()
	{
		logger.info("sendform 요청처리");
		return "/coupon/sendForm";
	}
	
	@RequestMapping(value="/send",method=RequestMethod.POST)
	public String send(CouponBox couponbox,HttpSession session){
		logger.info("send 요청처리");

		int result = couponservice.send(couponbox);
		return "redirect:/coupon/index";
	}
}
