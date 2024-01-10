package com.production.persistence;

import java.sql.Timestamp;
import java.util.List;

import com.production.domain.BOMVO;
import com.production.domain.failedVO;
import com.production.domain.resultVO;

public interface resultDAO {

	public List<resultVO> getResultList(String date, String[] line_code, Boolean isFinish) throws Exception;

	public resultVO getResult(String code) throws Exception;

	public List<failedVO> getFailedList(String code) throws Exception;

	public BOMVO getBOM(String code) throws Exception;

	public List<String> getLine_codeList() throws Exception;

	public void productionStart(String code) throws Exception;
	
	public void productionComplete(String code) throws Exception;
	
	public void addResult(String code) throws Exception;
	
	public void insertFailed(failedVO vo) throws Exception;
}
