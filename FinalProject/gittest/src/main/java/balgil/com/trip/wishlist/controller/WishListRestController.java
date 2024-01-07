package balgil.com.trip.wishlist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.wishlist.service.WishListService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishListRestController {

    @Autowired
    WishListService service;

    @ResponseBody
    @RequestMapping(value = "/addWish", method = RequestMethod.POST)
    public String addWish(@RequestParam("user_id") String user_id, @RequestParam("act_id") int act_id) {
        service.addToWishList(user_id, act_id);

        return "success"; // 클라이언트에게 응답을 보내기 위한 값입니다.
    }

}