package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

@Repository
public class RequestDAOImpl implements RequestDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.requestMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<RequestVO> getRequestListAll() throws Exception {
		logger.debug("DAO 수주정보리스트 getRequestListAll() ");
		return sqlSession.selectList(NAMESPACE+".getRequestList");
	}
	
	

	@Override
	public RequestVO getRequestDetail(String code) throws Exception {
		logger.debug("DAO 수주정보 자세히보기 getRequestDetail(String code) "+code);

		return sqlSession.selectOne(NAMESPACE+".getRequestInfo", code);
	}



	@Override
	public void insertRequest(RequestVO vo) throws Exception {
		logger.debug("DAO 수주 등록하기 insertRequest(RequestVO vo) : "+vo);
		
		sqlSession.insert(NAMESPACE+".insertRequest", vo);
	}
	
	

	@Override
	public List<RequestVO> getClientList() throws Exception {
		logger.debug("DAO 회사리스트뽑기 getClientList() ");
		return sqlSession.selectList(NAMESPACE+".getClientList");
	}

	@Override
	public List<RequestVO> searchClient(RequestSearchVO vo) throws Exception {
		logger.debug("DAO 회사검색하기 searchClient(RequestSearchVO vo) : "+vo);

		return sqlSession.selectList(NAMESPACE+".findCompany", vo);
	}
	
	
	
	
}
