package balgil.com.trip.comments.model;

import java.util.List;

import balgil.com.trip.reservation.model.ReservationVO;

public interface CommentsDAO {

    List<CommentsVO> selectAll();

    List<CommentsVO> selectCommentList(CommentsVO vo);

    int insert(CommentsVO vo);

    int update(CommentsVO vo);

    int delete(CommentsVO vo);
    
	CommentsVO selectPrevious(CommentsVO vo);

	List<CommentsVO> selectWrittenComments(CommentsVO vo);

	CommentsVO selectMyOneComments(CommentsVO vo);

	void updateLikesCount(int id, int likesCount);

	int getLikesCount(int id);

	int updateLikes(CommentsVO vo);

	CommentsVO selectCommentOne(CommentsVO vo);

}