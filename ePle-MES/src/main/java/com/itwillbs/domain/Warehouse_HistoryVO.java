package com.itwillbs.domain;

import lombok.Data;

@Data
public class Warehouse_HistoryVO {
	private int index;
	private String code;
	private String io;
	private String category;
	private int amount;
	private String order_num;
	private String date;
}
