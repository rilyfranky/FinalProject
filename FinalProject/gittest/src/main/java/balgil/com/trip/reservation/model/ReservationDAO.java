package balgil.com.trip.reservation.model;

import java.util.List;

public interface ReservationDAO {

	int insert(ReservationVO vo);

	int update(ReservationVO vo);

	List<ReservationVO> selectAll(ReservationVO vo);

	List<ReservationVO> selectCancel(ReservationVO vo);

	ReservationVO selectOne(ReservationVO vo);

	int deleteOne(ReservationVO vo);

	void updateTime();

	List<ReservationVO> selectExpired(ReservationVO vo);

	int updatedComments(String res_id);

	int updatedNoComments(String res_id);

	List<ReservationVO> selectNoComments(ReservationVO vo);

}