package com.coo.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coo.dao.UserDAO;
import com.coo.domain.UserVO;
import com.coo.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private UserDAO dao;
	
	@GetMapping("/login")
	public void loginGET(HttpSession session) throws Exception {
		logger.info("login get...");
	}
	
	@PostMapping("/loginPost")
	public String loginPOST(UserVO vo, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
	
		UserVO login = service.login(vo);
		
		if (login != null) {
			model.addAttribute("value", vo);
			session.setAttribute("LOGIN", login);
						
			return "redirect:../sboard/list";

		} else {
			rttr.addFlashAttribute("result","fail");
			return "redirect:../user/login";
		}
		
	}
	
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String logout(HttpSession session)throws Exception{
		//세션전체초기화
		session.invalidate();
		logger.info("user logout");
		return "redirect:../sboard/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(UserVO vo, Model model) throws Exception {
		logger.info("register...");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(UserVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("registPOST called.....");
		logger.info("Register" + vo);

		
//		if (vo.getId().length() == 0  
//				|| vo.getPw().length() == 0  
//				|| vo.getNickname().length() == 0
//				|| dao.checkID(vo.getId().toString()) == 1
//				){
//			
//			return  "redirect:/user/register";
//		} else {
//		}
		
		if(dao.checkID(vo.getId()) != null){
			rttr.addFlashAttribute("msg","fail");
			return "redirect:/user/register";
		}

		service.register(vo);
		rttr.addFlashAttribute("msg","good");
		return "redirect:/user/login";
	}

}
