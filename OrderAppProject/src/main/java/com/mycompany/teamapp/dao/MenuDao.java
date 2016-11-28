package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Menu;


@Component
public class MenuDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private Menu menu;
	
	public int insert(Menu menu){
		String sql="insert into menu(mlname,mlprice,mlresid,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime) values(?,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				menu.getMlname(),
				menu.getMlprice(),
				menu.getMlresid(),
				menu.getMlinfo(),
				menu.getMlsavedfile(),
				menu.getMlishot(),
				menu.getMloriginfile(),
				menu.getMlmime()
				);
		return row;
	}
	
	public int update(Menu menu){
		String sql="update menu set mlname=?, mlprice=?, mlinfo=?, mlsavedfile=?, mlishot=? where mlresid=? and mlname=?";
		int row = jdbcTemplate.update(
				sql,
				menu.getMlname(),
				menu.getMlprice(),
				menu.getMlinfo(),
				menu.getMlsavedfile(),
				menu.getMlishot(),
				menu.getMlresid(),
				menu.getMlname()
				);
		return row;
	}
	
	
	public int delete(int mlresid, String mlname){
		String sql="delete from menu where mlresid=? and mlname=?";
		int row = jdbcTemplate.update(sql,mlresid,mlname);
		return row;
	}
	
	public List<Menu> resHotList(boolean mlishot){
		String sql="select mlname, mlprice, mlresid, mlinfo, mlsavedfile, mlishot from menu where mlishot=?";
		List<Menu> list = jdbcTemplate.query(sql, new Object[]{mlishot}, new RowMapper<Menu>() {
			@Override
			public Menu mapRow(ResultSet rs, int row) throws SQLException {
				Menu menu = new Menu();
				menu.setMlname(rs.getString("mlname"));
				menu.setMlprice(rs.getInt("mlprice"));
				menu.setMlresid(rs.getInt("mlresid"));
				menu.setMlinfo(rs.getString("mlinfo"));
				menu.setMlsavedfile(rs.getString("mlsavedfile"));
				menu.setMlishot(rs.getBoolean("mlishot"));
				
				return menu;
			}
		});
		return list;
		
	}
		
	public int modifyHot(int mlresid,String mlname,boolean mlishot){
		String sql="update menu set mlprice=?,mlinfo=?,mlsavedfile=? where mlresid=? and mlname=? and mlishot=?";
		int row = jdbcTemplate.update(
				sql,
				menu.getMlprice(),
				menu.getMlinfo(),
				menu.getMlsavedfile(),
				menu.getMlresid(),
				menu.getMlname(),
				menu.getMlishot()
	               );
		return row;
	
	}

	public Menu selectByMlresidAndMlname(int mlresid, String mlname) {
		String sql = "select mlresid,mlname,mlprice,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime from menu where mlresid=? and mlname=?";
		List<Menu> list = jdbcTemplate.query(sql, new Object[]{mlresid,mlname}, new RowMapper<Menu>() {
			@Override
			public Menu mapRow(ResultSet rs, int row) throws SQLException {
				Menu menu = new Menu();
				menu.setMlresid(rs.getInt("mlresid"));
				menu.setMlname(rs.getString("mlname"));
				menu.setMlprice(rs.getInt("mlprice"));
				menu.setMlinfo(rs.getString("mlinfo"));
				menu.setMlsavedfile(rs.getString("mlsavedfile"));
				menu.setMlishot(rs.getBoolean("mlishot"));
				menu.setMloriginfile(rs.getString("mloriginfile"));
				menu.setMlmime(rs.getString("mlmime"));
				return menu;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}

	public List<Menu> selectByPage(int pageNo, int rowsPerPage) {
		String sql="";
		sql+="select rn, mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from( ";
		sql+="select rownum as rn, mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from (select mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot from menu order by mlname desc) ";
		sql+="where rownum<=? ";
		sql+=") ";
		sql+="where rn>=? ";
		
		List<Menu> list = jdbcTemplate.query(
				sql,
				new Object[]{(pageNo*rowsPerPage),((pageNo-1))*rowsPerPage+1},
				new RowMapper<Menu>(){
					@Override
					public Menu mapRow(ResultSet rs, int row) throws SQLException {
						Menu menu = new Menu();
						menu.setMlresid(rs.getInt("mlresid"));
						menu.setMlname(rs.getString("mlname"));
						menu.setMlprice(rs.getInt("mlprice"));
						menu.setMlinfo(rs.getString("mlinfo"));
						menu.setMlsavedfile(rs.getString("mlsavedfile"));
						menu.setMlishot(rs.getBoolean("mlishot"));
						return menu;
					}
					
				}
				);
		return list;
	}
	
	public int count(){
		String sql="select count(*) from menu";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	public Menu selectByMlresidAndMlnameAndMlishot(int mlresid, String mlname, boolean mlishot) {
		String sql="select mlresid, mlname, mlprice, mlinfo, mlsavedfile,mloriginfile,mlmime,mlishot from menu where mlresid=? and mlname=? and mlishot=?";
		List<Menu> list = jdbcTemplate.query(sql, new Object[]{mlresid,mlname, mlishot}, new RowMapper<Menu>() {
			@Override
			public Menu mapRow(ResultSet rs, int row) throws SQLException {
				Menu menu = new Menu();
				menu.setMlresid(rs.getInt("mlresid"));
				menu.setMlname(rs.getString("mlname"));
				menu.setMlprice(rs.getInt("mlprice"));
				menu.setMlinfo(rs.getString("mlinfo"));
				menu.setMlsavedfile(rs.getString("mlsavedfile"));
				menu.setMloriginfile(rs.getString("mloriginfile"));
				menu.setMlmime(rs.getString("mlmime"));
				return menu;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}
 


	public List<Menu> selectMenu(int mlresid) {
		String sql="select mlname, mlprice from menu where mlresid=? ";
		List<Menu> list = jdbcTemplate.query(sql, new Object[]{mlresid}, new RowMapper<Menu>() {
			@Override
			public Menu mapRow(ResultSet rs, int row) throws SQLException {
				Menu menu = new Menu();
				menu.setMlname(rs.getString("mlname"));	
				menu.setMlprice(rs.getInt("mlprice"));
				return menu;
			}
		});
		return list;
	}

}