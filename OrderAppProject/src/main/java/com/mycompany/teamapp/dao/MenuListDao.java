package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.MenuList;
import com.mycompany.teamapp.service.MemberService;


@Component
public class MenuListDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private MenuList menuList;
	
	
	public int insert(MenuList menuList){
		String sql="insert into menulist(mlname,mlresid,mlprice,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime) values(?,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				menuList.getMlname(),
				menuList.getMlresid(),
				menuList.getMlprice(),
				menuList.getMlinfo(),
				menuList.getMlsavedfile(),
				menuList.getMlishot(),
				menuList.getMloriginfile(),
				menuList.getMlmime()
				);
		return row;
	}
	
	public int update(MenuList menuList){
		String sql="update menulist set mlname=?, mlprice=?, mlinfo=?, mlsavedfile=?, mlishot=? where mlresid=? and mlname=?";
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
		String sql="delete from menulist where mlresid=? and mlname=?";
		int row = jdbcTemplate.update(sql,mlresid,mlname);
		return row;
	}
	
	public List<MenuList> resHotList(boolean mlishot){
		String sql="select mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot from menulist where mlishot=?";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlishot}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));
				menuList.setMlresid(rs.getInt("mlresid"));
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				menuList.setMlishot(rs.getBoolean("mlishot"));
				
				return menuList;
			}
		});
		return list;
		
	}
		
	public int modifyHot(int mlresid,String mlname,boolean mlishot){
		String sql="update menulist set mlprice=?,mlinfo=?,mlsavedfile=? where mlresid=? and mlname=? and mlishot=?";
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
		String sql = "select mlresid,mlname,mlprice,mlinfo,mlsavedfile,mlishot,mloriginfile,mlmime from menulist where mlresid=? and mlname=?";
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

	public List<MenuList> selectByPage(int pageNo, int rowsPerPage, int mlresid) {
		String sql="";
		sql+="select rn, mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from( ";
		sql+="select rownum as rn, mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from (select mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot from menulist order by mlname desc) ";
		sql+="where mlresid=? and rownum<=? ";
		sql+=") ";
		sql+="where rn>=? ";
		
		List<MenuList> list = jdbcTemplate.query(
				sql,
				new Object[]{mlresid,(pageNo*rowsPerPage),((pageNo-1))*rowsPerPage+1},
				new RowMapper<MenuList>(){
					@Override
					public MenuList mapRow(ResultSet rs, int row) throws SQLException {
						MenuList menuList = new MenuList();
						menuList.setMlname(rs.getString("mlname"));
						menuList.setMlresid(rs.getInt("mlresid"));
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
	
	public List<MenuList> selectByHotPage(int pageNo, int rowsPerPage, int mlresid) {
		String sql="";
		sql+="select rn, mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from( ";
		sql+="select rownum as rn, mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot ";
		sql+="from (select mlname, mlresid, mlprice, mlinfo, mlsavedfile, mlishot from menulist where mlresid=? and mlishot=1 order by mlname desc) ";
		sql+="where rownum<=? ";
		sql+=") ";
		sql+="where rn>=? ";
		
		List<MenuList> list = jdbcTemplate.query(
				sql,
				new Object[]{mlresid,(pageNo*rowsPerPage),((pageNo-1))*rowsPerPage+1},
				new RowMapper<MenuList>(){
					@Override
					public MenuList mapRow(ResultSet rs, int row) throws SQLException {
						MenuList menuList = new MenuList();
						menuList.setMlname(rs.getString("mlname"));
						menuList.setMlresid(rs.getInt("mlresid"));
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
	
	public int count(int mlresid){
		String sql="select count(*) from menulist where mlresid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[]{mlresid},Integer.class);
		return count;
	}
	
	public MenuList selectByMlresidAndMlnameAndMlishot(int mlresid, String mlname, boolean mlishot) {
		String sql="select mlresid, mlname, mlprice, mlinfo, mlsavedfile,mloriginfile,mlmime,mlishot from menulist where mlresid=? and mlname=? and mlishot=?";
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
		String sql="select mlname, mlprice from menulist where mlresid=? ";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));	
				menuList.setMlprice(rs.getInt("mlprice"));
				return menuList;
			}
		});
		return list;
	}
	
	/*public List<MenuList> selectList(int mlresid) {
		String sql="select mlname, mlprice, mlinfo, mlsavedfile from menulist where mlresid=? ";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));	
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				return menuList; 
			}
		});
		return list;
	}

	public List<MenuList> selectHotList(int mlresid, boolean mlishot) {
		String sql="select mlname, mlprice, mlinfo, mlsavedfile from menulist where mlresid=? and mlishot=? ";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{mlresid,mlishot}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));	
				menuList.setMlprice(rs.getInt("mlprice"));
				menuList.setMlinfo(rs.getString("mlinfo"));
				menuList.setMlsavedfile(rs.getString("mlsavedfile"));
				return menuList; 
			}
		});
		return list;
	}*/
	
	public int hotMenuCount(int mlresid) {
		String sql="select count(*) from menulist where mlresid=? and mlishot=1";
		int count = jdbcTemplate.queryForObject(sql, new Object[]{mlresid}, Integer.class);
		return count;
	}
}