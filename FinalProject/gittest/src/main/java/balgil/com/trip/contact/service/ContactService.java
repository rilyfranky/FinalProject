package balgil.com.trip.contact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.contact.model.ContactDAO;
import balgil.com.trip.contact.model.ContactVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContactService {
	
	@Autowired
	ContactDAO dao;
	
	public ContactService() {
		log.info("ContactService()...");
	}
	
	public int insert(ContactVO vo) {
		return dao.insert(vo);
	}
	
	public List<ContactVO> selectAll(ContactVO vo){
		return dao.selectAll(vo);
	}
	
	public ContactVO selectOne(ContactVO vo) {
		return dao.selectOne(vo);
	}
	
	public int delete(ContactVO vo) {
		return dao.delete(vo);
	}
	
	public int update(ContactVO vo) {
		return dao.update(vo);
	}

}