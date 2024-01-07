package balgil.com.trip.image.model;

import lombok.Data;

@Data
public class ImageVO {
	private int id;
	private String name;
	private String user_id;
	private int comment_id;
	private int act_id;
}