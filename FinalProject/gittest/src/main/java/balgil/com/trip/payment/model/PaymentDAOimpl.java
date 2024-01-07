package balgil.com.trip.payment.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PaymentDAOimpl implements PaymentDAO {

	@Autowired
	SqlSession sqlSession;

	public PaymentDAOimpl() {
		log.info("PaymentDAOimpl()...");
	}

	@Override
	public int insert(PaymentVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("PAYMENT_INSERT", vo);
	}

	@Override
	public PaymentVO selectOne(PaymentVO vo) {
		
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("PAYMENT_SELECT_ONE", vo);
	}

	@Override
	public PaymentVO selectCancelOne(String res_id) {
		log.info("selectCancelOne()...{}", res_id);

		return sqlSession.selectOne("SELECT_CANCEL_ONE", res_id);
	}

	@Override
	public int deleteOne(String id) {
		log.info("deleteOne()...{}", id);
		
		PaymentVO vo = new PaymentVO();
		vo.setRes_id(id);

		return sqlSession.delete("PAYMENT_DELETE_ONE", vo);
	}

}