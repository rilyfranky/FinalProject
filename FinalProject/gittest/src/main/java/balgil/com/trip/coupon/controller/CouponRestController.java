package balgil.com.trip.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.coupon.model.CouponVO;
import balgil.com.trip.coupon.service.CouponService;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class CouponRestController {
	
	@Autowired
	CouponService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonCouponSelectList.do", method = RequestMethod.GET)
	public List<CouponVO> jsonCouponSelectList(CouponVO vo) {
		log.info("jsonCouponSelectList.do...{}", vo);
		
		List<CouponVO> vos = service.selectList(vo);
		log.info("vo2: {}", vos);
		
		return vos;
	}
	
}