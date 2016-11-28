package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Restaurant;
import com.mycompany.teamapp.dto.Review;

@Component
public class ReviewDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insert(Review review) {
		String sql = "insert into review(revno, revresid, revmid, revcontent, revscore, revdate) values(seq_review_revno.nextval, ?, ?, ?, ?, sysdate)";
		int row = jdbcTemplate.update(
				sql,
				review.getRevresid(),
				review.getRevmid(),
				review.getRevcontent(),
				review.getRevscore()
		);
		return row;		
	}

	public int delete(int revno) {
		String sql = "delete from review where revno=?";
		int row = jdbcTemplate.update(sql, revno);
		return row;
	}

	public Review selectInfo(int revno, int revresid) {
		String sql = "select revno, revresid, revmid, revcontent, revscore, revdate from review where revno=? and revresid=? ";
		List<Review> list =  jdbcTemplate.query(sql, new Object[] {revno, revresid}, new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs, int row) throws SQLException {
				Review review = new Review();
				review.setRevno(rs.getInt("revno"));
				review.setRevresid(rs.getInt("revresid"));
				review.setRevmid(rs.getString("revmid"));
				review.setRevcontent(rs.getString("revcontent"));
				review.setRevscore(rs.getInt("revscore"));
				review.setRevdate(rs.getDate("revdate"));
				return review;
			}	
		});				
		return (list.size() != 0) ? list.get(0) : null;
	}
	
	public List<Restaurant> selectByPage(int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select rn, resid, resname, reslocation, restotaltable, resinfo, restel, rescloseday, resopen, resclose, ressavedfile, resmime ";
		sql += "from ( ";
		sql += "      select rownum as rn, resid, resname, reslocation, restotaltable, resinfo, restel, rescloseday, resopen, resclose, ressavedfile, resmime ";
		sql += "        from ( select resid, resname, reslocation, restotaltable, resinfo, restel, rescloseday, resopen, resclose, ressavedfile, resmime from restaurant order by resid desc) ";
		sql += "	       where rownum <= ? ";
		sql += "      ) ";
		sql += "where rn >= ? ";
		
		List<Restaurant> list = jdbcTemplate.query(sql, 
																	new Object[]{(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage+1) },
																	new RowMapper<Restaurant>() {
			@Override
			public Restaurant mapRow(ResultSet rs, int row) throws SQLException {				
				Restaurant restaurant = new Restaurant();
				restaurant.setResid(rs.getInt("resid"));
				restaurant.setResname(rs.getString("resname"));
				restaurant.setReslocation(rs.getString("reslocation"));
				restaurant.setRestotaltable(rs.getInt("restotaltable"));
				restaurant.setResinfo(rs.getString("resinfo"));
				restaurant.setRestel(rs.getString("restel"));
				restaurant.setRescloseday(rs.getString("rescloseday"));
				restaurant.setResopen(rs.getString("resopen"));
				restaurant.setResclose(rs.getString("resclose"));
				restaurant.setRessavedfile(rs.getString("ressavedfile"));
				restaurant.setResmime(rs.getString("resmime"));
				
				return restaurant;
			}
		});
		return list;
	}

	public List<Review> selectByRevPage(int revresid, int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select rn, revno, revresid, revmid, revcontent, revscore, revdate ";
		sql += "from ( ";
		sql += "      select rownum as rn, revno, revresid, revmid, revcontent, revscore, revdate ";
		sql += "        from ( select revno, revresid, revmid, revcontent, revscore, revdate from review order by revno desc) ";
		sql += "	       where revresid=? and rownum <= ? ";
		sql += "      ) ";
		sql += "where rn >= ? ";
		
		List<Review> list = jdbcTemplate.query(sql, 
																	new Object[]{revresid, (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage+1) },
																	new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs, int row) throws SQLException {				
				Review review = new Review();
				review.setRevno(rs.getInt("revno"));
				review.setRevresid(rs.getInt("revresid"));
				review.setRevmid(rs.getString("revmid"));
				review.setRevcontent(rs.getString("revcontent"));
				review.setRevscore(rs.getInt("revscore"));
				review.setRevdate(rs.getDate("revdate"));
				return review;
			}
		});
		return list;
	}

	public int count() {
		String sql = "select count(*) from review";							
		int count = jdbcTemplate.queryForObject(sql, Integer.class);		   
		return count;																		
	}		
}
