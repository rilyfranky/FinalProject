package balgil.com.trip.image.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ImageDAOimpl implements ImageDAO {

	@Autowired
	SqlSession sqlSession;

	public ImageDAOimpl() {
		log.info("ImageDAOimpl 생성자 생성...");
	}

	@Override
	public int insert(ImageVO vo) {
		log.info("insert image into com_id:{} or act_id:{}",vo.getComment_id(),vo.getAct_id());
		
		//comment_id가 0이 아니면 상품삽입이고 아니면 후기사진 삽입임
		if(vo.getComment_id()==0) {
			return sqlSession.insert("IMAGE_INSERT_ACT",vo);
		}else {
			return sqlSession.insert("IMAGE_INSERT_COM",vo);
		}
	}
	@Override
	public int delete(ImageVO vo) {
		log.info("delete image from com_id:{} or act_id:{}",vo.getComment_id(),vo.getAct_id());
		
		//comment_id가 0이 아니면 상품사진삭제이고 아니면 후기사진 삭제임
		if(vo.getComment_id()==0) {
			return sqlSession.insert("IMAGE_DELETE_ACT",vo);
		}else {
			return sqlSession.insert("IMAGE_DELETE_COM",vo);
		}
	}

	@Override
	public List<ImageVO> selectAll(ImageVO vo) {
		log.info("selectAll...{}",vo);
		
		//comment_id가 0이 아니면 상품사진선택이고 아니면 후기사진 선택임
		if(vo.getComment_id()==0) {
			return sqlSession.selectList("IMAGE_SELECT_ALL_ACT",vo);
		}else {
			return sqlSession.selectList("IMAGE_SELECT_ALL_COM",vo);
		}
	}

	@Override
	public List<ImageVO> selectComm(ImageVO vo) {
		log.info("selectAll...{}",vo);
		
		return sqlSession.selectList("IMAGE_SELECT_ACT_COMM",vo);
	}
}