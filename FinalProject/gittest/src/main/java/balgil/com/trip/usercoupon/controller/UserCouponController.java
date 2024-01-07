package balgil.com.trip.usercoupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.coupon.model.CouponVO;
import balgil.com.trip.coupon.service.CouponService;
import balgil.com.trip.usercoupon.model.UserCouponVO;
import balgil.com.trip.usercoupon.service.UserCouponService;
import balgil.com.trip.users.model.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserCouponController {
	
	@Autowired
	CouponService c_service;
	
	@Autowired
	UserCouponService service;
	
	@RequestMapping(value = "/selectAllUserCoupon.do", method = RequestMethod.GET)
	public String selectAllUserCoupon(UserCouponVO vo, Model model) {
		log.info("/selectAllUserCoupon.do...{}", vo);

		List<UserCouponVO> vos = service.selectAll(vo);
		log.info("vos: {}", vos);
		model.addAttribute("vos", vos);

		return "users/selectAllUserCoupon";
	}
	
	@ResponseBody
	@RequestMapping(value = "/userCoupon_insertOK.do", method = RequestMethod.GET)
	public String userCoupon_insertOK(UserCouponVO vo) {
		log.info("/userCoupon_insertOK.do...{}", vo);
		
		CouponVO vo1 = new CouponVO();
		vo1.setCode(vo.getCouponcode());
		CouponVO vo2 = c_service.selectOne(vo1);
		log.info("vo2:{}", vo2);
		
		UserCouponVO vo3 = service.selectUsed(vo);
		log.info("{}", vo3);
		
		if(vo2!=null && vo3==null) {
			int result = service.insert(vo);
			log.info("result:{}", result);
			
			if(result==1) {
				return "{\"result\":\"OK\"}";
			} else {
				return "{\"result\":\"NotOK\"}";
			}
			
		} else return "{\"result\":\"NotOK\"}";

	}
	
}