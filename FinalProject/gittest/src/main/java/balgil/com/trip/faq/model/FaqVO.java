package balgil.com.trip.faq.model;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {
	public int id;
	public String title;
	public String content;
	public Date faq_date;
}