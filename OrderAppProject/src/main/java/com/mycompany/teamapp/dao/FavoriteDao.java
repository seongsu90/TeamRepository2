package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class FavoriteDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 즐겨찾기 추가
	public int insert(String fmid, int fresid) {
		String sql = "insert into favorite(fmid, fresid) values(?, ?)";
		int row = jdbcTemplate.update(sql, fmid, fresid);
		return row;
	}

	// 즐겨찾기 삭제
	public int delete(String fmid, int fresid) {
		String sql = "delete from favorite where fmid=? and fresid=?";
		int row = jdbcTemplate.update(sql, fmid, fresid);
		return row;
	}
	
	// 즐겨찾기 목록
	public List<Integer> selectByFmid(String fmid) {
		String sql = "select fresid from favorite where fmid=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] {fmid}, new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				return rs.getInt("fresid");
			}
		});
		return (list.size() != 0)?list : null;	
	}

}
