package balgil.com.trip.wishlist.model;

import java.util.List;

public interface WishListDAO {

    int insertWishList(WishListVO vo);

    int delete(WishListVO vo);

    List<WishListVO> selectAll(WishListVO vo);

    WishListVO selectOne(WishListVO vo);
    
    void addToWishList(String user_id, int act_id);

}