package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Location;

public interface LocationDAO {

	// 2020-08-10 민겸
	public List<Location> selectGungu(int addressNo);

	// 2020-08-09 민겸
	public List<Location> selectSido();

//	0808
	public List<Location> selectListSidoFirst();

	public List<Location> selectListSidoSecond(int sido);

	// 2020-07-31
	public Location selectLocationByAddressNo(int addressNo);

	public Location selectLocationByLessonNo(int lessonAddressNo);

}
