package balgil.com.trip.faq.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FaqDAOimpl implements FaqDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public FaqDAOimpl() {
		log.info("FaqDAOimpl()....");
	}
	
	@Override
	public int insert(FaqVO vo) {
		log.info("insert()....{}", vo);
		return sqlSession.insert("FAQ_INSERT", vo);
	}
	
	
	@Override
	public int update(FaqVO vo) {
		log.info("update()....{}", vo);
		return sqlSession.update("FAQ_UPDATE", vo);
	}
	
	
	@Override
	public int delete(FaqVO vo) {
		log.info("delete()....{}", vo);
		return sqlSession.delete("FAQ_DELETE", vo);
	}
	
	
	@Override
	public List<FaqVO> selectAll(){
		log.info("selectAll()....");
		return sqlSession.selectList("FAQ_SELECT_ALL");
	}
	

	@Override
	public FaqVO selectOne(FaqVO vo) {
		log.info("selectOne()...{}", vo);
		
		return sqlSession.selectOne("FAQ_SELECT_ONE",vo);
	}

	@Override
	public List<FaqVO> searchFaq(String searchKey, String searchWord) {
		log.info("searchFaq()....{}, {}", searchKey, searchWord);
		
		String key = "";
		if(searchKey.equals("title")) {
			key = "FAQ_SEARCH_LIST_TITLE";
		}else {
			key = "FAQ_SEARCH_LIST_CONTENT";
		}
		
		return sqlSession.selectList(key, "%"+searchWord+"%");
	}
	


}