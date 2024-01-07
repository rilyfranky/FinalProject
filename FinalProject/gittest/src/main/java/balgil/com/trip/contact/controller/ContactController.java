package balgil.com.trip.contact.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import balgil.com.trip.answer.model.AnswerVO;
import balgil.com.trip.answer.service.AnswerService;
import balgil.com.trip.contact.model.ContactVO;
import balgil.com.trip.contact.service.ContactService;
import balgil.com.trip.users.model.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ContactController {

	@Autowired
	ContactService service;

	@Autowired
	AnswerService answerservice;

	@Autowired
	ServletContext sContext;
	
	//관리자, 판매자 페이지에서는 selectAllContact.do?seller_id=~~~~ 이런식으로 받기
	@RequestMapping(value = "/selectAllContact.do", method = RequestMethod.GET)
	public String selectAllContact(ContactVO vo, Model model) {
		log.info("/selectAllContact.do...{}", vo);
		
		List<ContactVO> vos = service.selectAll(vo);
		model.addAttribute("vos", vos);

		return "contact/selectAllContact";
	}
	@RequestMapping(value = "/selectAllUserContact.do", method = RequestMethod.GET)
	public String selectAllUserContact(ContactVO vo, Model model) {
		log.info("/selectAllContact.do...{}", vo);
		
		List<ContactVO> vos = service.selectAll(vo);
		model.addAttribute("vos", vos);
		
		return "contact/selectAllContact";
	}

	@RequestMapping(value = "/selectOneContact.do", method = RequestMethod.GET)
	public String selectOnecontact(ContactVO vo, Model model) {
		log.info("/selectOneContact.do....{}", vo);

		ContactVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);

		AnswerVO avo = new AnswerVO();
		avo.setContact_id(vo.getId());
		List<AnswerVO> coms = answerservice.selectAll(avo);
		log.info("{}", coms);

		model.addAttribute("coms", coms);

		return "contact/selectOneContact";
	}

	@RequestMapping(value = "/insertContact.do", method = RequestMethod.GET)
	public String insertContact() {
		log.info("/insertContact.do...");

		return "contact/insertContact";
	}

	@RequestMapping(value = "/insertContactOK.do", method = RequestMethod.POST)
	public String insertContactOK(ContactVO vo) throws IllegalStateException, IOException {
		log.info("/insertContactOK.do....{}", vo);

		// 로컬 이미지 생성
		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() != 0) {
			vo.setAttach_img(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);
	
			File f = new File(realPath + File.separator + vo.getAttach_img());
			vo.getFile().transferTo(f);
	
			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
	
			File thumb_file = new File(realPath + "/thumb_" + vo.getAttach_img());
			String formatName = vo.getAttach_img().substring(vo.getAttach_img().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);
		} else {
			vo.setAttach_img("");
		}
		
		int result = service.insert(vo);
		log.info("result:{}", result);
		if (result == 1) {
			return "redirect:selectAllContact.do?user_id="+vo.getUser_id();
		} else {
			return "redirect:insertContact.do?act_id="+vo.getAct_id()+"&seller_id="+vo.getSeller_id();
		}
	}

	@RequestMapping(value = "/updateContact.do", method = RequestMethod.GET)
	public String updateContact(ContactVO vo, Model model) {
		log.info("/updateContact.do...{}", vo);

		ContactVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return "contact/updateContact";
	}

	@RequestMapping(value = "/updateContactOK.do", method = RequestMethod.POST)
	public String updateContactOK(ContactVO vo) {
		log.info("/updateContactOK.do...{}", vo);

		int result = service.update(vo);
		log.info("result...{}", result);

		if (result == 1) {
			return "redirect:selectOneContact.do?id=" + vo.getId();
		} else {
			return "redirect:updateContact.do?id=" + vo.getId();
		}
	}

	@RequestMapping(value = "/deleteContactOK.do", method = RequestMethod.GET)
	public String deleteContactOK(ContactVO vo) {
		log.info("/deleteContactOK.do....{}", vo);

		int result = service.delete(vo);
		log.info("result...{}", result);

		if (result == 1) {
			return "redirect:selectAllContact.do?user_id="+vo.getUser_id();
		} else {
			return "redirect:selectOneContact.do?id=" + vo.getId();
		}
	}

}