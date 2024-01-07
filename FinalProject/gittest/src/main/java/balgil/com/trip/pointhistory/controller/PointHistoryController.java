package balgil.com.trip.pointhistory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import balgil.com.trip.pointhistory.service.PointHistoryService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PointHistoryController {
	
	@Autowired
	PointHistoryService service;
	
//	@RequestMapping(value = "/pointHistorySelectAll.do", method = RequestMethod.GET)
//	public String pointHistorySelectAll(PointHistoryVO vo, Model model) {
//		log.info("pointHistorySelectAll.do...{}", vo);
//		
//		List<PointHistoryVO> vos = service.selectAll(vo);
//		log.info("vo2: {}", vos);
//		
//		model.addAttribute("vos", vos);
//		
//		return "users/myPoint";
//	}
	
}