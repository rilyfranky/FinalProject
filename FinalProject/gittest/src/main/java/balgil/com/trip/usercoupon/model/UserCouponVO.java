package balgil.com.trip.usercoupon.model;

import java.sql.Date;

import lombok.Data;

@Data
public class UserCouponVO {
	
	private String user_id;
	private String couponcode;
	private int isused;
	private String code;
	private String name;
	private int rate;
	private Date expire;
	
}