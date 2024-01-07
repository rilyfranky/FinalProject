package balgil.com.trip.comments.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.activity.service.ActivityService;
import balgil.com.trip.comments.model.CommentsVO;
import balgil.com.trip.comments.service.CommentsService;
import balgil.com.trip.image.model.ImageVO;
import balgil.com.trip.image.service.ImageService;
import balgil.com.trip.reservation.model.ReservationVO;
import balgil.com.trip.reservation.service.ReservationService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentsController {
	@Autowired
	CommentsService service;

	@Autowired
	ActivityService aservice;

	@Autowired
	ReservationService rservice;

	@Autowired
	ImageService imgService;

	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;

	@RequestMapping(value = "/selectAllComments.do", method = RequestMethod.GET)
	public String selectAllComments(Model model) {
		log.info("/selectAllComments.do");

		List<CommentsVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return "comments/selectAll";
	}

	@RequestMapping(value = "/selectOneComments.do", method = RequestMethod.GET) // 후기 상세
	public String selectOneComments(Model model, CommentsVO vo) {
		log.info("/selectOneComments.do... {}", vo);

		List<CommentsVO> vos = service.selectCommentList(vo);
		log.info("vos: {}", vos);

		model.addAttribute("vos", vos);

		return "comments/selectOne";
	}

	@RequestMapping(value = "/updateLikes.do", method = RequestMethod.GET) // 후기 상세
	public String updateLikes(Model model, CommentsVO vo) {
	    log.info("/updateLikes.do... {}", vo);
	    
	    String user_id = (String) session.getAttribute("user_id");
	    String updateLikesSession = (String) session.getAttribute("updateLikesSession");
	    if (updateLikesSession == null || !updateLikesSession.equals(user_id + vo.getId())) {
	        session.setAttribute("updateLikesSession", user_id + vo.getId());
	        int result = service.updateLikes(vo);
	        log.info("result: {}", result);
	    }
	    
	    return "redirect:selectOneComments.do?act_id=" + vo.getAct_id();
	}

	@RequestMapping(value = "/comments.do", method = RequestMethod.GET)
	public String comments() {
		log.info("/comments.do");
		return "comments";
	}

	@RequestMapping(value = "/selectMyComments.do", method = RequestMethod.GET) // 작성가능한 후기
	public String selectMyComments(ReservationVO vo, Model model) {
		log.info("/selectMyComments.do...{}", vo);

		List<ReservationVO> vos = rservice.selectNoComments(vo);
		log.info("{}", vos);

		model.addAttribute("vos", vos);

		return "comments/selectMyComments";
	}

	@RequestMapping(value = "/selectMyWrittenComments.do", method = RequestMethod.GET)
	public String selectMyWrittenComments(CommentsVO vo, Model model) {
		log.info("/selectMyWrittenComments.do...{}", vo);

		List<CommentsVO> vos1 = service.selectWrittenComments(vo);

		model.addAttribute("vos1", vos1);

		return "comments/selectMyComments";
	}

	@RequestMapping(value = "/selectMyOneComments.do", method = RequestMethod.GET)
	public String selectMyOneComments(CommentsVO vo, Model model) {
		log.info("/selectMyOneComments.do...vo:{}", vo);

		CommentsVO vo2 = service.selectOneComments(vo);
		log.info("/selectMyOneComments.do...vo2:{}",vo2);
		model.addAttribute("vo2", vo2);
		
		ImageVO vo1 = new ImageVO();
		vo1.setComment_id(vo2.getId());
		List<ImageVO> vos = imgService.selectAll(vo1);
		log.info("vos:{}", vos);
		model.addAttribute("vos", vos);
		
		return "comments/selectOneMyComments";
	}
	
	@RequestMapping(value = "/insertComments.do", method = RequestMethod.GET)
	public String insertComments(CommentsVO vo) {
		log.info("/insertComments.do....");

		return "comments/insertComments";
	}

	@RequestMapping(value = "/insertCommentsOK.do", method = RequestMethod.POST)
	public String insertCommentsOK(CommentsVO vo) throws IllegalStateException, IOException {
	    log.info("insertCommentsOK로 온 데이터:{}", vo);
	    log.info("file의 갯수 1이면 파일이 있을수도 없을수도 있음:{}", vo.getFile().size());

	    // 이미지는 최대 5장까지만 업로드 가능함
	    if (vo.getFile().size() > 5) {
	        log.info("이미지가 5장 이상입니다.");
	        return "redirect:insertComments.do";
	    }

	    int result = service.insert(vo);

	    // 상품 입력에 성공하면 이미지를 삽입하기
	    if (result == 1) {
	        log.info("Insert쿼리 성공!");
	        // reservation iscommented 1로 바꿔주기
	        int res_result = rservice.updatedComments(vo.getRes_id());
	        log.info("res_result:{}", res_result);

	        CommentsVO vo2 = service.selectPrevious(vo);
	        log.info("삽입한 결과 가져오기(act_id가 필요해서):{}", vo2.getId());
	        
	        //평점 업데이트
	        ActivityVO tempVo = new ActivityVO();
	        tempVo.setId(vo2.getAct_id());
	        aservice.updateRate(tempVo);
	        
	        // 파일이 없으면 default.png를 대신 image테이블에 넣을 예정
	        if (vo.getFile().get(0).getSize() == 0) {
	            log.info("파일이 비어있어서 null");
	            // 이미지를 서버에 저장
//	            ImageVO imageVO = new ImageVO();
//	            imageVO.setName("");
//	            imageVO.setComment_id(vo2.getId());

//	            imgService.insert(imageVO);
	        } else {
	            // 파일의 갯수만큼 반복!
	            for (MultipartFile vos : vo.getFile()) {
	                String getOriginalFilename = vos.getOriginalFilename();
	                int fileNameLength = vos.getOriginalFilename().length();
	                log.info("getOriginalFilename:{}", getOriginalFilename);
	                log.info("fileNameLength:{}", fileNameLength);

	                // 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
	                String realPath = sContext.getRealPath("resources/uploadimg");
	                log.info("realPath : {}", realPath);

					File f = new File(realPath + File.separator + getOriginalFilename);
	                vos.transferTo(f);

	                // 이미지를 서버에 저장
	                ImageVO imageVO = new ImageVO();
	                imageVO.setName(getOriginalFilename);
	                imageVO.setComment_id(vo2.getId());

	                imgService.insert(imageVO);

	                //// create thumbnail image/////////
	                BufferedImage original_buffer_img = ImageIO.read(f);
	                BufferedImage thumb_buffer_img = new BufferedImage(200, 200, BufferedImage.TYPE_3BYTE_BGR);
	                Graphics2D graphic = thumb_buffer_img.createGraphics();
	                graphic.drawImage(original_buffer_img, 0, 0, 200, 200, null);

	                File thumb_file = new File(realPath + "/thumb_" + getOriginalFilename);
	                String formatName = getOriginalFilename.substring(getOriginalFilename.lastIndexOf(".") + 1);
	                log.info("formatName : {}", formatName);
	                ImageIO.write(thumb_buffer_img, formatName, thumb_file);
	            }
	        }
	    } else {
	        log.info("Insert쿼리 실패..");
	    } // end if

	    if (result == 1) {
	        return "redirect:selectMyComments.do?user_id=" + vo.getUser_id();
	    } else {
	        return "redirect:insertComments.do";
	    }
	}


	@RequestMapping(value = "/updateComments.do", method = RequestMethod.POST)
	public String updateComments(Model model, CommentsVO vo) {
		log.info("/updateComments.do...{}", vo);

		CommentsVO vo2 = service.selectOneComments(vo);
		log.info("vo2:{}", vo2);

		ImageVO vo1 = new ImageVO();
		vo1.setComment_id(vo.getId());
		List<ImageVO> vos = imgService.selectAll(vo1);
		log.info("vos:{}", vos);

		model.addAttribute("vo2", vo2);
		model.addAttribute("vos", vos);

		return "comments/updateComments";
	}

	@RequestMapping(value = "/updateCommentsOK.do", method = RequestMethod.POST)
	public String updateCommentsOK(CommentsVO vo) throws IllegalStateException, IOException {
		log.info("/updateCommentsOK.do...{}", vo);

		int result = service.update(vo);
		log.info("result:{}", result);

		// 업로드 한 파일이 없으면 사진에 변경은 없음
		if (vo.getFile().get(0).getSize() == 0) {
			log.info("이미지는 변경사항 없음!");
		} else {

			// 기존 이미지를 테이블에서 삭제
			ImageVO delete = new ImageVO();
			delete.setComment_id(vo.getId());
			imgService.delete(delete);

			// 파일의 갯수만큼 반복!
			for (MultipartFile vos : vo.getFile()) {
				String getOriginalFilename = vos.getOriginalFilename();
				int fileNameLength = vos.getOriginalFilename().length();
				log.info("getOriginalFilename:{}", getOriginalFilename);
				log.info("fileNameLength:{}", fileNameLength);

				// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
				String realPath = sContext.getRealPath("resources/uploadimg");
				log.info("realPath : {}", realPath);

				File f = new File(realPath + File.separator + getOriginalFilename);
				vos.transferTo(f);

				// 이미지를 서버에 저장
				ImageVO imageVO = new ImageVO();
				imageVO.setName(getOriginalFilename);
				imageVO.setComment_id(vo.getId());

				imgService.insert(imageVO);

				//// create thumbnail image/////////
				BufferedImage original_buffer_img = ImageIO.read(f);
				BufferedImage thumb_buffer_img = new BufferedImage(200, 200, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = thumb_buffer_img.createGraphics();
				graphic.drawImage(original_buffer_img, 0, 0, 200, 200, null);

				File thumb_file = new File(realPath + "/thumb_" + getOriginalFilename);
				String formatName = getOriginalFilename.substring(getOriginalFilename.lastIndexOf(".") + 1);
				log.info("formatName : {}", formatName);
				ImageIO.write(thumb_buffer_img, formatName, thumb_file);
			}
		} // end if

		if (result == 1) {
			return "redirect:selectMyOneComments.do?res_id=" + vo.getRes_id() + "&user_id=" + vo.getUser_id();
		} else {
			return "selectMyWrittenComments.do?user_id=" + vo.getUser_id();
		}
	}

	@RequestMapping(value = "/deleteCommentsOK.do", method = RequestMethod.POST)
	public String deleteCommentsOK(CommentsVO vo) {
		log.info("/deleteCommentsOK.do...{}", vo);

		int result = service.delete(vo);
		log.info("result...{}", result);
		if (result == 1) {
			int res_result = rservice.updatedNoComments(vo.getRes_id());
			log.info("res_result...{}", res_result);
		}

		return "redirect:selectMyComments.do?user_id=" + vo.getUser_id();
	}

	@RequestMapping("/likeComment")
	@ResponseBody
	public int likeReview(@RequestParam("id") int id) {
		int updatedLikesCount = service.likeComment(id);
		return updatedLikesCount;
	}

}