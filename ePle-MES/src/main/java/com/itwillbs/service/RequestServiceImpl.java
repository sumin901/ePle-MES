package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Inject
	private RequestDAO rdao;

	@Override
	public List<RequestVO> requestList() throws Exception {
		logger.debug("Service : requestList()");
		return rdao.getRequestListAll();
	}
	
	@Override
	public RequestVO getinfo(String code) throws Exception {
		logger.debug("Service : getinfo(String code)"+code);
		return rdao.getRequestDetail(code);
	}
	
	
	@Override
	public String findClient(String client_code) throws Exception {
		// 회사명 찾기
		return null;
	}

	@Override
	public void dataInsertRequest(RequestVO vo) throws Exception {
		logger.debug("Service : dataInsertRequest(RequestVO vo) : "+vo);
		rdao.insertRequest(vo);
		
	}

	@Override
	public List<RequestVO> findClient(RequestSearchVO vo) throws Exception {
		logger.debug("Service : findClient(RequestSearchVO vo) : "+vo);

		return rdao.searchClient(vo);
	}

	@Override
	public List<RequestVO> ClientList() throws Exception {
		logger.debug("Service : ClientList() 회사리스트 뽑기  ");

		return rdao.getClientList();
	}

	
	
	
}
