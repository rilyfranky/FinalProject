package balgil.com.trip.usercoupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.usercoupon.model.UserCouponVO;
import balgil.com.trip.usercoupon.service.UserCouponService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserCouponRestController {
	
	@Autowired
	UserCouponService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonUserCouponSelectAll.do", method = RequestMethod.GET)
	public List<UserCouponVO> jsonUserCouponSelectAll(UserCouponVO vo) {
		log.info("jsonUserCouponSelectAll.do...{}", vo);
		
		List<UserCouponVO> vos = service.selectAll(vo);
		log.info("vos: {}", vos);
		
		return vos;
	}
}