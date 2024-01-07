package balgil.com.trip.comments.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.comments.model.CommentsVO;
import balgil.com.trip.comments.service.CommentsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentsRestController {

	@Autowired
	CommentsService service;
	
	@RequestMapping(value = "/rest_api.do", method = RequestMethod.GET)
	public String rest_api() {
		log.info("/rest_api.do");

		return "rest_api";
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_comments_selectAll.do", method = RequestMethod.GET)
	public List<CommentsVO> json_comments_selectAll() {
		log.info("/json_comments_selectAll.do");
		
		List<CommentsVO> vos = service.selectAll();
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_comments_selectOne.do", method = RequestMethod.GET)
	public CommentsVO json_comments_selectOne(CommentsVO vo) {
		log.info("/json_comments_selectOne.do...{}",vo);
		
		CommentsVO vo2 = service.selectCommentOne(vo);
		log.info("comment result: {}",vo2);
		if(vo2==null) vo2 = vo;
		return vo2;
	}

}