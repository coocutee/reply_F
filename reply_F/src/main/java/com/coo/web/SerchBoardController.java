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
import com.coo.domain.PageMaker;
import com.coo.domain.SearchCriteria;
import com.coo.service.BoardService;
import com.coo.service.ReplyService;

@Controller
@RequestMapping("/sboard/*")
public class SerchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SerchBoardController.class);
	
	@Inject
	BoardService service;

	
	@GetMapping(value="/list")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, RedirectAttributes rttr)throws Exception{
		
		BoardVO vo = new BoardVO();
	    logger.info(cri.toString());

	    model.addAttribute("list", service.listSearchCriteria(cri));
	    
	   // model.addAttribute("list", rservice.replycnt(125));
	    

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	     //pageMaker.setTotalCount(service.countPaing(cri));
	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(BoardVO vo, Model model) throws Exception{
		
		logger.info("����������Դϴ�.");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("register POST...");
		logger.info(vo.toString());
		
		System.out.println("�׽�Ʈ!!!!!!!!!!!!!!!!!!"+vo);
		
		service.register(vo);
		//������������ ���۵����� uri���� ������ �ʴ� ������ ���·� ����!
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/sboard/list";
	}
	
	@GetMapping("/view")
	public void read( @RequestParam("bno") int bno, @ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
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
	public String modifyPOST( BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.modify(board);
		
		rttr.addFlashAttribute("page",cri.getPage());
		rttr.addFlashAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("sarchType",cri.getSearchType());
		rttr.addFlashAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info("modify complete");
		
		return "redirect:/sboard/list";
	}
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST( @RequestParam(value="bno") Integer bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
	
		service.remove(bno);
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("sarchType",cri.getSearchType());
		rttr.addFlashAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/sboard/list";
	}
}
