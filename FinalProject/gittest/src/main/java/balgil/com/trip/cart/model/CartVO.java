package balgil.com.trip.cart.model;

import balgil.com.trip.activity.model.ActivityVO;
import lombok.Data;

@Data
public class CartVO {
	
    private int id;
    private int quantity;
    private int price;
    private String res_date;
    private String user_id;
    private String act_name;
    private String img_name;
    private int act_id;
//    private ActivityVO activity;

    // 생성자, getter/setter 메서드

//    public String getUser_id() {
//        return user_id;
//    }
//
//    public void setUser_id(String user_id) {
//        this.user_id = user_id;
//    }
//
//    public int getAct_id() {
//        return act_id;
//    }
//
//    public void setAct_id(int act_id) {
//        this.act_id = act_id;
//    }
//
//    public ActivityVO getActivity() {
//        return activity;
//    }
//
//    public void setActivity(ActivityVO activity) {
//        this.activity = activity;
//    }
//
//    public void setAct_name(String act_name) {
//        this.activity.setAct_name(act_name);		
//    }
//
//    public void setPrice(int price) {
//        this.activity.setPrice(price);
//    }

    

}