package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Coupon;
import com.mycompany.teamapp.dto.CouponBox;
import com.mycompany.teamapp.dto.Reservation;

@Component
public class CouponDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Coupon coupon) {
		String sql = "insert into coupon(cnumber, cname, cdday, cinfo, cresid,cdiscount) values(?, ?, ?, ?, ?, ?)";
		int row = jdbcTemplate.update(
				sql,
				coupon.getCnumber(),
				coupon.getCname(),
				coupon.getCdday(),
				coupon.getCinfo(),
				coupon.getCresid(),
				coupon.getCdiscount()
		);		
		return row;
	}
	
	public int delete(int cnumber) {
		String sql = "delete from coupon where cnumber=?";
		int row = jdbcTemplate.update( sql, cnumber );		
		return row;
	}
	
	public int send(CouponBox couponBox)
	{
		String sql="insert into couponbox(cbmid,cbnumber) values(?,?)";
		int row = jdbcTemplate.update(
				sql,
				couponBox.getCbmid(),
				couponBox.getCbnumber()
		);		
		return row;
	}
	
	public Coupon selectById(int cnumber) {
		String sql = "select cnumber,cname,cdday,cinfo,cresid,cdiscount from coupon where cnumber=?";
		List<Coupon> list = jdbcTemplate.query(sql, new Object[]{cnumber}, new RowMapper<Coupon>() {
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
		return (list.size() != 0)?list.get(0) : null;
	}

	public boolean chkNum(int ranNum) {
		String sql = "select cnumber from coupon where cnumber=?";
		int row = jdbcTemplate.update( sql, ranNum );
		if(row==1)
		{
			return true;
		}
		return false;
	}
	


	public int count() {
		String sql="select count(*) from couponbox";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	public List<CouponBox> selectByPage(String mid,int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select rn, cbmid, cbnumber ";
		sql += "from ( ";
		sql += "select rownum as rn, cbmid, cbnumber ";
		sql += "from (select cbmid, cbnumber from couponbox) ";
		sql += "where cbmid=? and rownum<=?";
		sql += ") ";
		sql += "where rn>=? ";
		
		List<CouponBox> list = jdbcTemplate.query(
			sql,
			new Object[]{mid,(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
			new RowMapper<CouponBox>() {
				@Override
				public CouponBox mapRow(ResultSet rs, int row) throws SQLException {
					CouponBox couponbox = new CouponBox();
					couponbox.setCbmid(rs.getString("cbmid"));
					couponbox.setCbnumber(rs.getInt("cbnumber"));

					return couponbox;
				}					
			}
		);
		return list;
	}
	
	public Coupon checkCoupon(String cbmid, int cbnumber) {
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
	}
	

}
