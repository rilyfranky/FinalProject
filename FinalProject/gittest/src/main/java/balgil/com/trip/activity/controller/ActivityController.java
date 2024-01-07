package balgil.com.trip.activity.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import balgil.com.trip.activity.model.ActivityVO;
import balgil.com.trip.activity.service.ActivityService;
import balgil.com.trip.destination.model.DestinationVO;
import balgil.com.trip.destination.service.DestinationService;
import balgil.com.trip.image.model.ImageVO;
import balgil.com.trip.image.service.ImageService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActivityController {
	
	@ExceptionHandler(DuplicateKeyException.class)
	public ModelAndView insertActOK_exception() {
		log.info("제목이 중복된다 DuplicateKeyException");
		
		ModelAndView model = new ModelAndView();
		List<DestinationVO> vos = destService.selectAll();
		log.info("destination 조회결과:{}",vos);
		
		model.addObject("vos",vos);
		model.addObject("alertMsg", "상품 이름이 중복됩니다!");
		model.setViewName("activity/insertAct");
		return model;
	}
//	@ExceptionHandler(Exception.class)
//	public ModelAndView Exception_exception() {
//		log.info("아무튼 에러다 Exception");
//		
//		ModelAndView model = new ModelAndView();
//		model.addObject("alertMsg", "뭔가 에러임");
//		model.setViewName("activity/insertAct");
//		return model;
//	}

	@Autowired
	ActivityService service;

	@Autowired
	DestinationService destService;
	
	// 이미지 테이블 업로드용 서비스
	@Autowired
	ImageService imgService;

	@Autowired
	ServletContext sContext;

	@RequestMapping(value = "/insertAct.do", method = RequestMethod.GET)
	public String insertAct(Model model) {
		log.info("insertAct.jsp로 이동");
		
		//현재 DB에 있는 여행지를 조회함
		List<DestinationVO> vos = destService.selectAll();
		log.info("destination 조회결과:{}",vos);
		
		model.addAttribute("vos",vos);
		
		return "activity/insertAct";
	}

	@RequestMapping(value = "/insertActOk.do", method = RequestMethod.POST)
	public String insertActOK(ActivityVO vo) throws IllegalStateException, IOException {
		log.info("insertActOK로 온 데이터:{}", vo);
		log.info("file의 갯수 1이면 파일이 있을수도 없을수도 있음:{}", vo.getFile().size());
		
		//이미지는 최대 5장까지만 업로드 가능함
		if(vo.getFile().size()>5) {
			log.info("이미지가 5장 이상입니다.");
			return "redirect:insertAct.do";
		};
		
		//대표 이미지파일 설정용
		if(vo.getFile().get(0).getSize() == 0) {
			vo.setEng_name("default.png");
		}else {
			vo.setEng_name(vo.getFile().get(0).getOriginalFilename());
		}
		
		int result = service.insert(vo);

		// 상품 입력에 성공하면 이미지를 삽입하기
		if (result == 1) {
			log.info("Insert쿼리 성공!");

			ActivityVO vo2 = service.selectOne(vo);

			log.info("삽입한 결과 가져오기(act_id가 필요해서):{}", vo2.getId());

			// 파일이 없으면 default.png를 대신 image테이블에 넣을 예정
			if (vo.getFile().get(0).getSize() == 0) {
				log.info("파일이 비어있어서 default.png 삽입");
				// 이미지를 서버에 저장
				ImageVO imageVO = new ImageVO();
				imageVO.setName("default.png");
				imageVO.setAct_id(vo2.getId());

				imgService.insert(imageVO);
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
					imageVO.setAct_id(vo2.getId());

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
		}//end if

		if (result == 1) {
			return "redirect:selectAllAct.do";
		} else {
			return "redirect:insertAct.do";
		}
	}

	@RequestMapping(value = "/updateAct.do", method = RequestMethod.GET)
	public String updateAct(ActivityVO vo, Model model) {
		log.info("/updateAct.do...{}", vo);

		ActivityVO vo2 = service.selectOne(vo);
		//현재 DB에 있는 여행지를 조회함
		List<DestinationVO> vos = destService.selectAll();
		log.info("destination 조회결과:{}",vos);
		
		model.addAttribute("vos",vos);
		model.addAttribute("vo2", vo2);

		return "activity/updateAct";
	}

	@RequestMapping(value = "/updateActOk.do", method = RequestMethod.POST)
	public String updateActOk(ActivityVO vo) throws IllegalStateException, IOException {
		log.info("/updateActOk.do...{}", vo);

		//대표 이미지파일 설정용
		if(vo.getFile().get(0).getSize() != 0) {
			vo.setEng_name(vo.getFile().get(0).getOriginalFilename());
		}

		int result = service.update(vo);
		
		//업로드 한 파일이 없으면 사진에 변경은 없음
		if (vo.getFile().get(0).getSize() == 0) {
			log.info("이미지는 변경사항 없음!");
		} else {
			
			// 기존 이미지를 테이블에서 삭제
			ImageVO delete = new ImageVO();
			delete.setAct_id(vo.getId());
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
				imageVO.setAct_id(vo.getId());

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
		}//end if

		if (result == 1) {
			return "redirect:selectOneAct.do?id=" + vo.getId();
		} else {
			return "redirect:updateAct.do?id=" + vo.getId();
		}
	}

	@RequestMapping(value = "/deleteActOk.do", method = RequestMethod.GET)
	public String deleteActOk(ActivityVO vo) {
		log.info("deleteActOk.do..{}", vo);

		int result = service.delete(vo);

		log.info("삭제 성공여부:{}", result);
		
		if (result == 1) {
			return "redirect:selectAllAct.do?seller_id=" + vo.getSeller_id();
		} else {
			return "redirect:selectOneAct.do?id=" + vo.getId();
		}
	}

	@RequestMapping(value = "/selectAllAct.do", method = RequestMethod.GET)
	public String selectAllAct(HttpServletRequest request) {
		// 현재 세션에 저장되어있는 아이디 가져오기
		log.info("/selectAllAct.do..{}님의 찾을 상품목록을 찾습니다", request.getSession().getAttribute("user_id"));

		return "activity/selectAllAct";
	}

	@RequestMapping(value = "/selectOneAct.do", method = RequestMethod.GET)
	public String selectOneAct(ActivityVO vo, Model model) {
		log.info("/selectOneAct.do...{}", vo);

		ActivityVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "activity/selectOneAct";
	}

	@RequestMapping(value = "/selectAllUserAct.do", method = RequestMethod.GET)
	public String selectAllUserAct(Model model) {
		log.info("/selectAllUserAct.do...");
		
		List<ActivityVO> vos = service.selectAll();
		log.info("{}",vos);
		model.addAttribute("vos", vos);
		
		return "activity/selectAllUserAct";
	}

	@RequestMapping(value = "/selectOneUserAct.do", method = RequestMethod.GET)
	public String selectOneUserAct(ActivityVO vo, Model model) {
		log.info("/selectOneUserAct.do...{}", vo);

		service.vcountUp(vo);

		ActivityVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);


		return "activity/selectOneUserAct";
	}

	@RequestMapping(value = "/searchActHome.do", method = RequestMethod.GET)
	public String searchActHome() {
		log.info("/searchActHome.do..");

		return "activity/searchActHome";
	}
	
	
}