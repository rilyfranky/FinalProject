package balgil.com.trip.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.coupon.model.CouponDAO;
import balgil.com.trip.coupon.model.CouponVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponService {

	@Autowired
	CouponDAO dao;
	
	public CouponService() {
		log.info("CouponService()...");
	}

	public List<CouponVO> selectAll() {
		return dao.selectAll();
	}
	
	public CouponVO selectOne(CouponVO vo) {
		return dao.selectOne(vo);
	}

	public List<CouponVO> selectList(CouponVO vo) {
		return dao.selectList(vo);
	}

	public int insert(CouponVO vo) {
		return dao.insert(vo);
	}

}