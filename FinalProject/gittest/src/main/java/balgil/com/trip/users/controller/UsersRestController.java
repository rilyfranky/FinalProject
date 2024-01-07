package balgil.com.trip.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.users.model.UsersVO;
import balgil.com.trip.users.service.UsersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UsersRestController {

	@Autowired
	UsersService service;
	
	@ResponseBody
	@RequestMapping(value = "/json_u_idCheck.do", method = RequestMethod.GET)
	public String json_u_idCheck(UsersVO vo) {
		log.info("/json_u_idCheck.do...{}",vo);
		
		UsersVO vo2 = service.idCheck(vo);
		log.info("{}",vo2);
		if(vo2==null) {
			return "{\"result\":\"OK\"}";
		}else {
			return "{\"result\":\"NotOK\"}";
		}
		
	}

  	@ResponseBody
	@RequestMapping(value = "/jsonUsersSelectOne.do", method = RequestMethod.GET)
	public UsersVO jsonUsersSelectOne(UsersVO vo) {
		log.info("jsonUserSelectOne.do...{}", vo);
		
		UsersVO vo2 = service.selectOne(vo);
		log.info("vo2: {}", vo2);
		
		return vo2;
  	}//end jsonUserSelectOne - sha
  	
}