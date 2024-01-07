package balgil.com.trip.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.answer.model.AnswerVO;
import balgil.com.trip.answer.service.AnswerService;
import balgil.com.trip.contact.model.ContactVO;
import balgil.com.trip.contact.service.ContactService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerController {

	@Autowired
	AnswerService answerservice;
	
	@Autowired
	ContactService service;
	
	@RequestMapping(value = "/deleteAnswerOK.do", method = RequestMethod.GET)
	public String deleteAnswerOK(AnswerVO vo) {
		log.info("/deleteAnswerOK.do...{}", vo);
		
		int result = answerservice.delete(vo);
		log.info("result..{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getContact_id();
	}
	
	@RequestMapping(value = "/insertAnswerOK.do", method = RequestMethod.GET)
	public String insertAnswerOK(AnswerVO vo) {
		log.info("/insertAnswerOK.do....");
		
		int result = answerservice.insert(vo);
		log.info("result...{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getId();
		
	}
	
	
	@RequestMapping(value = "/updateAnswerOK.do", method = RequestMethod.GET)
	public String updateAnswerOK(AnswerVO vo) {
		log.info("/updateAnswerOK.do....");
		
		int result = answerservice.update(vo);
		log.info("result...{}", result);
		
		return "redirect:selectOneContact.do?id="+vo.getContact_id();
	}
	
	
	
	
}
	
