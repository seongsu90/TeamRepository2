package com.mycompany.teamapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dto.Member;

@Component
public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 회원 가입
	public int insert(Member member) {
		String sql = "insert into member(mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid) values(?, ?, ?, ?, ?, ?, 0, 0, 0)";
		int row = jdbcTemplate.update(
				sql,
				member.getMid(),
				member.getMname(),
				member.getMpassword(),
				member.getMphone(),
				member.getMbirth(),
				member.getMlocation()
		);
		return row;
	}
	
	// 회원 수정, 비밀번호 재설정
	public int update(Member member) {
		String sql = "update member set mname=?, mpassword=?, mphone=?, mbirth=?, mlocation=?, mrank=?, mpoint=?, mresid=? where mid=?";
		int row = jdbcTemplate.update(
				sql,
				member.getMname(),
				member.getMpassword(),
				member.getMphone(),
				member.getMbirth(),
				member.getMlocation(),
				member.getMrank(),
				member.getMpoint(),
				member.getMresid(),
				member.getMid()
		);
		return row;
	}

	// 회원 탈퇴
	public int delete(String mid) {
		String sql = "delete from member where mid=?";
		int row = jdbcTemplate.update(sql, mid);
		return row;		
	}

	// 회원 정보 조회
	public Member selectByMid(String mid) {
		String sql = "select mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid from member where mid=?";
		
		List<Member> list = jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<Member>(){
			@Override
			public Member mapRow(ResultSet rs, int row) throws SQLException {
				Member member = new Member();
				member.setMid(rs.getString("mid"));
				member.setMname(rs.getString("mname"));
				member.setMpassword(rs.getString("mpassword"));
				member.setMphone(rs.getString("mphone"));
				member.setMbirth(rs.getDate("mbirth"));
				member.setMlocation(rs.getString("mlocation"));
				member.setMrank(rs.getInt("mrank"));
				member.setMpoint(rs.getInt("mpoint"));
				member.setMresid(rs.getInt("mresid"));
				return member;
			}
		});
		return (list.size() != 0)?list.get(0) : null;	
	}
	
	// resid로 mid 찾기
	public String selectMidByMresid(int mresid) {
		String sql = "select mid from member where mresid=?";
		
		List<String> list = jdbcTemplate.query(sql, new Object[] {mresid}, new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int row) throws SQLException {
				return rs.getString("mid");
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}

	// 아이디 찾기
	public String selectMidByMnameAndMphone(String mname, String mphone) {
		String sql = "select mid from member where mname=? and mphone=?";
		
		List<String> list = jdbcTemplate.query(sql, new Object[] {mname, mphone}, new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int row) throws SQLException {
				return rs.getString("mid");
			}
		});
		return (list.size() != 0)?list.get(0) : null;
	}
	
	// 회원 목록
	public List<Member> selectByPage(int pageNo, int rowsPerPage, String find) {
		String sql = "";
		sql += "select rn, mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid ";
		sql += "from ( ";
		sql += "select rownum as rn, mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid ";
		sql += "from (select mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid from member order by mrank desc, mid) ";
		sql += "where (mid like ? or mname like ?) and rownum<=? ";
		sql += ") ";
		sql += "where rn>=? order by rn ";
/*		
		sql += "select rn, mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid ";
		sql += "from ( ";
		sql += "select rownum as rn, mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid ";
		sql += "from (select mid, mname, mpassword, mphone, mbirth, mlocation, mrank, mpoint, mresid from member) ";
		sql += "where mid like ? or mname like ? and rownum<=? ";
		sql += ") ";
		sql += "where rn>=? order by rn desc ";
*/
		
		List<Member> list = jdbcTemplate.query(
			sql,
			new Object[]{"%"+find+"%", "%"+find+"%", (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
			new RowMapper<Member>() {
				@Override
				public Member mapRow(ResultSet rs, int row) throws SQLException {
					Member member = new Member();
					member.setMid(rs.getString("mid"));
					member.setMname(rs.getString("mname"));
					member.setMpassword(rs.getString("mpassword"));
					member.setMphone(rs.getString("mphone"));
					member.setMbirth(rs.getDate("mbirth"));
					member.setMlocation(rs.getString("mlocation"));
					member.setMrank(rs.getInt("mrank"));
					member.setMpoint(rs.getInt("mpoint"));
					member.setMresid(rs.getInt("mresid"));
					return member;
				}					
			}
		);
		return list;
	}
	
	// 검색 결과의 수
	public int count(String find) {
		String sql = "select count(*) from member where mid like ? or mname like ?";
		int count = jdbcTemplate.queryForObject(sql, new Object[]{"%"+find+"%", "%"+find+"%"}, Integer.class);
		return count;
	}


	
}
