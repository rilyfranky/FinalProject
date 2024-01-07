package balgil.com.trip.route.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.destination.model.DestinationVO;
import balgil.com.trip.destination.service.DestinationService;
import balgil.com.trip.route.model.RouteVO;
import balgil.com.trip.route.service.RouteService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RouteController {

	@Autowired
	RouteService service;

	@Autowired
	DestinationService destService;
	
	@Autowired
	ServletContext sContext;

	@RequestMapping(value = "/insertRoute.do", method = RequestMethod.GET)
	public String insertRoute(Model model) {
		log.info("insertRoute.jsp로 이동");
		
		//현재 DB에 있는 여행지를 조회함
		List<DestinationVO> vos = destService.selectAll();
		log.info("destination 조회결과:{}",vos);
		
		model.addAttribute("vos",vos);
		
		return "route/insertRoute";
	}

	@RequestMapping(value = "/insertRouteOk.do", method = RequestMethod.POST)
	public String insertRouteOk(RouteVO vo) throws IllegalStateException, IOException {
		log.info("insertRouteOk..{}", vo);

		// 로컬 이미지 생성
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() == 0) {
			vo.setImg("default.png");
		} else {
			vo.setImg(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + File.separator + vo.getImg());
			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getImg());
			String formatName = vo.getImg().substring(vo.getImg().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else

		int result = service.insert(vo);

		log.info("루트 삽입결과:{}", result);

		if (result == 1) {
			return "redirect:selectAllRoute.do";
		} else {
			return "redirect:insertRoute.do";
		}
	}

	@RequestMapping(value = "/updateRoute.do", method = RequestMethod.GET)
	public String updateRoute(RouteVO vo, Model model) {
		log.info("/insertRoute.jsp...{}", vo);

		RouteVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "route/updateRoute";
	}

	@RequestMapping(value = "/updateRouteOk.do", method = RequestMethod.POST)
	public String updateRouteOk(RouteVO vo) throws IllegalStateException, IOException {
		log.info("/updateRouteOk.do...{}", vo);

		// TODO: 추후 로컬 파일도 삭제하게 해야함
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		// 업로드 한 파일이 없으면 사진에 변경은 없음
		if (getOriginalFilename.length() != 0) {
			vo.setImg(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + File.separator + vo.getImg());
			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getImg());
			String formatName = vo.getImg().substring(vo.getImg().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);
		} // end else

		int result = service.update(vo);

		log.info("수정 성공여부:{}", result);

		if (result == 1) {
			return "redirect:selectOneRoute.do?id=" + vo.getId();
		} else {
			return "redirect:updateRoute.do?id=" + vo.getId();
		}
	}

	@RequestMapping(value = "/deleteRouteOk.do", method = RequestMethod.GET)
	public String deleteRouteOk(RouteVO vo) {
		log.info("deleteRouteOk.do..{}", vo);

		int result = service.delete(vo);

		log.info("삭제 성공여부:{}", result);

		if (result == 1) {
			return "redirect:selectAllRoute.do?seller_id=" + vo.getSeller_id();
		} else {
			return "redirect:selectOneRoute.do?id=" + vo.getId();
		}
	}

	@RequestMapping(value = "/selectAllRoute.do", method = RequestMethod.GET)
	public String selectAllRoute() {
		log.info("selectAllRoute.do..");
		return "route/selectAllRoute";
	}

	@RequestMapping(value = "/selectOneRoute.do", method = RequestMethod.GET)
	public String selectOneRoute(RouteVO vo, Model model) {
		log.info("/selectOneRoute.do...{}", vo);

		RouteVO vo2 = service.selectOne(vo);

		log.info("after select..{}", vo2);

		model.addAttribute("vo2", vo2);

		return "route/selectOneRoute";
	}

	@RequestMapping(value = "/selectOneDestRoute.do", method = RequestMethod.GET)
	public String selectOneDestRoute(RouteVO vo) {
		log.info("selectOneDestRoute.do..{}", vo.getDest_id());
		return "route/selectOneDestRoute";
	}

	@RequestMapping(value = "/selectOneUserRoute.do", method = RequestMethod.GET)
	public String selectOneUserRoute(RouteVO vo) {
		log.info("/selectOneUserRoute.do...{}", vo);

		log.info("루트의 vcount 올립니다...{}", vo.getId());
		service.vcountUp(vo);

		return "route/selectOneUserRoute";
	}

	@ResponseBody
	@RequestMapping(value = "/likeUpRoute.do", method = RequestMethod.GET)
	public String likeUpRoute(RouteVO vo, HttpServletRequest request, HttpServletResponse response) {
		// 요청으로부터 쿠키리스트를 불러온다
		Cookie[] cookies = request.getCookies();

		// 제어용 플래그
		int flag = 0;

		// 쿠키 갯수만큼 반복
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// 1인체로 나오면 isLiked 쿠키는 없는거고 새로 생성해줘야함
				flag = 1;
//				log.info("{}",cookie.getName());
//				log.info("{}",cookie.getValue());

				// 쿠키가 있다면 새로 쿠키를 생성하지 않게 flag를 0으로 만들고 탈출
				if (cookie.getName().equals("isLiked") && cookie.getValue().equals("1")) {
					log.info("isLiked 쿠키 이미 있지롱");
					flag = 0;
					break;
				}
			}
		}

		// 이 조건이 통과하면 쿠키가 없다는뜻이므로 새로 생성하면서 추천수up
		if (flag == 1) {
			service.likeup(vo);
			Cookie isLikedCookie = new Cookie("isLiked", "1");
	        isLikedCookie.setMaxAge(10); //쿠키 수명 설정 초단위
	        
	        response.addCookie(isLikedCookie);
		}
		
		// 리턴에 따라 알람이 달라짐
		if(flag==1) {
			return "{\"result\":\"OK\"}";
		}else {
			return "{\"result\":\"NotOK\"}";
		}
	}

}