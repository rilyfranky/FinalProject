package balgil.com.trip.coupon.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CouponDAOimpl implements CouponDAO {

	@Autowired
	SqlSession sqlSession;

	public CouponDAOimpl() {
		log.info("CouponDAOimpl()...");
	}
	
	@Override
	public List<CouponVO> selectList(CouponVO vo) {
		log.info("selectList()...{}", vo);

		List<CouponVO> vos = sqlSession.selectList("COUPON_SELECTLIST", vo);

		return vos;
	}
	
	@Override
	public List<CouponVO> selectAll() {
		log.info("selectAll()...");

		return sqlSession.selectList("COUPON_SELECT_ALL");
	}

	@Override
	public CouponVO selectOne(CouponVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("COUPON_SELECT_ONE", vo);
	}
	
	@Override
	public void updateTime() {
		log.info("updateTime()...");

		sqlSession.update("COUPON_UPDATE_TIME");

	}

	@Override
	public int insert(CouponVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("COUPON_INSERT", vo);
	}

}