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

import com.coo.domain.BoardVO;
import com.coo.domain.Criteria;
import com.coo.domain.PageMaker;
import com.coo.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(BoardVO board, Model model) throws Exception{
		
		logger.info("����������Դϴ�.");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("register POST...");
		logger.info(board.toString());
		
		service.register(board);
		//������������ ���۵����� uri���� ������ �ʴ� ������ ���·� ����!
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("����Ʈ������!!!");
		
		model.addAttribute("list", service.listAll());	

	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		logger.info("����¡ó���� ����Ʈ������!!!");
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
		
		//model�� �ƹ��� �̸����� �����͸� ������ �ڵ����� Ŭ������ �̸��� �ҹ��ڷ� �����ؼ� ���. BoardVO => boardVO�� �����!
		model.addAttribute(service.view(bno));
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
