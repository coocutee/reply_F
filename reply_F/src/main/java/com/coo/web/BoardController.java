package com.coo.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coo.dao.ReplyDAO;
import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.domain.PageMaker;
import com.coo.service.BoardService;
import com.coo.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	@Inject
	private ReplyService rservice;
	@Inject
	private ReplyDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(BoardVO board, Model model) throws Exception{
		
		logger.info("등록페이지입니당.");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("register POST...");
		logger.info(board.toString());
		
		service.register(board);
		//브라우저까지는 전송되지만 uri에는 보이지 않는 숨겨진 형태로 전송!
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("리스트페이지!!!");
		
		model.addAttribute("list", service.listAll());	

	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		logger.info("페이징처리된 리스트페이지!!!");
		logger.info(cri.toString());
		
		model.addAttribute("list",service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(service.countPaing(cri));
		model.addAttribute("pageMaker",pageMaker);
	}

	
	@GetMapping("/view")
	public void read( @RequestParam("bno") int bno, @ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		logger.info("veiw page");
		
		//model에 아무런 이름없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용. BoardVO => boardVO로 저장됨!
		model.addAttribute(service.view(bno));
		
		model.addAttribute(rservice.repList(bno));

		model.addAttribute("replynick",dao.nickname(bno));
	} 
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		
		model.addAttribute(service.view(bno));
		
		logger.info("modify get....");

	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST( BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		service.modify(board);
		
		rttr.addFlashAttribute("page",cri.getPage());
		rttr.addFlashAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info("modify complete");
		
		return "redirect:/board/listPage";
	}
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST( @RequestParam("bno") Integer bno, Criteria cri, RedirectAttributes rttr) throws Exception{
		
	
		service.remove(bno);
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		
		return "redirect:/board/listPage";
	}
	
}
