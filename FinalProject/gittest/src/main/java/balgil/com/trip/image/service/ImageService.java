package balgil.com.trip.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.image.model.ImageDAO;
import balgil.com.trip.image.model.ImageVO;

@Service
public class ImageService {

	@Autowired
	ImageDAO dao;
	
	public int insert(ImageVO vo) {
		return dao.insert(vo);
	}
	
	public int delete(ImageVO vo) {
		return dao.delete(vo);
	}

	public List<ImageVO> selectAll(ImageVO vo) {
		return dao.selectAll(vo);
	}

	public List<ImageVO> selectComm(ImageVO vo) {
		return dao.selectComm(vo);
	}
}