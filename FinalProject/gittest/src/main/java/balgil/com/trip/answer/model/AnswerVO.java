package balgil.com.trip.answer.model;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private int id;
	private String content;
	private Date ans_date;
	private String seller_id;
	private int contact_id;
}