package balgil.com.trip.faq.model;

import java.util.List;

public interface FaqDAO {
	public int insert(FaqVO vo);
	
	public int update(FaqVO vo);
	
	public int delete(FaqVO vo);
	
	public List<FaqVO> selectAll();
	
	public FaqVO selectOne(FaqVO vo);

	public List<FaqVO> searchFaq(String searchKey, String searchWord);
	
}