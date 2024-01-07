package balgil.com.trip.route.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.route.model.RouteVO;
import balgil.com.trip.route.service.RouteService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RouteRestController {

	@Autowired
	RouteService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllRoute.do", method = RequestMethod.GET)
	public List<RouteVO> jsonSelectAllRoute(RouteVO vo) {
		log.info("jsonSelectAllRoute.do..{}",vo);
		
		List<RouteVO> vos= service.selectAll(vo);
		log.info("쿼리결과..{}",vos);
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchRoute.do", method = RequestMethod.GET)
	public List<RouteVO> searchRoute(String seller_id, String searchKey, String searchWord) {
		log.info("searchRoute.do..");
		log.info("유저:{}",seller_id);
		log.info("키:{}",searchKey);
		log.info("워드:{}",searchWord);
		return service.searchRoute(seller_id,searchKey,searchWord);
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectOneRoute.do", method = RequestMethod.GET)
	public RouteVO jsonSelectOneRoute(RouteVO vo) {
		log.info("jsonSelectOneRoute.do...{}", vo);
		
		RouteVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
	}
	
}