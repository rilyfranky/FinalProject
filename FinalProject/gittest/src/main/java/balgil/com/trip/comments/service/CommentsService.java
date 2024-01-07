package balgil.com.trip.comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import balgil.com.trip.comments.model.CommentsDAO;
import balgil.com.trip.comments.model.CommentsVO;
import balgil.com.trip.reservation.model.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentsService {
	
	@Autowired
	CommentsDAO dao;
	
	public CommentsService() {
		log.info("CommentsService...");
	}
	
	public List<CommentsVO> selectAll(){
		return dao.selectAll();
	}
	
	public  List<CommentsVO> selectCommentList(CommentsVO vo) {
		return dao.selectCommentList(vo);
	}
	
	public  CommentsVO selectCommentOne(CommentsVO vo) {
		return dao.selectCommentOne(vo);
	}
	
	public int insert(CommentsVO vo) {
		return dao.insert(vo);
	}
	
	public int update(CommentsVO vo) {
		return dao.update(vo);
	}
	
	public int delete(CommentsVO vo) {
		return dao.delete(vo);
	}
	
	public CommentsVO selectPrevious(CommentsVO vo) {
		return dao.selectPrevious(vo);
	}

	public List<CommentsVO> selectWrittenComments(CommentsVO vo) {
		return dao.selectWrittenComments(vo);
	}

	public CommentsVO selectOneComments(CommentsVO vo) {
		return dao.selectMyOneComments(vo);
	}

	@Transactional
	public int likeComment(int id) {
		int likesCount = dao.getLikesCount(id);
        likesCount++;
        dao.updateLikesCount(id, likesCount);
        return likesCount;
	}

	public int updateLikes(CommentsVO vo) {
		// TODO Auto-generated method stub
		return dao.updateLikes(vo);
	}


}