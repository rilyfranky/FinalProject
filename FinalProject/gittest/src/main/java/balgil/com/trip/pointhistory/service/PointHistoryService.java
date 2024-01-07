package balgil.com.trip.pointhistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.pointhistory.model.PointHistoryDAO;
import balgil.com.trip.pointhistory.model.PointHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PointHistoryService {

	@Autowired
	PointHistoryDAO dao;

	public PointHistoryService() {
		log.info("PointHistoryService()...");
	}

	public int useInsert(String user_id, String point) {
		return dao.useInsert(user_id, point);
	}

	public int useInsertBack(String user_id, String point) {
		return dao.useInsertBack(user_id, point);
	}

	public int saveInsert(String user_id, String history, String point) {
		return dao.saveInsert(user_id, history, point);
	}

	public PointHistoryVO selectOne(String user_id) {
		return dao.selectOne(user_id);
	}

	public List<PointHistoryVO> selectAll(String user_id) {
		return dao.selectAll(user_id);
	}

}