package com.mycompany.teamapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.teamapp.dto.MenuList;
import com.mycompany.teamapp.service.MenuListService;

@Controller
@RequestMapping("/menulist")
public class MenuListController {
	
		@Autowired
		private MenuListService menuListService;
		
		@RequestMapping("/list")
		public String list(String pageNo, Model model, HttpSession session){
			int intPageNo=1;
			if(pageNo==null){
				pageNo=(String) session.getAttribute("pageNo");
				if(pageNo != null){
					intPageNo = Integer.parseInt(pageNo);
				}
			}else{
				intPageNo = Integer.parseInt(pageNo);
			}
			session.setAttribute("pageNo", String.valueOf(intPageNo));
			int rowsPerPage = 8;//한페이지당 보이는 갯수
			int pagesPerGroup = 5;//한그룹당 페이지수 
			
			int totalBoardNo = menuListService.getCount();//총 게시판 갯수
			
			int totalPageNo = (totalBoardNo/rowsPerPage)+((totalBoardNo%rowsPerPage!=0)?1:0);//총 페이지수
			//                       정수/정수 =정수               나머지가있다면 1을 더해주고 없다면 0 
			
			int totalGroupNo = (totalPageNo/pagesPerGroup)+((totalPageNo%pagesPerGroup!=0)?1:0);
			
			int groupNo = (intPageNo-1)/pagesPerGroup+1;
			
			int startPageNo = (groupNo-1)*pagesPerGroup+1;
			
			int endPageNo = startPageNo+pagesPerGroup-1;
			
			if(groupNo == totalGroupNo) {endPageNo=totalPageNo;}
			
			List<MenuList> list = menuListService.list(intPageNo,rowsPerPage);
			
			model.addAttribute("intPageNo",intPageNo);
			model.addAttribute("rowsPerPage",rowsPerPage);	
			model.addAttribute("pagesPerGroup",pagesPerGroup);
			model.addAttribute("totalBoardNo",totalBoardNo);
			model.addAttribute("totalPageNo",totalPageNo);
			model.addAttribute("totalGroupNo",totalGroupNo);
			model.addAttribute("groupNo",groupNo);
			model.addAttribute("startPageNo",startPageNo);
			model.addAttribute("endPageNo",endPageNo);
			model.addAttribute("list", list);
			
			return "menulist/list";
		}
		
		@RequestMapping("/index")
		public String index() {
			return "menulist/index";
		}
		
		@RequestMapping(value="/add", method=RequestMethod.GET)
		public String addForm() {				
			return "menulist/addForm";
		}
		
		@RequestMapping(value="/add", method=RequestMethod.POST)
		public String add(MenuList menuList,HttpSession session) {
			try{
		
				menuList.setMloriginfile(menuList.getMlphoto().getOriginalFilename());
				String mlsavedfile = new Date().getTime() + menuList.getMlphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
				String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+mlsavedfile);
				menuList.getMlphoto().transferTo(new File(realPath)); // 지정된 경로로 파일을 저장한다는것? 83,84,실제 파일시스템을 저장
				menuList.setMlsavedfile(mlsavedfile);
				
				menuList.setMlmime(menuList.getMlphoto().getContentType());
			        
				menuListService.add(menuList);
				return "redirect:/menulist/list"; 
			}
				
				catch (Exception e) {
					e.printStackTrace();
					return "menulist/addForm";
				}
		}

		@RequestMapping(value="/modify", method=RequestMethod.GET)
		public String modifyForm(int mlresid, String mlname, Model model) {
			MenuList menuList = menuListService.info(mlresid, mlname);
			model.addAttribute("menuList",menuList);
			return "menulist/modify";
		}
		
		@RequestMapping(value="/modify", method=RequestMethod.POST)
		public String modify(MenuList menuList,HttpSession session) throws IllegalStateException, IOException {
			
			menuList.setMloriginfile(menuList.getMlphoto().getOriginalFilename());
			String mlsavedfile = new Date().getTime() + menuList.getMlphoto().getOriginalFilename();
			String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+mlsavedfile);
			menuList.getMlphoto().transferTo(new File(realPath)); 
			menuList.setMlsavedfile(mlsavedfile);
			
			menuList.setMlmime(menuList.getMlphoto().getContentType());
			menuListService.modify(menuList);
			return "redirect:/menulist/list";
		}
		
		@RequestMapping("/delete")
		public String delete(int mlresid, String mlname){
			menuListService.delete(mlresid, mlname);
			return "menulist/list";
		}
		
		@RequestMapping("/info")	
		public String info(int mlresid, String mlname, Model model) {
			MenuList menuList = menuListService.info(mlresid, mlname);
			model.addAttribute("menuList",menuList);
			
			return "menulist/info";
		}
	
		@RequestMapping("/showPhoto")
		public void showPhoto(String mlsavedfile, HttpServletRequest request, HttpServletResponse response){
			try{
			String fileName=mlsavedfile;
			
			
			String mlmime=request.getServletContext().getMimeType(fileName);
			response.setContentType(mlmime);
			
			OutputStream os=response.getOutputStream();
			
			String filePath=request.getServletContext().getRealPath("/WEB-INF/photo/"+fileName);
			FileInputStream is=new FileInputStream(filePath);
			
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
		
		@RequestMapping("/hotlist")	
		public String resHotList(boolean mlishot,Model model){
			List<MenuList> menuList = menuListService.resHotList(mlishot);
			model.addAttribute("menuList",menuList);
			return "menulist/hotlist";
		}
		
		@RequestMapping(value="/modifyhot",method=RequestMethod.GET)	
		public String modifyhotForm(int mlresid, String mlname, boolean mlishot, Model model){
			MenuList menuList = menuListService.hotinfo(mlresid, mlname,mlishot);
			model.addAttribute("menuList",menuList);
			return "menulist/modifyhot";
		}
		
		@RequestMapping(value="/modifyhot",method=RequestMethod.POST)	
		public String modifyhot(MenuList menuList,HttpSession session) throws IllegalStateException, IOException{
			
			menuList.setMloriginfile(menuList.getMlphoto().getOriginalFilename());
			String mlsavedfile = new Date().getTime() + menuList.getMlphoto().getOriginalFilename(); // 저장하는 파일이 유일해야하기 때문에 날짜를 붙인다.
			String realPath = session.getServletContext().getRealPath("/WEB-INF/photo/"+mlsavedfile);
			menuList.getMlphoto().transferTo(new File(realPath)); 
			menuList.setMlsavedfile(mlsavedfile);
			
			menuList.setMlmime(menuList.getMlphoto().getContentType());
			menuListService.modifyHot(menuList);
			return "redirect:/menulist/index";
		}
		
		@RequestMapping(value="/hotinfo")
		public String hotinfo(int mlresid, String mlname, boolean mlishot, Model model){
			MenuList menuList = menuListService.hotinfo(mlresid,mlname,mlishot);
			model.addAttribute("menuList", menuList);
			return "menulist/hotinfo";
		}
		
		
	}