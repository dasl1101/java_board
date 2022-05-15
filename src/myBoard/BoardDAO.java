package myBoard;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.DataSource;
import com.oreilly.servlet.MultipartRequest;


public class BoardDAO {
	private Connection con; //데이터베이스에 접근할 수 있도록 설정
	private PreparedStatement pstmt ; //데이터베이스에서 쿼리를 실행해주는 객체
	private ResultSet rs; //데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public BoardDAO() {}
	
	
	public List<BoardDTO> listBoard() throws SQLException {
		try {
			con = ds.getConnection();
			String sql  = "select * from board3 order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<BoardDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		}

	}
	
	protected List<BoardDTO> makeList(ResultSet rs) throws SQLException {
		List<BoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
			list.add(dto);
		}
		return list;
	}
	
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into board3 values" + 
						"(board3_seq.nextval, ?, ?, ?, ?, sysdate, 0, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mr.getParameter("writer"));
			pstmt.setString(2, mr.getParameter("email"));
			pstmt.setString(3, mr.getParameter("subject"));
			pstmt.setString(4, mr.getParameter("passwd"));
			pstmt.setString(5, mr.getParameter("content"));
			pstmt.setString(6, ip);
			String filename = mr.getFilesystemName("filename");
			int filesize = 0;
			File file = mr.getFile("filename");		
			if (file !=null) {
				filesize = (int)file.length();
			}
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			int res = pstmt.executeUpdate();
			return res; 
		}finally {
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();	
		}
	}
	public BoardDTO getBoard(int num) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "update board3 set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			sql = "select * from board3 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			BoardDTO dto = makeList(rs).get(0);
			return dto;
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();	
		}
	}
	
	protected boolean isPassword(int num, String passwd) throws SQLException{
		BoardDTO dto = getBoard(num);
		if(dto.getPasswd().equals(passwd)) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public int deleteBoard(int num, String passwd) throws SQLException {
		boolean isPassword = isPassword(num, passwd);
		if(isPassword) {
			try {
				con = ds.getConnection();
				String sql = "delete from board3 where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,num);
				int res = pstmt.executeUpdate();
				return res;
			}finally {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();	
			}
		}else {
			return -1;
		}
	}
	
	public int updateBoard(BoardDTO dto) throws SQLException{
		boolean isPassword = isPassword(dto.getNum(), dto.getPasswd());
		if(isPassword) {
			try {
				con = ds.getConnection();
				String sql = "update board3 set writer=?, email=?, subject=?, content=?"
						+ "where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContent());
				pstmt.setInt(5, dto.getNum());
				int res = pstmt.executeUpdate();
				return res;
			}finally {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();	
			}
		}else {
			return -1;
		}
	
	}
	
}	
