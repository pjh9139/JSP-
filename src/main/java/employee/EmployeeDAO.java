package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class EmployeeDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	EmployeeVO vo = null;

	public EmployeeVO getLoginCheck(String id) {
		vo = new EmployeeVO();
		try {
			sql = "select * from employee where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setId(id);
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				vo.setStartdate(rs.getString("startdate"));
				vo.setRank(rs.getString("rank"));
			}
			else {
				vo = null;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int setJoinOk(EmployeeVO vo) {
		int res = 0;
		try {
			sql = "insert into employee values (default,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhoto());
			pstmt.setString(6, vo.getStartdate());
			pstmt.setString(7, vo.getTel());
			pstmt.setInt(8, vo.getLevel());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public EmployeeVO information(int idx) {
		try {
			sql = "select * from employee where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new EmployeeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setId(rs.getString("id"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setStartdate(rs.getString("startdate"));
				vo.setTel(rs.getString("tel"));
				vo.setCom_tel(rs.getString("com_tel"));
				vo.setFax(rs.getString("fax"));
				vo.setRank(rs.getString("rank"));
				vo.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from employee";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	public ArrayList<EmployeeVO> getList(int startIndexNo, int pageSize) {
		ArrayList<EmployeeVO> vos = new ArrayList<>();
		try {
			sql = "select * from employee order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
				vo.setId(rs.getString("id"));
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setStartdate(rs.getString("startdate"));
				vo.setTel(rs.getString("tel"));
				vo.setLevel(rs.getInt("level"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int pwdchange(String id, String pwd) {
		int res = 0;
		try {
			sql = "update employee set pwd = ? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public int infochange(int idx, String name, String rank, String email, String tel, String com_tel, String fax, String content) {
		int res = 0;
		try {
			sql = "update employee set name = ?, rank = ?, email = ?, tel = ?, com_tel = ?, fax = ?, content = ?  where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, rank);
			pstmt.setString(3, email);
			pstmt.setString(4, tel);
			pstmt.setString(5, com_tel);
			pstmt.setString(6, fax);
			pstmt.setString(7, content);
			pstmt.setInt(8, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
}
