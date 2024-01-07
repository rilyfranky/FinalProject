package balgil.com.trip.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.faq.model.FaqDAO;
import balgil.com.trip.faq.model.FaqVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FaqService {
	
	@Autowired
	FaqDAO dao;
	
	public FaqService() {
		log.info("FaqService...");
	}
	
	public int insert(FaqVO vo) {
		return dao.insert(vo);
	}
	
	public int update(FaqVO vo) {
		return dao.update(vo);
	}
	
	public FaqVO selectOne(FaqVO vo) {
		return dao.selectOne(vo);
	}
	
	public int delete(FaqVO vo) {
		return dao.delete(vo);
	}
	
	public List<FaqVO> selectAll(){
		return dao.selectAll();
	}

	public List<FaqVO> searchFaq(String searchKey, String searchWord) {
		return dao.searchFaq(searchKey, searchWord);
	}
	
}