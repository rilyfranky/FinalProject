package balgil.com.trip.payment.model;

import lombok.Data;

@Data
public class PaymentVO {

	private int id;
	private int price_total;
	private String method;
	private String coupon;
	private String point;
	private int price_final;
	private String res_id;
// Payment 완료 후 Reservation에 넘겨줘야 할 부분
	private String user_id;
	private int act_id;
	private String res_date;
	private int quantity;
	private int price;
	private String code;
	
}