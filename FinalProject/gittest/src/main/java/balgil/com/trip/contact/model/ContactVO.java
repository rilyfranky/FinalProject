package balgil.com.trip.contact.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ContactVO {
	
	public int id;
	public String title;
	public String content;
	public Date con_date;
	public String attach_img;
	public String user_id;
	public String seller_id;
	public int act_id;
	public String act_name;
	public MultipartFile file;


}