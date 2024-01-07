package balgil.com.trip.route.model;

import java.util.List;

public interface RouteDAO {
	public int insert(RouteVO vo);
	public int update(RouteVO vo);
	public int delete(RouteVO vo);
	public List<RouteVO> selectAll(RouteVO vo);
	public RouteVO selectOne(RouteVO vo);
	public List<RouteVO> searchList(String seller_id, String searchKey, String searchWord);
	public void updateVcount(RouteVO vo);
	public void updateLikeUp(RouteVO vo);
}