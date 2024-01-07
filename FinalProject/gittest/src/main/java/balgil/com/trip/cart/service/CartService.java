package balgil.com.trip.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import balgil.com.trip.cart.model.CartDAO;
import balgil.com.trip.cart.model.CartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {

    @Autowired
    CartDAO dao;
    
    public CartService() {
		log.info("CartService()...");
	}

	public int insertOne(CartVO vo) {
		return dao.insertOne(vo);
	}

	public List<CartVO> selectAllCart(CartVO vo) {
		return dao.selectAll(vo);
	}

	public int deleteOneCart(CartVO vo) {
		return dao.deleteOneCart(vo);
	}

	public CartVO selectOne(CartVO vo) {
		return dao.selectOne(vo);
	}

	public int insertCountUp(CartVO vo) {
		return dao.insertCountUp(vo);
	}

	public int updateOneCart(CartVO vo) {
		return dao.updateOneCart(vo);
	}

   
}