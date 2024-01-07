package balgil.com.trip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import balgil.com.trip.cart.model.CartDAO;
import balgil.com.trip.coupon.model.CouponDAO;
import balgil.com.trip.reservation.model.ReservationDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class schedulerService {
	
	@Autowired
	ReservationDAO res_dao;
	
	@Autowired
	CartDAO cart_dao;
	
	@Autowired
	CouponDAO cou_dao;
	
	@Scheduled(cron="0 0 0 * * *")
	public void scheduleRun(){
		log.info("00시 정각에 실행");
		res_dao.updateTime();
		cart_dao.updateTime();
		cou_dao.updateTime();
		
	}
	
}