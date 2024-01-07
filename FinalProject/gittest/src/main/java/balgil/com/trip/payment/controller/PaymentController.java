package balgil.com.trip.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import balgil.com.trip.payment.model.PaymentVO;
import balgil.com.trip.payment.service.PaymentService;
import balgil.com.trip.pointhistory.service.PointHistoryService;
import balgil.com.trip.reservation.model.ReservationVO;
import balgil.com.trip.reservation.service.ReservationService;
import balgil.com.trip.usercoupon.service.UserCouponService;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired
	PaymentService pay_service;
	
	@Autowired
	ReservationService res_service;

	@Autowired
	CartService c_service; 
	
	@Autowired
	UsersService u_service; 
	
	@Autowired
	UserCouponService uc_service; 

	@Autowired
	PointHistoryService p_service; 
	
	Gson gson = new GsonBuilder().create();
	
	@RequestMapping(value = "/insertPaymentOne.do", method = RequestMethod.POST)
	public String insertPaymentOne(PaymentVO vo) {
		log.info("/insertPaymentOne.do");
		log.info("vo: {}", vo);
		
		String res_id = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
        Calendar dateTime = Calendar.getInstance();
        res_id = sdf.format(dateTime.getTime());
        res_id = res_id+"_"+(int)(Math.random()*10000);
		vo.setRes_id(res_id);
		
		int pay_result = pay_service.insert(vo);
		log.info("pay_result : {}", pay_result);
		
		if(pay_result==1) {
			
			int result_user = 0;
			int result_pointHistory = 0;
			
			if(vo.getPoint().equals("0")) {
				result_user = 1;
				result_pointHistory = 1;
			}else {
				result_user = u_service.pointUpdate(vo.getUser_id(), vo.getPoint());
				result_pointHistory = p_service.useInsert(vo.getUser_id(), vo.getPoint());
			}
			
			int result_userCoupon = 0;
			
			if(vo.getCode().equals("0")) {
				result_userCoupon = 1;
			}else {
				result_userCoupon = uc_service.updateCouponUse(vo.getUser_id(), vo.getCode());
			}
			
			if(result_user==1 && result_pointHistory==1 && result_userCoupon==1) {
				ReservationVO resvo = new ReservationVO();
				resvo.setAct_id(vo.getAct_id());
				resvo.setId(vo.getRes_id());
				resvo.setPrice(vo.getPrice());
				resvo.setPrice_total(vo.getPrice_total());
				resvo.setQuantity(vo.getQuantity());
				resvo.setUser_id(vo.getUser_id());
				String res_date = vo.getRes_date();
				res_date = res_date.substring(0,10);
				log.info(res_date.substring(0,10));
				resvo.setRes_date(res_date);
				
				int res_result = res_service.insert(resvo);
				
				if(res_result==1) {
					CartVO cartvo = new CartVO();
					cartvo.setAct_id(vo.getAct_id());
					cartvo.setUser_id(vo.getUser_id());
					cartvo.setRes_date(res_date);
					cartvo.setQuantity(vo.getQuantity());
					
					CartVO result_cart = c_service.selectOne(cartvo);
					log.info("result_cart:{}", result_cart);
					if(result_cart != null) {
						c_service.deleteOneCart(result_cart);
					}
					return "redirect:reservationComplete.do";
				}else {
					return "redirect:reservationFailure.do";
				}

			}else {
				return "redirect:reservationFailure.do";
			}
		}else {
			return "redirect:reservationFailure.do";
		}
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "/insertManyReservation.do", method = RequestMethod.GET)
//	public String insertManyReservation(@RequestParam(value = "txt_json") String datas) {
//		log.info("/insertManyReservation.do...{}", datas);
//		
//		PaymentVO[] vo_gsons = gson.fromJson(datas, PaymentVO[].class);
//		
//		for (PaymentVO vo : vo_gsons) {
//			log.info(vo.toString());
//		}
//		
//		List<PaymentVO> vos = Arrays.asList(vo_gsons);
//		for (PaymentVO vo : vos) {
//			log.info(vo.toString());
//		}
//		
////		if (result == 1) {
////			return "redirect:reservation_api.do";
////		} else {
//			return "redirect:reservationInsert.do";
////		}
//	}
	

}