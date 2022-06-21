package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Location;

@Repository
public class LocationDAOImpl implements LocationDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-10 민겸
	@Override
	public List<Location> selectGungu(int addressNo) {
		// TODO Auto-generated method stub
		return session.selectList("location.selectGungu", addressNo);
	}

	// 2020-08-09 민겸
	@Override
	public List<Location> selectSido() {
		// TODO Auto-generated method stub
		return session.selectList("location.selectSido");
	}

	// 08/08
	@Override
	public List<Location> selectListSidoFirst() {
		return session.selectList("location.selectListSidoFirst");
	}

	@Override
	public List<Location> selectListSidoSecond(int sido) {
		return session.selectList("location.selectListSidoSecond", sido);
	}

	// 2020-07-31
	@Override
	public Location selectLocationByAddressNo(int addressNo) {
		return session.selectOne("location.selectLocationByAddressNo", addressNo);
	}

	@Override
	public Location selectLocationByLessonNo(int lessonAddressNo) {
		return session.selectOne("location.selectLocationByLessonNo", lessonAddressNo);
	}

}
