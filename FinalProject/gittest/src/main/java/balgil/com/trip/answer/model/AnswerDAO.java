package balgil.com.trip.answer.model;

import java.util.List;

public interface AnswerDAO {
	
	public int insert(AnswerVO vo);
	
	public int update(AnswerVO vo);
	
	public int delete(AnswerVO vo);
	
	public List<AnswerVO> selectAll(AnswerVO vo);
}
