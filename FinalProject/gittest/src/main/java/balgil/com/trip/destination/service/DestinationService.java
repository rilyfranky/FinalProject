package balgil.com.trip.destination.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.destination.model.DestinationDAO;
import balgil.com.trip.destination.model.DestinationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DestinationService {

	@Autowired
	DestinationDAO dao;

	public DestinationService() {
		log.info("DestinationService()...");
	}
	
	public int insert(DestinationVO vo) {
		return dao.insert(vo);
	}

	public List<DestinationVO> selectAll(DestinationVO vo) {
		return dao.selectAll(vo);
	}

	public List<DestinationVO> selectAll() {
		return dao.selectAll();
	}

	public DestinationVO selectOne(DestinationVO vo) {
		return dao.selectOne(vo);
	}

}