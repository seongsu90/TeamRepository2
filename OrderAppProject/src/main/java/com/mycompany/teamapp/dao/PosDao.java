package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Event;
import com.mycompany.teamapp.dto.Pos;
import com.mycompany.teamapp.dto.Reservation;

@Component
public class PosDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insert(Pos pos) {
		String sql = "insert into pos(ptableno, presid, pmlname, pcount) values(?, ?, ?, ?)";
		int row = jdbcTemplate.update(
				sql,
				pos.getPtableno(),
				pos.getPresid(),
				pos.getPmlname(),
				pos.getPcount()
		);
		return row;		
	}

	public int update(Pos pos) {
		String sql = "update pos set pmlname=?, pcount=? where presid=? and ptableno=?";
		int row = jdbcTemplate.update(
				sql,
				pos.getPmlname(),
				pos.getPcount(),
				pos.getPresid(),
				pos.getPtableno()
				
		);
		return row;
	}

	public int delete(int presid, int ptableno) {
		String sql = "delete from pos where presid=? and ptableno=?";
		int row = jdbcTemplate.update(sql, presid, ptableno);
		return row;
	}
	
	public List<Pos> selectInfo(int presid, int ptableno) {
		String sql = "select presid, ptableno, pmlname, pcount from pos where presid=? and ptableno=?";
		List<Pos> list =  jdbcTemplate.query(sql, new Object[] {presid, ptableno}, new RowMapper<Pos>() {
			@Override
			public Pos mapRow(ResultSet rs, int row) throws SQLException {
				Pos pos = new Pos();
				pos.setPresid(rs.getInt("presid"));
				pos.setPtableno(rs.getInt("ptableno"));	
				pos.setPmlname(rs.getString("pmlname"));
				pos.setPcount(rs.getInt("pcount"));		
							
				return pos;
			}	
		});				
		return list;
	}

	public List<Integer> calc(int presid, int ptableno) {
		String sql = "";
				sql += "select (m.mlprice * p.pcount) price ";
				sql += "from pos p, menulist m ";
				sql += "where p.presid = m.mlresid ";
				sql += "and p.pmlname = m.mlname ";
				sql += "and p.presid = ? ";
				sql += "and p.ptableno = ? ";
		
		List<Integer> list =  jdbcTemplate.query(sql, new Object[] {presid, ptableno}, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int row) throws SQLException {
				
				return rs.getInt("price");
			}
		});
		
		return list;
	}
	
	public List<Pos> list(int presid) {
		String sql = "select presid, ptableno, pmlname, pcount from pos where presid=? order by ptableno";
		List<Pos> list = jdbcTemplate.query(sql, new Object[] {presid}, new RowMapper<Pos>() {
			@Override
			public Pos mapRow(ResultSet rs, int row) throws SQLException {
				Pos pos = new Pos();	
				pos.setPresid(rs.getInt("presid"));
				pos.setPtableno(rs.getInt("ptableno"));
				pos.setPmlname(rs.getString("pmlname"));
				pos.setPcount(rs.getInt("pcount"));
					
				return pos;
			}
		});
		return list;
	}

/*	public List<MenuList> selectMenu(int presid) {
		String sql="select mlname from menulist where mlresid=? ";
		List<MenuList> list = jdbcTemplate.query(sql, new Object[]{presid}, new RowMapper<MenuList>() {
			@Override
			public MenuList mapRow(ResultSet rs, int row) throws SQLException {
				MenuList menuList = new MenuList();
				menuList.setMlname(rs.getString("mlname"));				
				return menuList;
			}
		});
		return list;
	}*/

/*	public List<Reservation> reservList(int presid) {
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
	}*/

/*	public Coupon checkCoupon(String cbmid, int cbnumber) {
		String sql = "select c.cnumber, c.cname, c.cdday, c.cinfo, c.cresid, c.cdiscount "; 
				 sql += "from coupon c, couponbox cb ";
				 sql += "where c.cnumber = cb.cbnumber ";
				 sql += "and cb.cbmid = ? ";
				 sql += "and cb.cbnumber = ? ";
		
		List<Coupon> list =  jdbcTemplate.query(sql, new Object[] {cbmid, cbnumber}, new RowMapper<Coupon>() {
			@Override
			public Coupon mapRow(ResultSet rs, int row) throws SQLException {
				Coupon coupon = new Coupon();
				coupon.setCnumber(rs.getInt("cnumber"));
				coupon.setCname(rs.getString("cname"));
				coupon.setCdday(rs.getDate("cdday"));
				coupon.setCinfo(rs.getString("cinfo"));
				coupon.setCresid(rs.getInt("cresid"));
				coupon.setCdiscount(rs.getInt("cdiscount"));
				return coupon;
			}
		});
		return (list.size() != 0) ? list.get(0) : null;
	}*/
	
	public List<Integer> checkEvent(int eresid, int ptableno) {
		String sql = "";
				sql += "select (e.eprice * p.pcount) eventprice "; 
				sql += "from event e, pos p ";				
				sql += "where e.emlname = p.pmlname ";				
				sql += "and sysdate between e.estart and e.eend ";
				sql += "and e.eresid = p.presid ";
				sql += "and p.presid = ? ";
				sql += "and p.ptableno = ? ";				
		
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{eresid, ptableno}, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int row) throws SQLException {				
				
				return rs.getInt("eventprice");
			}
		});
		return list;			
	}

	public int count(int presid) {
		String sql ="select count(distinct(ptableno)) from pos where presid = ? ";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;	
	}
}
