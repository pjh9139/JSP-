package logistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class LogisticsDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	LogisticsVO vo = null;
	CompanyVO cvo = null;
	InVoiceVO ivo = null;

	public int logisticstotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from logistics";
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
	public int logisticsChecktotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from logistics where state=0";
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
	public int logisticsCheck1totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from logistics where state=1";
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
	public int logisticsErrortotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from logistics where state=3";
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
	public int companytotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from company";
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
	public int invoicetotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from invoice";
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
	
	public int addcompany(CompanyVO vo) {
		int res = 0;
		try {
			sql = "insert into company values (default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getCountry());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getFax());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	

	public ArrayList<CompanyVO> getCompanyList(int startIndexNo, int pageSize) {
		ArrayList<CompanyVO> vos = new ArrayList<>() ;
		try {
			sql = "select * from company order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CompanyVO vo = new CompanyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setCountry(rs.getString("country"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setFax(rs.getString("fax"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ArrayList<CompanyVO> getCompanySearchList(String search, String searchString) {
		ArrayList<CompanyVO> vos = new ArrayList<>();
		try {
			sql = "select * from company where "+search+" like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cvo = new CompanyVO();
				cvo.setIdx(rs.getInt("idx"));
				cvo.setName(rs.getString("name"));
				cvo.setCountry(rs.getString("country"));
				cvo.setAddress(rs.getString("address"));
				cvo.setEmail(rs.getString("email"));
				cvo.setTel(rs.getString("tel"));
				cvo.setFax(rs.getString("fax"));
				vos.add(cvo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int addDO(LogisticsVO vo) {
		int res = 0;
		try {
			sql = "insert into logistics values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRecipient_idx());
			pstmt.setString(2, vo.getRecipient_company());
			pstmt.setString(3, vo.getRecipient_location());
			pstmt.setString(4, vo.getRecipient_country());
			pstmt.setString(5, vo.getRecipient_tel());
			pstmt.setString(6, vo.getRecipient_method());
			pstmt.setInt(7, vo.getProduct_idx());
			pstmt.setString(8, vo.getProduct_name());
			pstmt.setInt(9, vo.getProduct_price());
			pstmt.setInt(10, vo.getProduct_weight());
			pstmt.setString(11, vo.getProduct_size());
			pstmt.setInt(12, vo.getProduct_quantity());
			pstmt.setString(13, vo.getWriter());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	public int updateDO(LogisticsVO vo) {
		int res = 0;
		try {
			sql = "update logistics set recipient_idx=?, recipient_company=?, recipient_location=?, recipient_country=?, recipient_tel=?, recipient_method=?,"
					+ "product_idx=?, product_name=?, product_price=?, product_weight=?, product_size=?, product_quantity=?, writer=?, state=0 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getRecipient_idx());
			pstmt.setString(2, vo.getRecipient_company());
			pstmt.setString(3, vo.getRecipient_location());
			pstmt.setString(4, vo.getRecipient_country());
			pstmt.setString(5, vo.getRecipient_tel());
			pstmt.setString(6, vo.getRecipient_method());
			pstmt.setInt(7, vo.getProduct_idx());
			pstmt.setString(8, vo.getProduct_name());
			pstmt.setInt(9, vo.getProduct_price());
			pstmt.setInt(10, vo.getProduct_weight());
			pstmt.setString(11, vo.getProduct_size());
			pstmt.setInt(12, vo.getProduct_quantity());
			pstmt.setString(13, vo.getWriter());
			pstmt.setInt(14, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<LogisticsVO> getDOListCheck(int startIndexNo, int pageSize) {
		ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics where state = 1 order by idx limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	public ArrayList<LogisticsVO> getDOList(int startIndexNo, int pageSize) {
		ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public ArrayList<LogisticsVO> getDOList(String search, String searchString) {
	ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics where "+search+" like ? order by idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public int addIV(InVoiceVO vo) {
		int res = 0;
		try {
			sql = "insert into invoice values (default,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCOMPANY());
			pstmt.setString(2, vo.getADRESS());
			pstmt.setString(3, vo.getCOUNTRY());
			pstmt.setString(4, vo.getPHONE());
			pstmt.setString(5, vo.getSize());
			pstmt.setString(6, vo.getProduct_name());
			pstmt.setString(7, vo.getWriter());
			pstmt.setInt(8, vo.getWeight());
			pstmt.setInt(9, vo.getQuantity());
			pstmt.setInt(10, vo.getPrice());
			pstmt.setInt(11, vo.getTotprice());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public ArrayList<LogisticsVO> errorDOList(int startIndexNo, int pageSize) {
		ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics  where state = 3 order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	public ArrayList<LogisticsVO> checkDOList(int startIndexNo, int pageSize) {
		ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics  where state = 0 order by idx limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public ArrayList<LogisticsVO> checkDOsearch(String search, String searchString) {
		ArrayList<LogisticsVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from logistics where "+search+" like ? and state = 0 order by idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LogisticsVO vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public LogisticsVO detailDO(int idx) {
		try {
			sql = "select * from logistics where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new LogisticsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setRecipient_idx(rs.getInt("recipient_idx"));
				vo.setRecipient_company(rs.getString("recipient_company"));
				vo.setRecipient_location(rs.getString("recipient_location"));
				vo.setRecipient_tel(rs.getString("recipient_tel"));
				vo.setRecipient_method(rs.getString("recipient_method"));
				vo.setProduct_idx(rs.getInt("product_idx"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setProduct_weight(rs.getInt("product_weight"));
				vo.setProduct_size(rs.getString("product_size"));
				vo.setProduct_quantity(rs.getInt("product_quantity"));
				vo.setRecipient_country(rs.getString("recipient_country"));
				vo.setWriter(rs.getString("writer"));
				vo.setState(rs.getInt("state"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int DOstateUpdate(int idx, int state) {
		int res = 0;
		try {
			sql = "update logistics set state='"+state+"' where idx=?";
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
	
	public ArrayList<InVoiceVO> getIVList(int startIndexNo, int pageSize) {
		ArrayList<InVoiceVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from invoice order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ivo = new InVoiceVO();
				ivo.setCOMPANY(rs.getString("COMPANY"));
				ivo.setProduct_name(rs.getString("product_name"));
				ivo.setWriter(rs.getString("writer"));
				ivo.setQuantity(rs.getInt("quantity"));
				ivo.setIdx(rs.getInt("idx"));
				vos.add(ivo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
	public InVoiceVO detailIV(int idx) {
		try {
			sql = "select * from invoice where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ivo = new InVoiceVO();
				ivo.setCOMPANY(rs.getString("COMPANY"));
				ivo.setADRESS(rs.getString("ADRESS"));
				ivo.setCOUNTRY(rs.getString("COUNTRY"));
				ivo.setPHONE(rs.getString("PHONE"));
				ivo.setSize(rs.getString("size"));
				ivo.setProduct_name(rs.getString("product_name"));
				ivo.setWriter(rs.getString("writer"));
				ivo.setWeight(rs.getInt("weight"));
				ivo.setQuantity(rs.getInt("quantity"));
				ivo.setPrice(rs.getInt("price"));
				ivo.setTotprice(rs.getInt("totprice"));
				ivo.setIdx(rs.getInt("idx"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return ivo;
	}
	public CompanyVO detailCompany(int idx) {
		try {
			sql = "select * from company where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cvo = new CompanyVO();
				cvo.setIdx(rs.getInt("idx"));
				cvo.setName(rs.getString("name"));
				cvo.setCountry(rs.getString("country"));
				cvo.setAddress(rs.getString("address"));
				cvo.setEmail(rs.getString("email"));
				cvo.setTel(rs.getString("tel"));
				cvo.setFax(rs.getString("fax"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return cvo;
	}
	public int companyupdate(CompanyVO vo) {
		int res=0;
		try {
			sql = "update company set name=?, country=?, address=?, email=?, tel=?, fax=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getCountry());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getFax());
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

}
