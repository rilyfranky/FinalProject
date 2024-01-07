package balgil.com.trip.route.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import balgil.com.trip.activity.model.ActivityVO;
import lombok.Data;

@Data
public class RouteVO {
	private int id;
	private String route_name;
	private String content;
	private String img;
	private String summary;
	private Date date;
	private int likes;
	private int vcount;
	private int dest_id;
	//jsonSelectAll이나 selectOneUserRoute등에 쓰임
	private String dest_name;
	private List<ActivityVO> actVos;
	//
	private String seller_id;
	private int[] rts;
	private MultipartFile file;
}