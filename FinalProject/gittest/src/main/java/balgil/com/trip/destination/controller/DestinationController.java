package balgil.com.trip.destination.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import balgil.com.trip.destination.service.DestinationService;
import balgil.com.trip.destination.model.DestinationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DestinationController {

	@Autowired
	DestinationService service;

	@RequestMapping(value = "/destination.do", method = RequestMethod.GET)
	public String destination() {
		log.info("/destination.do");

		return "destination";
	}

	@RequestMapping(value = "/selectAllDestination.do", method = RequestMethod.GET)
	public String selectAllDestination(@RequestParam("category") String category, Model model) {
		log.info("/selectAllDestination.do");

		DestinationVO vo = new DestinationVO();
		vo.setCategory(category);

		List<DestinationVO> destinations = service.selectAll(vo);
		log.info("{}", destinations);

		model.addAttribute("category", category);
		model.addAttribute("destinations", destinations);

		return "destination/destinationSelectAll";
	}

	@RequestMapping(value = "/selectOneDestination.do", method = RequestMethod.GET)
	public String selectOneDestination(@RequestParam("id") int id, Model model) {
	    log.info("/selectOneDestination.do");

	    DestinationVO vo = new DestinationVO();
	    vo.setId(id);

	    DestinationVO destination = service.selectOne(vo);
	    log.info("{}", destination);

	    model.addAttribute("destination", destination);

	    return "destination/destinationSelectOne";
	}
}