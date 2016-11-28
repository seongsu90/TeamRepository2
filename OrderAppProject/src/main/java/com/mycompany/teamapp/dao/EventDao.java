package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.controller.EventController;
import com.mycompany.teamapp.dto.Event;
import com.mycompany.teamapp.dto.Restaurant;

@Component
public class EventDao {
	private static final Logger logger = LoggerFactory.getLogger(EventDao.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insert(Event event){
		logger.info("insert 요청처리");
		String sql="insert into event(ename,eresid,esavedfile,einfo,emlname,eprice,estart,eend,eoriginfile,emime) values(?,?,?,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				event.getEname(),
				event.getEresid(),
				event.getEsavedfile(),
				event.getEinfo(),
				event.getEmlname(),
				event.getEprice(),
				event.getEstart(),
				event.getEend(),
				event.getEoriginfile(),
				event.getEmime()
				);
		return row;
	}
	
	public int delete(int eresid, String emlname){
		logger.info("delete 요청처리");
		String sql="delete from event where eresid=? and emlname=?";
		int row = jdbcTemplate.update(sql, eresid, emlname);
		return row;
	}
	
	public int update(Event event){
		logger.info("update 요청처리");
		String sql = "update event set ename=?, esavedfile=?, einfo=?, eprice=?, estart=?, eend=? where eresid=? and emlname=?";
		int row = jdbcTemplate.update(
				sql,
				event.getEname(),
				event.getEsavedfile(),
				event.getEinfo(),
				event.getEprice(),
				event.getEstart(),
				event.getEend(),
				event.getEresid(),
				event.getEmlname()
				
				);
		return row;
	}
	
	public Event selectByEresidAndEmlname(int eresid, String emlname) {
		logger.info("select 요청처리");
		String sql = "select ename, eresid, esavedfile, einfo, emlname, eprice, estart, eend, eoriginfile, emime from event where eresid=? and emlname=?";
		List<Event> list = jdbcTemplate.query(sql, new Object[]{eresid,emlname}, new RowMapper<Event>() {
			@Override
			public Event mapRow(ResultSet rs, int row) throws SQLException {
				Event event = new Event();
				event.setEname(rs.getString("ename"));
				event.setEresid(rs.getInt("eresid"));
				event.setEsavedfile(rs.getString("esavedfile"));
				event.setEinfo(rs.getString("einfo"));
				event.setEmlname(rs.getString("emlname"));
				event.setEprice(rs.getInt("eprice"));
				event.setEstart(rs.getDate("estart"));
				event.setEend(rs.getDate("eend"));
				event.setEoriginfile(rs.getString("eoriginfile"));
				event.setEmime(rs.getString("emime"));
				return event;
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}
	
	public int count(){
		String sql="select count(*) from event";
		int count=jdbcTemplate.queryForObject(sql, Integer.class);   
		return count;
	}
	
	public List<Event> selectByPage(int pageNo, int rowsPerPage){
		String sql="";
		sql+="select rn, ename, eresid, esavedfile, einfo, emlname, eprice, estart, eend ";
		sql+="from( " ;
		sql+="select rownum as rn, ename, eresid, esavedfile, einfo, emlname, eprice, estart, eend ";
		sql+="from (select ename, eresid, esavedfile, einfo, emlname, eprice, estart, eend from Event order by eresid desc) ";
		sql+="where rownum<=? ";
		sql+=") ";
		sql+="where rn>=? ";
		
		List<Event> list=jdbcTemplate.query(
				sql, 
				new Object[]{(pageNo*rowsPerPage),((pageNo-1)*rowsPerPage+1)},
				new RowMapper<Event>(){
					@Override
					public Event mapRow(ResultSet rs, int row)throws SQLException{
						Event event=new Event();
						event.setEname(rs.getString("ename"));
						event.setEresid(rs.getInt("eresid"));
						event.setEsavedfile(rs.getString("esavedfile"));
						event.setEinfo(rs.getString("einfo"));
						event.setEmlname(rs.getString("emlname"));
						event.setEprice(rs.getInt("eprice"));
						event.setEstart(rs.getDate("estart"));
						event.setEend(rs.getDate("eend"));
						
						return event;
					}
				}
		);
	return list;
	}
	
	/*public List<Integer> checkEvent(int eresid, int ptableno) {
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
	}*/
	
}