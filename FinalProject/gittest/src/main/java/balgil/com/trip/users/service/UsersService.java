package balgil.com.trip.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.users.model.UsersDAO;
import balgil.com.trip.users.model.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UsersService {

	@Autowired
	UsersDAO dao;

	public UsersService() {
		log.info("UsersService()...");
	}

	public UsersVO selectOne(UsersVO vo) { //json용
		return dao.selectOne(vo);
	}

	public int insert(UsersVO vo) {
		return dao.insert(vo);
	}

	public int update(UsersVO vo) {
		return dao.update(vo);
	}

	public int delete(UsersVO vo) {
		return dao.delete(vo);
	}

	public UsersVO login(UsersVO vo) {
		return dao.login(vo);
	}

	public UsersVO idCheck(UsersVO vo) {
		return dao.idCheck(vo);
	}

	public int pointUpdate(String user_id, String point) {
		return dao.pointUpdate(user_id, point);
  }

	public int pointInsert(String user_id, String point) {
		return dao.pointInsert(user_id, point);
	}

	public List<UsersVO> selectUsersRecord(UsersVO vo) {
		return dao.selectUsersRecord(vo);
	}

	public int typeUpdate(UsersVO vo) {
		return dao.typeUpdate(vo);
	}

	public List<UsersVO> selectAllSeller() {
		return dao.selectAllSeller();
	}

	public List<UsersVO> selectAllUser() {
		return dao.selectAllUser();
	}

	public List<UsersVO> searchListSeller(String searchKey, String searchWord) {
		return dao.searchListSeller(searchKey, searchWord);
	}

	public List<UsersVO> searchListUser(String searchKey, String searchWord) {
		return dao.searchListUser(searchKey, searchWord);
	}

	public int sellerTypeUpdate(UsersVO vo) {
		return dao.sellerTypeUpdate(vo);
	}

	public int loginPoint(UsersVO vo2) {
		return dao.loginPoint(vo2);
	}

	public UsersVO findPassword(UsersVO vo) {
		return dao.findPassword(vo);
	}
}