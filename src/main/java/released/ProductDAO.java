package released;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ProductDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	ProductVO vo = null;

	public int addProduct(ProductVO vo) {
		int res = 0;
		try {
			sql = "insert into product values (default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setInt(3, vo.getWidth());
			pstmt.setInt(4, vo.getLength());
			pstmt.setInt(5, vo.getHight());
			pstmt.setInt(6, vo.getWeight());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from product";
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

	public ArrayList<ProductVO> getProdctList(int startIndexNo, int pageSize) {
		ArrayList<ProductVO> vos = new ArrayList<>(); 
		try {
			sql = "select * from product order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				vo.setWidth(rs.getInt("width"));
				vo.setLength(rs.getInt("length"));
				vo.setHight(rs.getInt("hight"));
				vo.setWeight(rs.getInt("weight"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int updateProduct(ProductVO vo) {
		int res = 0;
		try {
			sql = "update product set name=?, price=?, width=?, length=?, hight=?, weight=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setInt(3, vo.getWidth());
			pstmt.setInt(4, vo.getLength());
			pstmt.setInt(5, vo.getHight());
			pstmt.setInt(6, vo.getWeight());
			pstmt.setInt(7, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public int productDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from product where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ProductVO> getProductSearchList(String searchString) {
		ArrayList<ProductVO> vos = new ArrayList<>();
		try {
			sql = "select * from product where name like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ProductVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getInt("price"));
				vo.setWidth(rs.getInt("width"));
				vo.setLength(rs.getInt("length"));
				vo.setHight(rs.getInt("hight"));
				vo.setWeight(rs.getInt("weight"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

}
