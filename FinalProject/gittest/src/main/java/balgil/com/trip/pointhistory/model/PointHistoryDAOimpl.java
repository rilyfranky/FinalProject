package balgil.com.trip.pointhistory.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PointHistoryDAOimpl implements PointHistoryDAO {

	@Autowired
	SqlSession sqlSession;

	public PointHistoryDAOimpl() {
		log.info("CouponDAOimpl()...");
	}

	@Override
	public int useInsert(String user_id, String point) {
		log.info("useInsert()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		int usePoint = Integer.parseInt(point);
		vo.setPoint(-usePoint);
		
		return sqlSession.insert("POINTHISTORY_USE_INSERT", vo);
	}

	@Override
	public int useInsertBack(String user_id, String point) {
		log.info("useInsertBack()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_USE_INSERT_BACK", vo);
	}

	@Override
	public int saveInsert(String user_id, String history, String point) {
		log.info("saveInsert()...");

		PointHistoryVO vo = new PointHistoryVO();
		vo.setUser_id(user_id);
		vo.setHistory(history);
		vo.setPoint(Integer.parseInt(point));
		
		return sqlSession.insert("POINTHISTORY_SAVE_INSERT", vo);
	}

	@Override
	public PointHistoryVO selectOne(String user_id) {
		log.info("selectOne()...", user_id);
		
		return sqlSession.selectOne("POINTHISTORY_SELECT_ONE", user_id);
	}

	@Override
	public List<PointHistoryVO> selectAll(String user_id) {
		log.info("selectAll()...", user_id);

		List<PointHistoryVO> vos = sqlSession.selectList("POINTHISTORY_SELECT_USERS", user_id);
		
		return vos;
	}

}