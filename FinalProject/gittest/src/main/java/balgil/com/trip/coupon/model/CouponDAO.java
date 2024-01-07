package balgil.com.trip.coupon.model;

import java.util.List;

public interface CouponDAO {
	
	List<CouponVO> selectAll();

	CouponVO selectOne(CouponVO vo);

	List<CouponVO> selectList(CouponVO vo);
	
	void updateTime();

	int insert(CouponVO vo);

}