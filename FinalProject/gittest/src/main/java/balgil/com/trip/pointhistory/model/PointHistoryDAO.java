package balgil.com.trip.pointhistory.model;

import java.util.List;

import balgil.com.trip.users.model.UsersVO;

public interface PointHistoryDAO {

	int useInsert(String user_id, String point);

	int useInsertBack(String user_id, String point);

	int saveInsert(String user_id, String history, String point);

	PointHistoryVO selectOne(String user_id);

	List<PointHistoryVO> selectAll(String user_id);

}