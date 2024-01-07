package balgil.com.trip.users.model;

import java.util.List;

public interface UsersDAO {

//	List<UsersVO> selectAll();

	UsersVO selectOne(UsersVO vo);
  
	int pointUpdate(String user_id, String point);
	
	int insert(UsersVO vo);

	int update(UsersVO vo);

	int delete(UsersVO vo);

	UsersVO login(UsersVO vo);

	UsersVO idCheck(UsersVO vo);

	int pointInsert(String user_id, String point);

	List<UsersVO> selectUsersRecord(UsersVO vo);

	int typeUpdate(UsersVO vo);

	List<UsersVO> selectAllSeller();

	List<UsersVO> selectAllUser();

	List<UsersVO> searchListSeller(String searchKey, String searchWord);

	List<UsersVO> searchListUser(String searchKey, String searchWord);

	int sellerTypeUpdate(UsersVO vo);
	
	int loginPoint(UsersVO vo2);

	UsersVO findPassword(UsersVO vo);
	
}