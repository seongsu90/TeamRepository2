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

import com.mycompany.teamapp.dto.Event;
import com.mycompany.teamapp.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	@Autowired
	private EventService eventService;

	
	@RequestMapping("/index")
	public String index() {
		logger.info("index 요청처리");
		return "event/index";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addForm(){
		logger.info("addForm 요청처리");
		return "event/addForm";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Event event, HttpSession session, Model model){
		logger.info("add 요청처리");
		String result = "fail";
		
		if ( event.getEphoto() != null && !event.getEphoto().isEmpty() ) {
			try{
				event.setEoriginfile(event.getEphoto().getOriginalFilename());
				String esavedfile = new Date().getTime() + event.getEphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
				String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+esavedfile);
				event.getEphoto().transferTo(new File(realPath)); // 지정된 경로로 파일을 저장한다는것? 83,84,실제 파일시스템을 저장
				event.setEsavedfile(esavedfile);
				
				event.setEmime(event.getEphoto().getContentType());
				result = eventService.add(event);
				
			} catch (Exception e) {}
		}
		
		model.addAttribute("result", result);
		return "event/result";
	}
	
	@RequestMapping(value="/delete")
	public String delete(int eresid,String emlname){
		logger.info("delete 처리");
		eventService.delete(eresid, emlname);
		return "event/list";
	}
	
	@RequestMapping("/info")
	public String info(int eresid, String emlname, Model model){
		logger.info("info 성공");
		
		logger.info(String.valueOf(eresid));
		logger.info(emlname);
		Event event = eventService.info(eresid,emlname);
		
		model.addAttribute("event",event);
		return "event/info";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm(int eresid,String emlname,Model model){
		logger.info("modify 요청처리");
		
		Event event = eventService.info(eresid,emlname);
		model.addAttribute("event",event);
		model.addAttribute("eresid", event.getEresid());
		model.addAttribute("emlname", event.getEmlname());
		
		return "event/modify";
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Event event, HttpSession session, Model model){
		logger.info("modify 완료");
		Event oldEvent = eventService.info(event.getEresid(), event.getEmlname());
		
		if ( event.getEphoto() != null && !event.getEphoto().isEmpty() ) {
			try{
				event.setEoriginfile(event.getEphoto().getOriginalFilename());
				String esavedfile = new Date().getTime() + event.getEphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
				String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+esavedfile);
				event.getEphoto().transferTo(new File(realPath)); // 지정된 경로로 파일을 저장한다는것? 83,84,실제 파일시스템을 저장
				event.setEsavedfile(esavedfile);
				
				event.setEmime(event.getEphoto().getContentType());
				
				} catch (Exception e) {}
		} else {
			event.setEsavedfile(oldEvent.getEsavedfile());
			event.setEoriginfile(oldEvent.getEoriginfile());
			event.setEmime(oldEvent.getEmime());			
		}
		
			int result = eventService.modify(event);
			if(result == EventService.MODIFY_SUCCESS){
				model.addAttribute("result", "success");
			}else{
				model.addAttribute("result", "fail");
			}
			
			return "event/modify";
	}
	
	@RequestMapping("/showPhoto")
	public void showPhoto(String esavedfile, HttpServletRequest request, HttpServletResponse response){
		try{
		String fileName=esavedfile;
		
		
		String emime=request.getServletContext().getMimeType(fileName);
		response.setContentType(emime);
		
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
	
	
	@RequestMapping("/list")
	public String list(String pageNo, Model model, HttpSession session){
		
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
		
		int rowsPerPage=8;
		int pagesPerGroup=5;
		int totalEventNo=eventService.getCount();
		if ( totalEventNo == 0 ) totalEventNo = 1;
		
		int totalPageNo=totalEventNo/rowsPerPage+((totalEventNo%rowsPerPage!=0)?1:0);
		int totalGroupNo=totalPageNo/pagesPerGroup+((totalPageNo%pagesPerGroup!=0)?1:0);
		
		int groupNo=(intPageNo-1)/pagesPerGroup+1;
		int startPageNo=(groupNo-1)*pagesPerGroup+1;
		int endPageNo=startPageNo+pagesPerGroup-1;
		if(groupNo==totalGroupNo){
			endPageNo=totalPageNo;
		}
		
		List<Event> list= eventService.list(intPageNo, rowsPerPage);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", intPageNo);
		model.addAttribute("rowsPerPage", rowsPerPage);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalEventNo", totalEventNo);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		return "event/list";
	}
	
}