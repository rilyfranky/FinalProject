package balgil.com.trip.reservation.model;

import lombok.Data;

@Data
public class ReservationVO {

	private String id;
	private int act_id;
	private String act_name;
	private String res_date;
	private int quantity;
	private int price;
	private int price_total;
	private int price_final;
	private int iscommented;
	private int iscanceled;
	private String user_id;
	private String img_name;

}