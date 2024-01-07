package balgil.com.trip.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.activity.service.ActivityService;
import balgil.com.trip.cart.model.CartVO;
import balgil.com.trip.cart.service.CartService;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class CartController {

    @Autowired
    CartService cartService;
    private ActivityService activityService;
    
    @Autowired
    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    @RequestMapping(value = "/cart.do", method = RequestMethod.GET)
    public String cart() {
        log.info("/cart");
        return "cart";
    }
    
    //장바구니 화면페이징
    @RequestMapping(value = "/selectAllCart.do", method = RequestMethod.GET)
    public String selectAllCart(CartVO vo, Model model) {
        log.info("/selectAllCart...{}", vo);
        List<CartVO> cartList = cartService.selectAllCart(vo);
        log.info("/selectAllCart...{}", cartList);
        
        model.addAttribute("cartList", cartList);
        return "cart/cart";
    }
    
    //장바구니에 추가했을 때 사용자 장바구니에 같은 상품이 같은 일자에 있으면 수량을 올려준다
    @ResponseBody
    @RequestMapping(value = "/insertOneCart.do", method = RequestMethod.POST)
    public String insertOneCart(CartVO vo) {
        log.info("/insertOneCart...{}", vo);
        
        CartVO vo1 = cartService.selectOne(vo);
        log.info("result: {}", vo1);
        
        int result_insert = 0;
        int result_insertUp = 0;
        if(vo1!=null) {
        	vo.setId(vo1.getId());
        	result_insertUp = cartService.insertCountUp(vo);
        }else {
        	result_insert = cartService.insertOne(vo);
        }
        log.info("result_insert: {}", result_insert);
        log.info("result_insertUp: {}", result_insertUp);

		// 둘중 하나라도 성공적이면 OK를 반환 
		if(result_insert>=1||result_insertUp>=1) {
			return "{\"result\":\"OK\"}";
		}else {
			return "{\"result\":\"NotOK\"}";
		}
    }

  //장바구니에서 수량 조절
    @RequestMapping(value = "/updateOneCart.do", method = RequestMethod.GET)
    public String updateOneCart(CartVO vo) {
    	log.info("updateOneCart: {}", vo);
    	int result_update = cartService.updateOneCart(vo);	

    	log.info("result_update: {}",result_update);
    	
    	return "redirect:selectAllCart.do?user_id="+vo.getUser_id(); // 수정 후 장바구니 페이지로 리다이렉트
    }
    
    //장바구니에서 삭제
    @RequestMapping(value = "/deleteOneCart.do", method = RequestMethod.GET)
    public String deleteOneCart(CartVO vo) {
    	log.info("deleteOneCart: {}", vo);
    	int result_delete = cartService.deleteOneCart(vo);
    	log.info("result: {}", result_delete);
    	return "redirect:selectAllCart.do?user_id="+vo.getUser_id(); // 삭제 후 장바구니 페이지로 리다이렉트
    }
    
}
