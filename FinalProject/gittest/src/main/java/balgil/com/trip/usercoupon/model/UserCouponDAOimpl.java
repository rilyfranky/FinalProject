package balgil.com.trip.usercoupon.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserCouponDAOimpl implements UserCouponDAO {

	@Autowired
	SqlSession sqlSession;

	public UserCouponDAOimpl() {
		log.info("UserCouponDAOimpl()...");
	}

	@Override
	public List<UserCouponVO> selectAll(UserCouponVO vo) {
		log.info("selectAll()...{}", vo);

		List<UserCouponVO> vos = sqlSession.selectList("USERCOUPON_SELECTALL", vo);

		return vos;
	}

	@Override
	public int updateCouponUse(String user_id, String code) {
		log.info("updateCouponUse()...{}, {}", user_id, code);

		UserCouponVO vo = new UserCouponVO();
		vo.setUser_id(user_id);
		vo.setCouponcode(code);

		return sqlSession.update("USERCOUPON_USE", vo);
	}

	@Override
	public int updateCouponBack(String user_id, String code) {

		UserCouponVO vo = new UserCouponVO();
		vo.setUser_id(user_id);
		vo.setCouponcode(code);

		return sqlSession.update("USERCOUPON_BACK", vo);
	}

	@Override
	public int insert(UserCouponVO vo) {
		return sqlSession.insert("USERCOUPON_INSERT", vo);
	}

	@Override
	public UserCouponVO selectUsed(UserCouponVO vo) {
		log.info("selectOne()...{}", vo);

		UserCouponVO vo3 = sqlSession.selectOne("USERCOUPON_IF_USED", vo);

		return vo3;
	}

}