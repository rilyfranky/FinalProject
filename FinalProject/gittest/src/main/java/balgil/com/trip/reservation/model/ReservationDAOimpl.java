package balgil.com.trip.reservation.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReservationDAOimpl implements ReservationDAO {

	@Autowired
	SqlSession sqlSession;

	public ReservationDAOimpl() {
		log.info("ReservationDAOimpl()...");
	}

	@Override
	public int insert(ReservationVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("RESERVATION_INSERT", vo);
	}

	@Override
	public int update(ReservationVO vo) {
		log.info("update()...{}", vo);

		return sqlSession.update("RESERVATION_UPDATE", vo);
	}

	@Override
	public List<ReservationVO> selectAll(ReservationVO vo) {
		log.info("selectAll()...{}", vo);

		return sqlSession.selectList("RESERVATION_SELECT_ALL", vo);
	}

	@Override
	public List<ReservationVO> selectCancel(ReservationVO vo) {
		log.info("selectCancel()...{}", vo);

		return sqlSession.selectList("CANCEL_RESERVATION_SELECT_ALL", vo);
	}

	@Override
	public ReservationVO selectOne(ReservationVO vo) {
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("RESERVATION_SELECT_ONE", vo);
	}

	@Override
	public int deleteOne(ReservationVO vo) {
		log.info("deleteOne()...{}", vo);

		return sqlSession.delete("RESERVATION_DELETE", vo);
	}

	@Override
	public void updateTime() {
		log.info("updateTime()...");
		
		sqlSession.update("RESERVATION_UPDATE_TIME");
	}

	@Override
	public List<ReservationVO> selectExpired(ReservationVO vo) {
		log.info("selectExpired()...{}", vo);

		return sqlSession.selectList("EXPIRED_RESERVATION_SELECT_ALL", vo);
	}

	@Override
	public int updatedComments(String res_id) {
		log.info("updatedComments()...{}", res_id);

		return sqlSession.update("RESERVATION_COMMENTS", res_id);
	}

	@Override
	public List<ReservationVO> selectNoComments(ReservationVO vo) {
		log.info("selectNoComments()...{}", vo);

		return sqlSession.selectList("EXPIRED_RESERVATION_SELECT_NOCOMMENTS", vo);
	}

	@Override
	public int updatedNoComments(String res_id) {
		log.info("updatedNoComments()...{}", res_id);

		return sqlSession.update("RESERVATION_NO_COMMENTS", res_id);
	}

}