package balgil.com.trip.image.model;

import java.util.List;

public interface ImageDAO {
	public int insert(ImageVO vo);
	public int delete(ImageVO vo);
	public List<ImageVO> selectAll(ImageVO vo);
	public List<ImageVO> selectComm(ImageVO vo);
}