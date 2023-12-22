package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;

@Repository
public class MaintenanceDAOImpl implements MaintenanceDAO{
	
	private final String NAMESPACE = "com.itwillbs.mapper.MaintenanceMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insertMaintenance(MaintenanceVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE + ".insertMaintenance", vo);
	}
	
	@Override
	public int updateMaintenance(MaintenanceVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateMaintenance", vo);
	}
	
	@Override
	public int deleteMaintenance(MaintenanceVO vo) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteMaintenance", vo);
	}
	
	@Override
	public int getMaintenanceCount(PageVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".getMaintenanceCount", vo);
	}
	
	@Override
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getMaintenanceList", vo);
	}
}
