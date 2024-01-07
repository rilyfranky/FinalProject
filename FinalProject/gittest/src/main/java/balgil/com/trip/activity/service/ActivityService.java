package balgil.com.trip.activity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.activity.model.ActivityDAO;
import balgil.com.trip.activity.model.ActivityVO;

@Service
public class ActivityService {
 
	@Autowired
	ActivityDAO dao;

	public int insert(ActivityVO vo) {
		return dao.insert(vo);
	}

	//인자가 없으면 selectAllUserAct.do에 쓰일 selectAll임
	public List<ActivityVO> selectAll() {
		return dao.selectAllUser();
	}
	
	public List<ActivityVO> selectAll(ActivityVO vo) {
		return dao.selectAll(vo);
	}

	public List<ActivityVO> searchAct(String seller_id, String searchKey, String searchWord) {
		return dao.searchList(seller_id,searchKey, searchWord);
	}

	public ActivityVO selectOne(ActivityVO vo) {
		return dao.selectOne(vo);
	}

	public int update(ActivityVO vo) {
		return dao.update(vo);
	}

	public int delete(ActivityVO vo) {
		return dao.delete(vo);
	}

	public void vcountUp(ActivityVO vo) {
		dao.updateVcount(vo);
	}
	
	public void updateRate(ActivityVO vo) {
		dao.updateRate(vo);
	}

	public List<ActivityVO> selectRecommended() {
		return dao.selectRecommended();
	}

	public List<ActivityVO> selectPopular() {
		return dao.selectPopular();
	}

}