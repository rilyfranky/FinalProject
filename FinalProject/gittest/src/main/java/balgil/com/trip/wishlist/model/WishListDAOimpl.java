package balgil.com.trip.wishlist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class WishListDAOimpl implements WishListDAO {

    @Autowired
    SqlSession sqlSession;

    public WishListDAOimpl() {
        log.info("WishListDAOimpl()...");
    }

    @Override
    public int insertWishList(WishListVO vo) {
        log.info("insertWishList()...{}", vo);
    
        int result=0;

      //없으면 위시리스트 추가, 없으면 제거
        try {
          result = sqlSession.insert("WISHLIST_INSERT", vo);
        } catch (Exception e) {
          sqlSession.delete("WISHLIST_DELETE",vo);
        }
        return result;
    }

    @Override
    public int delete(WishListVO vo) {
        log.info("delete()...{}", vo);

        return sqlSession.delete("WISHLIST_DELETE", vo);
    }

    @Override
    public List<WishListVO> selectAll(WishListVO vo) {
        log.info("selectAll()...{}", vo);

        return sqlSession.selectList("WISHLIST_SELECT_ALL_WITH_USER_ID", vo);
    }

    @Override
    public WishListVO selectOne(WishListVO vo) {
        log.info("selectOne()...{}", vo);

        return sqlSession.selectOne("WISHLIST_SELECT_ONE", vo);
    }
    
    @Override
    public void addToWishList(String user_id, int act_id) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("user_id", user_id);
        paramMap.put("act_id", act_id);
        sqlSession.insert("ADD_TO_WISHLIST", paramMap);
    }

}