package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

public interface RequestService {
	
	 public List<RequestVO> requestList() throws Exception;
	 
	 public RequestVO getinfo(String code)throws Exception;
	 
	 public void dataInsertRequest(RequestVO vo) throws Exception;
	 
	 public List<RequestVO> findClient(RequestSearchVO vo)throws Exception;

	public List<RequestVO> ClientList() throws Exception;

	public String findClient(String client_code) throws Exception;
}

