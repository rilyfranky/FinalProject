package balgil.com.trip.answer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.answer.model.AnswerDAO;
import balgil.com.trip.answer.model.AnswerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AnswerService {
	@Autowired
	AnswerDAO dao;
	
	public AnswerService() {
		log.info("AnswerService....");
	}
	
	public int insert(AnswerVO vo) {
		return dao.insert(vo);
	}
	
	public int update(AnswerVO vo) {
		return dao.update(vo);
	}
	
	public int delete(AnswerVO vo) {
		return dao.delete(vo);
	}
	
	public List<AnswerVO> selectAll(AnswerVO vo){
		return dao.selectAll(vo);
	}
	
	
   
}