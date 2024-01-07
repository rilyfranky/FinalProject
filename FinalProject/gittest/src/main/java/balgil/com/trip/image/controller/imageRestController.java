package balgil.com.trip.image.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.image.model.ImageVO;
import balgil.com.trip.image.service.ImageService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class imageRestController {

	@Autowired
	ImageService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllImage.do", method = RequestMethod.GET)
	public List<ImageVO> jsonSelectAllImage(ImageVO vo) {
		log.info("jsonSelectAllImage.do..{}",vo);
		return service.selectAll(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectCommImage.do", method = RequestMethod.GET)
	public List<ImageVO> jsonSelectCommImage(ImageVO vo) {
		log.info("jsonSelectCommImage.do..{}",vo);
		return service.selectComm(vo);
	}
	
}