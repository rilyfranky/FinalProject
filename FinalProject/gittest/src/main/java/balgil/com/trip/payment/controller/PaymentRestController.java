package balgil.com.trip.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.payment.model.PaymentVO;
import balgil.com.trip.payment.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentRestController {

	@Autowired
	PaymentService pay_service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonPaymentSelectOne.do", method = RequestMethod.GET)
	public PaymentVO jsonSelectOnePayment(PaymentVO vo) {
		log.info("/jsonSelectOnePayment.do...{}", vo);
		
		PaymentVO vo2 = pay_service.selectOne(vo);
		log.info("vo2: {}", vo2);

		return vo2;
	}

}