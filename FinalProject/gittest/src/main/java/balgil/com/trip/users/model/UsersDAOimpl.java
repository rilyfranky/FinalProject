package balgil.com.trip.users.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UsersDAOimpl implements UsersDAO {

	@Autowired
	SqlSession sqlSession;

	public UsersDAOimpl() {
		log.info("MemberDAOimpl()...");
	}

	@Override
	public UsersVO selectOne(UsersVO vo) { //json용
		log.info("selectOne()...{}", vo);

		return sqlSession.selectOne("USER_SELECT_ONE", vo);
	}

	@Override
	public int insert(UsersVO vo) {
		log.info("insert()...{}", vo);

		return sqlSession.insert("U_INSERT", vo);
	}

	@Override
	public int update(UsersVO vo) {
		log.info("update()...{}", vo);

		return sqlSession.update("U_UPDATE", vo);
	}

	@Override
	public int delete(UsersVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("U_DELETE", vo);
	}

	@Override
	public UsersVO login(UsersVO vo) {
		log.info("login()...{}", vo);
		return sqlSession.selectOne("LOGIN", vo);
	}

	@Override
	public UsersVO idCheck(UsersVO vo) {
		log.info("idCheck()...{}", vo);
		return sqlSession.selectOne("U_ID_CHECK", vo);
	}

	@Override
	public int pointUpdate(String user_id, String point) {
		log.info("pointUpdate()...{},{}", user_id, point);

		UsersVO vo = new UsersVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));

		return sqlSession.update("USERPOINT_UPDATE", vo);
	}

	@Override
	public int pointInsert(String user_id, String point) {
		log.info("pointInsert()...{},{}", user_id, point);

		UsersVO vo = new UsersVO();
		vo.setUser_id(user_id);
		vo.setPoint(Integer.parseInt(point));

		return sqlSession.update("USERPOINT_INSERT", vo);
	}

	@Override
	public List<UsersVO> selectUsersRecord(UsersVO vo) {
		log.info("selectUsersRecord()...{}", vo);

		return sqlSession.selectList("USER_RECORD", vo);
	}

	@Override
	public int typeUpdate(UsersVO vo) {
		log.info("typeUpdate()...{}", vo);

		return sqlSession.update("U_TYPE_UPDATE", vo);
	}

	@Override
	public List<UsersVO> selectAllSeller() {
		log.info("selectAllSeller()...");

		return sqlSession.selectList("U_SELECT_ALL_SELLER");
	}

	@Override
	public List<UsersVO> selectAllUser() {
		log.info("selectAllUser()...");

		return sqlSession.selectList("U_SELECT_ALL_USER");
	}

	@Override
	public List<UsersVO> searchListSeller(String searchKey, String searchWord) {
		log.info("searchListSeller()...searchKey:{}", searchKey);
		log.info("searchListSeller()...searchWord:{}", searchWord);
		
		String key = "";
		if (searchKey.equals("name")) {
			key = "SELLER_SEARCH_LIST_NAME";
		} else {
			key = "SELLER_SEARCH_LIST_USER_ID";
		}

		return sqlSession.selectList(key, "%"+searchWord+"%");
	}

	@Override
	public List<UsersVO> searchListUser(String searchKey, String searchWord) {
		log.info("searchListUser()...searchKey:{}", searchKey);
		log.info("searchListUser()...searchWord:{}", searchWord);
		
		String key = "";
		if (searchKey.equals("name")) {
			key = "USER_SEARCH_LIST_NAME";
		} else {
			key = "USER_SEARCH_LIST_USER_ID";
		}

		return sqlSession.selectList(key, "%"+searchWord+"%");
	}

	@Override
	public int sellerTypeUpdate(UsersVO vo) {
		log.info("sellerTypeUpdate()...{}", vo);

		return sqlSession.update("SELLER_TYPE_UPDATE", vo);
	}

	@Override
	public int loginPoint(UsersVO vo2) {
		log.info("loginPoint()...{}", vo2);

		return sqlSession.update("LOGIN_POINT_UPDATE", vo2);
	}

	@Override
	public UsersVO findPassword(UsersVO vo) {
		log.info("findPassword()...{}", vo);

		return sqlSession.selectOne("USER_PASSWORD", vo);
	}

}