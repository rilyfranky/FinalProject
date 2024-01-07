package balgil.com.trip.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.activity.service.ActivityService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActivityRestController {

	@Autowired
	ActivityService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSelectAllAct(ActivityVO vo) {
		log.info("jsonSelectAllAct.do..{}",vo);
		return service.selectAll(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectAllUserActImg.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSelectAllUserActImg() {
		log.info("jsonSelectAllUserActImg.do..{}");
		return service.selectAll();
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectPopularAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSelectPopularAct() {
		log.info("jsonSelectPopularAct.do..{}");
		return service.selectPopular();
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSelectRecommendedAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSelectRecommendedAct() {
		log.info("jsonSelectRecommendedAct.do..{}");
		return service.selectRecommended();
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSearchAct.do", method = RequestMethod.GET)
	public List<ActivityVO> jsonSearchAct(String seller_id, String searchKey, String searchWord) {
		log.info("jsonSearchAct.do..");
		log.info("유저:{}",seller_id);
		log.info("키:{}",searchKey);
		log.info("워드:{}",searchWord);
		return service.searchAct(seller_id,searchKey,searchWord);
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonActSelectOne.do", method = RequestMethod.GET)
	public ActivityVO jsonActSelectOne(ActivityVO vo) {
		log.info("ActSelectOne.do...{}", vo);
		
		ActivityVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
	}
	
}