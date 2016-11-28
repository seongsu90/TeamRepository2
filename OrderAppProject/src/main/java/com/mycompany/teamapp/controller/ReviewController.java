package com.mycompany.teamapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.dto.Review;
import com.mycompany.teamapp.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
		
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm() {
		return "review/writeForm";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Review review, HttpSession session) {		
		String mid = (String) session.getAttribute("login");
		int revresid = (int) session.getAttribute("revresid");
		
		review.setRevmid(mid);
		review.setRevresid(revresid);
		
		int result = reviewService.write(review);
		if ( result == reviewService.WRITE_FAIL ) {
			return "review/write";
		}
		return ("redirect:/review/reviewList?revresid="+revresid);
	}
	
	@RequestMapping("/delete")
	public String delete(int revno, HttpSession session) {
		reviewService.delete(revno);	
		int revresid = (int) session.getAttribute("revresid");
		return ("redirect:/review/reviewList?revresid="+revresid);
	}

	@RequestMapping("/list")
	public String resList(String pageNo, Model model, HttpSession session) {
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
		
		int rowsPerPage=10;			
		int pagesPerGroup = 5;		
		
		int totalBoardNo = reviewService.getCount();		
		
		int totalPageNo = totalBoardNo / rowsPerPage + ( (totalBoardNo % rowsPerPage != 0) ? 1 : 0 );
		int totalGroupNo = totalPageNo / pagesPerGroup + ( (totalPageNo % pagesPerGroup != 0) ? 1 : 0 );
		
		int groupNo = (intPageNo-1) / pagesPerGroup + 1;				
		int startPageNo = (groupNo-1) * pagesPerGroup + 1;			
		int endPageNo = startPageNo + pagesPerGroup - 1;
		
		if ( groupNo == totalGroupNo ) {
			endPageNo = totalPageNo;
		}
		
		List<Restaurant> resList = reviewService.list(intPageNo, rowsPerPage);
		
		model.addAttribute("pageNo", intPageNo);
		model.addAttribute("rowsPerPage", rowsPerPage);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalBoardNo", totalBoardNo);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);		
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("resList", resList);	
		
		return "review/resList";
	}
	
	@RequestMapping("/reviewList")
	public String reviewList(int revresid, String pageNo, Model model, HttpSession session) {
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
		
		int rowsPerPage=10;			
		int pagesPerGroup = 5;		
		
		int totalBoardNo = reviewService.getCount();		
		
		int totalPageNo = totalBoardNo / rowsPerPage + ( (totalBoardNo % rowsPerPage != 0) ? 1 : 0 );
		int totalGroupNo = totalPageNo / pagesPerGroup + ( (totalPageNo % pagesPerGroup != 0) ? 1 : 0 );
		
		int groupNo = (intPageNo-1) / pagesPerGroup + 1;				
		int startPageNo = (groupNo-1) * pagesPerGroup + 1;			
		int endPageNo = startPageNo + pagesPerGroup - 1;
		
		if ( groupNo == totalGroupNo ) {
			endPageNo = totalPageNo;
		}
		
		List<Review> reviewList = reviewService.revList(revresid, intPageNo, rowsPerPage);
		
		model.addAttribute("pageNo", intPageNo);
		model.addAttribute("rowsPerPage", rowsPerPage);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalBoardNo", totalBoardNo);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);		
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("reviewList", reviewList);	
		session.setAttribute("revresid", revresid);
		
		return "review/reviewList";
	}
	
	@RequestMapping("/info")
	public String info(int revno, int revresid, Model model) {	
		Review review = reviewService.info(revno, revresid);
		model.addAttribute("review", review);
		return "review/info";
	}
}
