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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coo.dao.ReplyDAO;
import com.coo.domain.BoardVO;
import com.coo.domain.PageMaker;
import com.coo.domain.SearchCriteria;
import com.coo.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SerchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SerchBoardController.class);
	
	@Inject
	BoardService service;

	@Inject
	ReplyDAO dao;
	
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
		
		logger.info("등록페이지입니당.");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("register POST...");
		logger.info(vo.toString());
		
		String title = vo.getTitle();
		String title2 = vo.getTitle();
		title = title.replace("<", "&lt;");
		title2 = title.replace(">", "&gt;");
		vo.setTitle(title);
		vo.setTitle(title2);
		
		String con = vo.getContent();
		con = con.replace("<", "&lt;");
		vo.setContent(con);
		
		service.register(vo);
		//브라우저까지는 전송되지만 uri에는 보이지 않는 숨겨진 형태로 전송!
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/view" , method={RequestMethod.GET,RequestMethod.POST})
	public void read( @RequestParam("bno") int bno, @ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		logger.info("veiw page");
		
		//model에 아무런 이름없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용. BoardVO => boardVO로 저장됨!
		model.addAttribute(service.view(bno));
		//model.addAttribute(dao.nickname(bno));
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
		
		return "redirect:/sboard/list?page="+cri.getPage();
	}
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST( @RequestParam(value="bno") Integer bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
	
		service.remove(bno);
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("sarchType",cri.getSearchType());
		rttr.addFlashAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/sboard/list?page="+cri.getPage();
	}
	
	@GetMapping("/addlikeCnt")
	@ResponseBody
	public Integer likecnt(BoardVO vo, Model model) throws Exception{
		
		logger.info("like가 하나 추가되었습니당!");
		service.addLikeCnt(vo);
	
		logger.info("addlikeCnt" + vo);
		//int bno = vo.getBno();

		return service.readLikeCnt(vo.getBno()); 
	}
	
	@GetMapping("/likeHistory")
	@ResponseBody
	public Integer likeHistory(@RequestParam("bno") int bno, @RequestParam("uno") int uno) throws Exception{
		
		logger.info("like 몇개인지 셉니다");

		BoardVO vo = new BoardVO();
		
		vo.setBno(bno);
		vo.setUno(uno);

		logger.info(vo.toString());
		System.out.println("꺄ㅏ악"+service.likeHistory(vo));
	
		return service.likeHistory(vo); 
	}
}
