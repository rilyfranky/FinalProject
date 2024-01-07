package balgil.com.trip.pointhistory.model;

import java.sql.Date;

import lombok.Data;

@Data
public class PointHistoryVO {

	private String user_id;
	private String history;
	private int point;
	private Date point_date;
	
}