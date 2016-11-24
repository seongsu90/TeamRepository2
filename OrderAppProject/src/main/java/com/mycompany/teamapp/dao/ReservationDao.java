package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Reservation;



@Component
public class ReservationDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Reservation reservation) {
		String sql = "insert into reservation(rvtime, rvperson, rvmid, rvresid) values(?, ?, ?, ?)";
		int row = jdbcTemplate.update(
				sql,
				reservation.getRvtime(),
				reservation.getRvperson(),
				reservation.getRvmid(),
				reservation.getRvresid()
		);		
		return row;
	}
	
	public int delete(String rvMid, int rvResid) {
		String sql = "delete from reservation where rvmid=? and rvresid=?";
		int row = jdbcTemplate.update( sql, rvMid, rvResid );		
		return row;
	}
	
	public Reservation selectById(String rvMid, int rvResid) {
		String sql = "select * from reservation where rvmid=? and rvresid=?";
		List<Reservation> list = jdbcTemplate.query(sql, new Object[]{rvMid, rvResid}, new RowMapper<Reservation>() {
			@Override
			public Reservation mapRow(ResultSet rs, int row) throws SQLException {
				Reservation reservation = new Reservation();
				reservation.setRvtime(rs.getString("rvtime"));
				reservation.setRvperson(rs.getInt("rvperson"));
				reservation.setRvmid(rs.getString("rvmid"));
				reservation.setRvresid(rs.getInt("rvresid"));
				
				return reservation;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}

	public List<Reservation> selectByPage(String mid,int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select rn, rvtime, rvperson, rvmid, rvresid ";
		sql += "from ( ";
		sql += "select rownum as rn,rvtime, rvperson, rvmid, rvresid ";
		sql += "from (select rvtime, rvperson, rvmid, rvresid from reservation order by rvtime) ";
		sql += "where rvmid=? and rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		
		List<Reservation> list = jdbcTemplate.query(
			sql,
			new Object[]{mid,(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
			new RowMapper<Reservation>() {
				@Override
				public Reservation mapRow(ResultSet rs, int row) throws SQLException {
					Reservation reservation = new Reservation();
					reservation.setRvtime(rs.getString("rvtime"));
					reservation.setRvperson(rs.getInt("rvperson"));
					reservation.setRvmid(rs.getString("rvmid"));
					reservation.setRvresid(rs.getInt("rvresid"));
					return reservation;
				}					
			}
		);
		return list;
	}

	public int count(){
		String sql="select count(*) from reservation";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	public List<Reservation> reservList(int presid) {
		String sql = "select * from reservation where rvresid=? order by rvtime ";
		List<Reservation> list = jdbcTemplate.query(sql, new Object[]{presid}, new RowMapper<Reservation>() {
			@Override
			public Reservation mapRow(ResultSet rs, int row) throws SQLException {
				Reservation reservation = new Reservation();
				reservation.setRvtime(rs.getString("rvtime"));
				reservation.setRvperson(rs.getInt("rvperson"));
				reservation.setRvmid(rs.getString("rvmid"));
				reservation.setRvresid(rs.getInt("rvresid"));				
				return reservation;
			}
		});
		return list;
	}
}
