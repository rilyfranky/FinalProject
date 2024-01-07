package balgil.com.trip.cart.model;

import java.util.List;

public interface CartDAO {
	
		int insertOne(CartVO vo);
	    
		int deleteOneCart(CartVO vo);
	    
		List<CartVO> selectAll(CartVO vo);
	    
		CartVO selectOne(CartVO vo);

		int insertCountUp(CartVO vo);

		int updateOneCart(CartVO vo);

		void updateTime();

	}