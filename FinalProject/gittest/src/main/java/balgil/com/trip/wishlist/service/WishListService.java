package balgil.com.trip.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.wishlist.model.WishListDAO;
import balgil.com.trip.wishlist.model.WishListVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WishListService {

	@Autowired
	WishListDAO dao;

	public WishListService() {
		log.info("WishListService()...");
	}

	public int  insertWishList(WishListVO vo) {
		return dao.insertWishList(vo);
	}

	public int delete(WishListVO vo) {
		return dao.delete(vo);
	}

	public List<WishListVO> selectAll(WishListVO vo) {
		return dao.selectAll(vo);
	}

	public WishListVO selectOne(WishListVO vo) {
		return dao.selectOne(vo);
	}

	public void addToWishList(String user_id, int act_id) {
		// TODO Auto-generated method stub
		
	}
}