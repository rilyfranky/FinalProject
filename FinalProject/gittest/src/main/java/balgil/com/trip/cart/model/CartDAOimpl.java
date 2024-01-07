package balgil.com.trip.cart.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAOimpl implements CartDAO {

	@Autowired
	SqlSession sqlSession;

	public CartDAOimpl() {
		log.info("CartDAOimpl()...");
	}

	@Override
	public int insertOne(CartVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("CART_INSERT_ONE", vo);
	}

	@Override
	public List<CartVO> selectAll(CartVO vo) {
		log.info("selectAll()...{}", vo);

		List<CartVO> vos = sqlSession.selectList("CART_SELECT_ALL", vo);
		return vos;
	}

	@Override
	public int deleteOneCart(CartVO vo) {
		return sqlSession.delete("CART_DELETE_ONE", vo);
	}

	@Override
	public CartVO selectOne(CartVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("CART_SELECT_ONE", vo);
	}

	@Override
	public int insertCountUp(CartVO vo) {
		log.info("insertCountUp()...{}", vo);

		return sqlSession.update("CART_INSERT_COUNT_UP", vo);
	}

	@Override
	public int updateOneCart(CartVO vo) {
		log.info("updateOneCart()...{}", vo);

		return sqlSession.update("CART_UPDATE_COUNT", vo);
	}

	@Override
	public void updateTime() {
		log.info("updateTime()...");

		sqlSession.update("CART_UPDATE_TIME");
	}

}
