package balgil.com.trip.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.faq.model.FaqVO;
import balgil.com.trip.faq.service.FaqService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqController {

	@Autowired
	FaqService service;
	
	
	@RequestMapping(value = "/selectAllFaq.do", method = RequestMethod.GET)
	public String selectAllFaq(Model model) {
		log.info("/selectAllFaq.do");
		
		List<FaqVO> vos = service.selectAll();
			
		model.addAttribute("vos", vos);
		
		return "faq/selectAllFaq";
	}
	
	@RequestMapping(value = "/searchFaq.do", method = RequestMethod.GET)
	public String searchFaq(String searchKey, String searchWord, Model model) {
		log.info("/searchFaq.do...{},{}", searchKey, searchWord);
		
		List<FaqVO> vos = service.searchFaq(searchKey, searchWord);
		
		model.addAttribute("vos", vos);
		
		return "faq/selectAllFaq";
	}
	
	@RequestMapping(value = "/selectOneFaq.do", method = RequestMethod.GET)
	public String selectOneFaq(FaqVO vo, Model model) {
		log.info("/selectOneFaq.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		return "faq/selectOneFaq";
	}
	
	@RequestMapping(value = "/insertFaq.do", method = RequestMethod.GET)
	public String insertFaq() {
		log.info("/insertFaq.do...");
		
		return "faq/insertFaq";
	}
	
	@RequestMapping(value = "/insertFaqOK.do", method = RequestMethod.GET)
	public String insertFaqOK(FaqVO vo) {
		log.info("/insertFaqOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllFaq.do";
		}else {
			return "redirect:insertFaq.do";
		}
	}
	
	@RequestMapping(value = "/updateFaq.do", method = RequestMethod.GET)
	public String updateFaq(FaqVO vo, Model model) {
		log.info("/updateFaq.do...{}", vo);
		
		FaqVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2", vo2);
		
		return "faq/updateFaq";
	}
	
	@RequestMapping(value = "/updateFaqOK.do", method = RequestMethod.POST)
	public String updateFaqOK(FaqVO vo) {
		log.info("/updateFaqOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1){
			return "redirect:selectOneFaq.do?id="+vo.getId();
		}else {
			return "redirect:updateFaq.do?id="+vo.getId();
		}
	}
	
	@RequestMapping(value = "/deleteFaqOK.do", method = RequestMethod.GET)
	public String deleteFaqOK(FaqVO vo) {
		log.info("/deleteFaqOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:selectAllFaq.do";
		}else {
			return "redirect:selectOneFaq.do?id="+vo.getId();
		}
	}
	
}