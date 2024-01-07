package balgil.com.trip.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.payment.model.PaymentDAO;
import balgil.com.trip.payment.model.PaymentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentService {

	@Autowired
	PaymentDAO dao;

	public PaymentService() {
		log.info("PaymentService()...");
	}

	public int insert(PaymentVO vo) {
		return dao.insert(vo);
	}

	public PaymentVO selectOne(PaymentVO vo) {
		return dao.selectOne(vo);
	}

	public PaymentVO selectCancelOne(String res_id) {
		return dao.selectCancelOne(res_id);
	}

	public int deleteOne(String id) {
		return dao.deleteOne(id);
	}

}