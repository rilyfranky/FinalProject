package balgil.com.trip.contact.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ContactDAOimpl implements ContactDAO {

	
	@Autowired
	SqlSession sqlSession;
	
	
	public ContactDAOimpl() {
		log.info("ContactDAOimpl....");
	}
	
	@Override
	public int insert(ContactVO vo) {
		log.info("insertContact()....{}", vo);
		
		return sqlSession.insert("C_INSERT", vo);
	}

	@Override
	public List<ContactVO> selectAll(ContactVO vo) {
		log.info("selectAllContact()....{}", vo);
		
		if(vo.getUser_id()!=null) {
			return sqlSession.selectList("C_SELECT_ALL_USER", vo);
		}else {
			return sqlSession.selectList("C_SELECT_ALL", vo);
		}
		
	}

	@Override
	public ContactVO selectOne(ContactVO vo) {
		log.info("selectOneContact()....{}", vo);
		
		return sqlSession.selectOne("C_SELECT_ONE", vo);
	}

	@Override
	public int delete(ContactVO vo) {
		log.info("deleteContact()....{}", vo);
		
		return sqlSession.delete("C_DELETE", vo);
	}

	
	@Override
	public List<ContactVO> selectAllContact(ContactVO vo) {
	    log.info("selectAll()......{}", vo);
	    return sqlSession.selectList("C_SELECT_ALL_USER", vo);
	}

	@Override
	public int update(ContactVO vo) {
	    log.info("update()......{}", vo);

	    return sqlSession.update("C_UPDATE", vo);
	}

}