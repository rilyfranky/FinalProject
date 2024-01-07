package balgil.com.trip.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.reservation.model.ReservationDAO;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationService {

	@Autowired
	ReservationDAO dao;

	public ReservationService() {
		log.info("ReservationService()...");
	}

	public int insert(ReservationVO vo) {
		return dao.insert(vo);
	}

	public int update(ReservationVO vo) {
		return dao.update(vo);
	}

	public List<ReservationVO> selectAll(ReservationVO vo) {
		return dao.selectAll(vo);
	}

	public List<ReservationVO> selectCancel(ReservationVO vo) {
		return dao.selectCancel(vo);
	}

	public ReservationVO selectOne(ReservationVO vo) {
		return dao.selectOne(vo);
	}

	public int deleteOne(ReservationVO vo) {
		return dao.deleteOne(vo);
	}

	public List<ReservationVO> selectExpired(ReservationVO vo) {
		return dao.selectExpired(vo);
	}

	public int updatedComments(String res_id) {
		return dao.updatedComments(res_id);
	}

	public int updatedNoComments(String res_id) {
		return dao.updatedNoComments(res_id);
	}

	public List<ReservationVO> selectNoComments(ReservationVO vo) {
		return dao.selectNoComments(vo);
	}

}