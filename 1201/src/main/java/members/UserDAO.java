package members;

import java.sql.*;

public class UserDAO {
	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Statement stmt = null;
	int count;
	
	
	public void dbClose() {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		}catch (Exception e) {
			System.out.println("DB닫기에서 오류 : "+ e);
		}
	}
	
	public UserDAO() {
		try{
			String url = "jdbc:mysql://3.36.124.173:3306/sw_db?serverTimezone=UTC";
			String user = "sw";
			String pass = "aktwlq2021";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public int login(String userId, String userPw) {
		String SQL = "SELECT userPw FROM members WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1;
				}
				else {
					return 0; //비밀번호 불일치;
				}
			}
			return -1; // 아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(Members member) {
		count = userCount();
		String SQL = "insert INTO members values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserEmail());
			pstmt.setString(5, member.getUserNick());
			pstmt.setString(6, member.getUserGender());
			pstmt.setString(7, member.getUserBirthdate());
			pstmt.setInt(8, count+1);
			pstmt.setBoolean(9, false);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //
	}
	
	private int userCount() {
		int result = 0;
		String sql = "SELECT MAX(usercount) FROM members;";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("갯수 오류"+e);
		}
		return result;
	}

	public boolean checkNick(String nick) {
		String sql = String.format("select userNIck from members WHERE USERNICK = '%s'", nick);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString(1).equals(nick)) {
					return true;
				}
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public boolean checkEmail(String e_mail) {
		String sql = String.format("select USEREMAIL from members WHERE USEREMAIL = '%s'", e_mail);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString(1).equals(e_mail)) {
					return true;
				}
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public boolean checkEmail(String e_mail, String id) {
		String sql = String.format("select USEREMAIL from members WHERE USEREMAIL = '%s' and userid != '%s'", e_mail,id);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString(1).equals(e_mail)) {
					return true;
				}
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	
	public String returnId(String userEmail, String userName) {
		String sql = String.format("select userId FROM members WHERE userEmail = '%s' and userName = '%s'", userEmail, userName);
		String result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					result = rs.getString(1);
				}			
		}catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public String returnPassword(String userEmail, String userName, String userId) {
		String sql = String.format("select userPw FROM members WHERE userEmail = '%s' and userName = '%s' and userId = '%s'"
				,userEmail, userName, userId);
		String result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					result = rs.getString(1);
				}			
		}catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public String returnPassword(String userId) {
		String sql = String.format("select userPw FROM members WHERE userId = '%s'"
				,userId);
		String result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
					result = rs.getString(1);
				}			
		}catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public boolean getUserEamilChecked(String Id) {
		String sql = "select USERMAILCHECK FROM members WHERE userId = ?";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result  = rs.getBoolean(1);
			}	
		}catch (Exception e) {
			System.out.println("이메일 인증 체크 오류"+e);
		}
		return result;
	}
	
	public String getEamil(String id) {
		String result = null;
		String sql = "select userEMail FROM members WHERE userId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}catch (Exception e) {
			System.out.println("이메일 가져오기 오류"+e);
		}
		return result;
	}
	
	public void userEamilCheckUdapte(String Id) {
		String sql = "update members SET USERMAILCHECK = true WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("이메일 인증 여부 체크 오류"+e);
		}
	}
	
	public void userPasswordUdapte(String pw, String Id) {
		String sql = "update members SET  userPW = ? WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, Id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("비밀번호 바꾸는 과정에서 오류 : "+e);
		}
	}
	
	public Members userInform(String id) {
 		Members user = new Members();
		String sql = "select * FROM members WHERE userId = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				user.setUserNick(rs.getString(5));
				user.setUserGender(rs.getString(6));
				user.setUserBirthdate(rs.getString(7));
				user.setUserMailCheck(rs.getInt(9));
			}
		}catch (Exception e) {
			System.out.println("모든 검색 오류 : "+e);
		}
		
		return user;
	}
	
	public void updateForm(String id, String pw, String name, String email, String gender, boolean check) {
		String sql = "update members set userPw = ?, userName = ?, userEmail = ?, userGender = ?, userMailCheck = ? "
				+ "where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, gender);
			pstmt.setBoolean(5, check);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("업데이트 : "+e);
		}
	}
}
