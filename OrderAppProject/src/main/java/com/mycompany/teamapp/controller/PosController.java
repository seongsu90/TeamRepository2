package com.mycompany.teamapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.teamapp.dto.Event;
import com.mycompany.teamapp.dto.Member;
import com.mycompany.teamapp.dto.MenuList;
import com.mycompany.teamapp.dto.Pos;
import com.mycompany.teamapp.dto.Reservation;
import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.service.CouponService;
import com.mycompany.teamapp.service.EventService;
import com.mycompany.teamapp.service.MemberService;
import com.mycompany.teamapp.service.MenuListService;
import com.mycompany.teamapp.service.PosService;
import com.mycompany.teamapp.service.ReservationService;
import com.mycompany.teamapp.service.RestaurantService;

@Controller
@RequestMapping("/pos")
public class PosController { 
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);
	
	@Autowired
	private PosService posService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MenuListService menuListService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private EventService eventService;
		
	@RequestMapping("/index")
	public String index(String rvmid, HttpSession session, Model model) {
		logger.info("pos index");
		String mid = (String) session.getAttribute("login");			// 로그인 mid 찾아서 레스토랑번호 확인
		Member member = memberService.info(mid);
		int presid = member.getMresid();
		
		List<Pos> posList = posService.info(presid);					// 매장 별 주문 내역
		
		Restaurant restaurant = restaurantService.info(presid);		// 매장별 총 테이블 수
		int totalTables = restaurant.getRestotaltable();

		memberService.addPenalty(rvmid);									// 블랙리스트
		reservationService.delete(rvmid, presid);
		
		List<Reservation> reservList =  reservationService.reservList(presid);		// 매장별 예약자 확인
		
		session.setAttribute("presid", presid);
		model.addAttribute("posList", posList);		
		model.addAttribute("totalTables", totalTables);
		model.addAttribute("reservList", reservList);		
		
		return "pos/index";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Pos pos, Model model) {		
		logger.info("pos add 실행");
		try {
			posService.add(pos);
			model.addAttribute("result", "success");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result", "fail");
		}
		return "pos/add";	
	}

/*	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm() {
		logger.info("pos modifyForm 실행");
		return "pos/modifyForm";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Pos pos) {
		logger.info("pos modify 실행");
		posService.modify(pos);
		return "redirect:/pos/index";
	}
	*/
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int presid, int ptableno, Model model) {
		logger.info("pos delete 실행");
		try {
			posService.delete(presid, ptableno);
			model.addAttribute("result", "success");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result", "fail");
		}
		return "pos/delete";	
	}
	
	@RequestMapping("/info")	
	public String info(int presid, int ptableno, Model model) {
		logger.info("pos info 실행");

		List<Pos> posList = posService.info(presid, ptableno); // 테이블별 주문 내역		
		List<Integer> price = posService.calcSum(presid, ptableno);	// 합계 계산
		List<MenuList> menuList = menuListService.menuList(presid); // 매장별 메뉴 리스트
		List<Integer> eventList = posService.checkEvent(presid, ptableno);	// 매장별 이벤트 메뉴 할인 합계
		List<Event> eventMenu = eventService.eventMenu(presid);
				
		int totalPrice = 0;
		for ( int i = 0; i < price.size(); i++ ) {
			totalPrice += price.get(i);
		}
		
		int eventPrice = 0;
		for ( int i = 0; i < eventList.size(); i++ ) {
			eventPrice += eventList.get(i);
		}
		
		int result = 0;
		int point = 0;		
		for ( int i = 0; i < price.size(); i++ ) {
			result = totalPrice - eventPrice;
			point = (int) (result * 0.01);
		}
		
		model.addAttribute("ptableno", ptableno);
		model.addAttribute("posList", posList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("menuList", menuList);
		model.addAttribute("eventPrice", eventPrice);
		model.addAttribute("result", result);
		model.addAttribute("point", point);
		model.addAttribute("eventMenu", eventMenu);
		return "pos/info";
	}
	
	@RequestMapping("/checkCoupon")	
	public String checkCoupon(String cbmid, int cbnumber, Model model) {
		int coupon = couponService.checkCoupon(cbmid, cbnumber);
		
		if (coupon == CouponService.COUPON_FAIL) {		// 1
			model.addAttribute("coupon", "쿠폰의 정보가 일치하지 않습니다.");	
		} else if (coupon == CouponService.COUPON_EXPIRE_DATE) {		// 2
			model.addAttribute("coupon", "쿠폰의 유효기간이 만료되었습니다.");
		} else {
			model.addAttribute("coupon", coupon);
		}	
		return "pos/info";		
	}	
}
