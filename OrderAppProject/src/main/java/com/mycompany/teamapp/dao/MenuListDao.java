package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.MenuList;


@Component
public class MenuListDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private MenuList menuList;
	
	public int insert(MenuList menuList){
		String sql="insert into menuList(mlname,mlprice,mlresid,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime) values(?,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				menuList.getMlname(),
				menuList.getMlprice(),
				menuList.getMlresid(),
				menuList.getMlinfo(),
				menuList.getMlsavedfile(),
				menuList.getMlishot(),
				menuList.getMloriginfile(),
				menuList.getMlmime()
				);
		return row;
	}
	
	public int update(MenuList menuList){
		String sql="update menuList set mlname=?, mlprice=?, mlinfo=?, mlsavedfile=?, mlishot=? where mlresid=? and mlname=?";
		int row = jdbcTemplate.update(
				sql,
				menuList.getMlname(),
				menuList.getMlprice(),
				menuList.getMlinfo(),
				menuList.getMlsavedfile(),
				menuList.getMlishot(),
				menuList.getMlresid(),
				menuList.getMlname()
				);
		return row;
	}
	
	
	public int delete(int mlresid, String mlname){
		String sql="delete from menuList where mlresid=? and mlname=?";
		int row = jdbcTemplate.update(sql,mlresid,mlname);
		return row;
	}
	
	public List<MenuList> resHotList(boolean mlishot){
		String sql="select mlname, mlprice, mlresid, mlinfo, mlsavedfile, mlishot from menuList where mlishot=?";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlishot}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlresid(rs.getInt("mlresid"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				menuList.setMlishot(rs.getBoolean("mlishot"));
				
				return menuList;
			}
		});
		return list;
		
	}
		
	public int modifyHot(int mlresid,String mlname,boolean mlishot){
		String sql="update menuList set mlprice=?,mlinfo=?,mlsavedfile=? where mlresid=? and mlname=? and mlishot=?";
		int row = jdbcTemplate.update(
				sql,
				menuList.getMlprice(),
				menuList.getMlinfo(),
				menuList.getMlsavedfile(),
				menuList.getMlresid(),
				menuList.getMlname(),
				menuList.getMlishot()
	               );
		return row;
	
	}

	public MenuList selectByMlresidAndMlname(int mlresid, String mlname) {
		String sql = "select mlresid,mlname,mlprice,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime from menuList where mlresid=? and mlname=?";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid,mlname}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlresid(rs.getInt("mlresid"));
				menuList.setMlname(rs.getString("mlname"));
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				menuList.setMlishot(rs.getBoolean("mlishot"));
				menuList.setMloriginfile(rs.getString("mloriginfile"));
				menuList.setMlmime(rs.getString("mlmime"));
				return menuList;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}

	public List<MenuList> selectByPage(int pageNo, int rowsPerPage) {
		String sql="";
		sql+="select rn, mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from( ";
		sql+="select rownum as rn, mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from (select mlresid, mlname, mlprice, mlinfo, mlsavedfile, mlishot from menuList order by mlname desc) ";
		sql+="where rownum<=? ";
		sql+=") ";
		sql+="where rn>=? ";
		
		List<MenuList> list = jdbcTemplate.query(
				sql,
				new Object[]{(pageNo*rowsPerPage),((pageNo-1))*rowsPerPage+1},
				new RowMapper<MenuList>(){
					@Override
					public MenuList mapRow(ResultSet rs, int row) throws SQLException {
						MenuList menuList = new MenuList();
						menuList.setMlresid(rs.getInt("mlresid"));
						menuList.setMlname(rs.getString("mlname"));
						menuList.setMlprice(rs.getInt("mlprice"));
						menuList.setMlinfo(rs.getString("mlinfo"));
						menuList.setMlsavedfile(rs.getString("mlsavedfile"));
						menuList.setMlishot(rs.getBoolean("mlishot"));
						return menuList;
					}
					
				}
				);
		return list;
	}
	
	public int count(){
		String sql="select count(*) from menuList";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	public MenuList selectByMlresidAndMlnameAndMlishot(int mlresid, String mlname, boolean mlishot) {
		String sql="select mlresid, mlname, mlprice, mlinfo, mlsavedfile,mloriginfile,mlmime,mlishot from menuList where mlresid=? and mlname=? and mlishot=?";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid,mlname, mlishot}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlresid(rs.getInt("mlresid"));
				menuList.setMlname(rs.getString("mlname"));
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				menuList.setMloriginfile(rs.getString("mloriginfile"));
				menuList.setMlmime(rs.getString("mlmime"));
				return menuList;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}



	public List<MenuList> selectMenu(int mlresid) {
		String sql="select mlname from menulist where mlresid=? ";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));				
				return menuList;
			}
		});
		return list;
	}

}