package balgil.com.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	HttpSession session;
	
	@RequestMapping(value = {"/","/balgil.com"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("hello{}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String admin() {
		log.info("admin");
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/seller.do", method = RequestMethod.GET)
	public String seller() {
		log.info("seller");
		
		return "seller/seller";
	}
}

