package com.mycompany.teamapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.teamapp.dto.Member;
import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.service.FavoriteService;
import com.mycompany.teamapp.service.MemberService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private MemberService memberService;
	
	// Favorite 추가 폼
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addForm() {
		logger.info("addForm() GET 실행");
		return "favorite/addForm";
	}
	
	// Favorite 추가
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@RequestParam(required=false, defaultValue=""+Integer.MAX_VALUE) int fresid, HttpSession session, Model model) {
		logger.info("add() POST 실행");
		String fmid = (String) session.getAttribute("login");
		if ( fresid == Integer.MAX_VALUE ) {
			model.addAttribute("error", " 값을 입력하세요.");
			return "favorite/addForm";
		}
		try {
			favoriteService.add(fmid, fresid);
		} catch (DuplicateKeyException e) {
			model.addAttribute("error", " 이미 즐겨찾기에 추가된 레스토랑 입니다.");
			return "favorite/addForm";
		} catch (Exception e1) {
			e1.printStackTrace();
			model.addAttribute("error", " 입력하신 id를 가진 레스토랑이 없습니다.");
			return "favorite/addForm";
		}
		
		model.addAttribute("member", memberService.info(fmid));
		return "redirect:/favorite/list";
	}
	
	// Favorit 목록 보기 ( Restaurant Info 필요함 )
	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		logger.info("list() 실행");
		String fmid = (String) session.getAttribute("login");
		Member member = memberService.info(fmid);
		
		List<Restaurant> resList = favoriteService.list(fmid);
		model.addAttribute("resList", resList);
		model.addAttribute("member", member);
		
		return "favorite/list";
	}
	
	@RequestMapping("/delete")
	public String delete(int fresid, HttpSession session){
		favoriteService.delete((String)session.getAttribute("login"), fresid);
		
		return "redirect:/favorite/list";
	}

}
