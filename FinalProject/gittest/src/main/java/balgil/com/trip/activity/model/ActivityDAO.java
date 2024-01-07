package balgil.com.trip.activity.model;

import java.util.List;

public interface ActivityDAO {
	public int insert(ActivityVO vo);
	public int update(ActivityVO vo);
	public void updateVcount(ActivityVO vo);
	public int delete(ActivityVO vo);
	public List<ActivityVO> selectAll(ActivityVO vo);
	public List<ActivityVO> selectAllUser();
	public ActivityVO selectOne(ActivityVO vo);
	public List<ActivityVO> searchList(String seller_id, String searchKey, String searchWord);
	public List<ActivityVO> selectRecommended();
	List<ActivityVO> selectPopular();
	public void updateRate(ActivityVO vo);
}
