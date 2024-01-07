package balgil.com.trip.coupon.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {

	private String code;
	private String name;
	private int rate;
	private Date expire;
	
}