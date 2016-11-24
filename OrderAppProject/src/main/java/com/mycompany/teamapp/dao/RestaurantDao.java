package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.teamapp.dto.Favorite;
import com.mycompany.teamapp.dto.Restaurant;

@Component
public class RestaurantDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	public int insert(Restaurant restaurant) {
		String sql="insert into restaurant(resid, resname, reslocation, restotaltable, resinfo, restel, resopen, resclose,  rescloseday, resoriginfile, ressavedfile,  resmime) values(seq_restaurant_resid.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				restaurant.getResname(),
				restaurant.getReslocation(),
				restaurant.getRestotaltable(),
				restaurant.getResinfo(),
				restaurant.getRestel(),
				restaurant.getResopen(),
				restaurant.getResclose(),
				restaurant.getRescloseday(),
				restaurant.getResoriginfile(),
				restaurant.getRessavedfile(),
				restaurant.getResmime()
				);
		return row;
	}

	public int delete(int resid) {
		
		String sql="delete from restaurant where resid=? ";
		int row=jdbcTemplate.update(sql, resid);
		return row;
	}

	public int update(Restaurant restaurant) {
		String sql="update restaurant set resname=?, reslocation=?, restotaltable=?, resinfo=?, restel=?, resopen=?, resclose=?, resoriginfile=?, ressavedfile=?, resmime=?, rescloseday=?  where resid=?";
		int row=jdbcTemplate.update(
				sql,
				restaurant.getResname(),
				restaurant.getReslocation(),
				restaurant.getRestotaltable(),
				restaurant.getResinfo(),
				restaurant.getRestel(),
				restaurant.getResopen(),
				restaurant.getResclose(),
				restaurant.getResoriginfile(),
				restaurant.getRessavedfile(),
				restaurant.getResmime(),
				restaurant.getRescloseday(),
				restaurant.getResid()
				);
		return row;
	}
	
	public List<Restaurant> selectByPage(int pageNo, int rowsPerPage, String find){
		String sql = "";
		sql += "select rn, resid, resname, reslocation, resinfo, restotaltable, restel, resopen, resclose, rescloseday ,ressavedfile ";
		sql += "from( " ;
		sql += "select rownum as rn, resid, resname, reslocation, resinfo, restotaltable, restel, resopen, resclose, rescloseday ,ressavedfile ";
		sql += "from (select resid, resname, reslocation, resinfo, restotaltable, restel, resopen, resclose, rescloseday ,ressavedfile from Restaurant) ";
		sql += "where resname like ? and rownum<=? ";
		sql += ") ";
		sql += "where rn>=? order by resid ";
		
		
		List<Restaurant> list=jdbcTemplate.query(
				sql, 
				new Object[]{"%"+find+"%", (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage+1)},
				new RowMapper<Restaurant>(){
					@Override
					public Restaurant mapRow(ResultSet rs, int row)throws SQLException{
						Restaurant restaurant=new Restaurant();
						restaurant.setResid(rs.getInt("resid"));
						restaurant.setResname(rs.getString("resname"));
						restaurant.setReslocation(rs.getString("reslocation"));
						restaurant.setResinfo(rs.getString("resinfo"));
						restaurant.setRestotaltable(rs.getInt("restotaltable"));
						restaurant.setRestel(rs.getString("restel"));
						restaurant.setResopen(rs.getString("resopen"));
						restaurant.setResclose(rs.getString("resclose"));
						restaurant.setRescloseday(rs.getString("rescloseday"));
						restaurant.setRessavedfile(rs.getString("ressavedfile"));
						
						return restaurant;
					}
				}
		);
	return list;
	}
	


	public Restaurant selectByResid(int resid) {
		String sql="select resid, resname, reslocation, restotaltable, resinfo, restel, rescloseday, resopen, resclose, resoriginfile, ressavedfile, resmime from restaurant where resid=?";
		List<Restaurant> list=jdbcTemplate.query(sql, new Object[]{resid}, new RowMapper<Restaurant>(){
			@Override
			public Restaurant mapRow(ResultSet rs, int row) throws SQLException{
				Restaurant restaurant=new Restaurant();
				restaurant.setResid(rs.getInt("resid"));
				restaurant.setResname(rs.getString("resname"));
				restaurant.setReslocation(rs.getString("reslocation"));
				restaurant.setRestotaltable(rs.getInt("restotaltable"));
				restaurant.setResinfo(rs.getString("resinfo"));
				restaurant.setRestel(rs.getString("restel"));
				restaurant.setRescloseday(rs.getString("rescloseday"));
				restaurant.setResopen(rs.getString("resopen"));
				restaurant.setResclose(rs.getString("resclose"));
				restaurant.setResoriginfile(rs.getString("resoriginfile"));
				restaurant.setRessavedfile(rs.getString("ressavedfile"));
				restaurant.setResmime(rs.getString("resmime"));
			
				return restaurant;
			}
		});
		return (list.size()!=0)? list.get(0) : null;
	}

	public int count(String find){
		String sql="select count(*) from restaurant where resname like ? ";
		int count=jdbcTemplate.queryForObject(sql, new Object[]{"%"+find+"%"}, Integer.class);   
		return count;
	}

	
/*	public static int emptyTableNum(int resid) {
		String sql="select count (distinct ptableno) from Pos where resid=? ";
		jdbcTemplate.
		return ;
	}*/
	
	
	
}
