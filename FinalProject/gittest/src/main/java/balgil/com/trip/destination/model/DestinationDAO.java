package balgil.com.trip.destination.model;

import java.util.List;

public interface DestinationDAO {
	
	int insert(DestinationVO vo);

	List<DestinationVO> selectAll(DestinationVO vo);

	List<DestinationVO> selectAll();

	DestinationVO selectOne(DestinationVO vo);

}