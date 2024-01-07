package balgil.com.trip.route.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RouteDAOimpl implements RouteDAO {

	@Autowired
	SqlSession sqlSession;

	public RouteDAOimpl() {
		log.info("RouteDAOimpl 생성자 생성...");
	}

	@Override
	public int insert(RouteVO vo) {
		return sqlSession.insert("ROUTE_INSERT",vo);
	}

	@Override
	public int update(RouteVO vo) {
		//RT1~RT5를 NULL로 만들어 주는 작업을 함
		sqlSession.update("ROUTE_BEFORE_UPDATE",vo);
		
		return sqlSession.update("ROUTE_UPDATE",vo);
	}

	@Override
	public int delete(RouteVO vo) {
		return sqlSession.delete("ROUTE_DELETE",vo);
	}

	@Override
	public List<RouteVO> selectAll(RouteVO vo) {
		return sqlSession.selectList("ROUTE_SELECT_ALL",vo);
	}

	@Override
	public RouteVO selectOne(RouteVO vo) {
		return sqlSession.selectOne("ROUTE_SELECT_ONE", vo);
	}

	@Override
	public List<RouteVO> searchList(String seller_id, String searchKey, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchWord", "%"+searchWord+"%");
		map.put("searchKey", searchKey);
		map.put("seller_id", seller_id);
		log.info(map.toString());
		
		//셀러 아이디가 비어있으면 유저가 찾는것
		if(map.get("seller_id") != null) {
			return sqlSession.selectList("ROUTE_SEARCH_LIST", map);
		}else {
			return sqlSession.selectList("ROUTE_SEARCH_LIST_USER", map);
		}
	}

	@Override
	public void updateVcount(RouteVO vo) {
		sqlSession.update("ROUTE_VCOUNTUP",vo);
	}

	@Override
	public void updateLikeUp(RouteVO vo) {
		sqlSession.update("ROUTE_LIKEUP",vo);
	}

}