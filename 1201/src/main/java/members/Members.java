package members;


public class Members {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userNick;
	private String userGender;
	private String userBirthdate;
	private int userMailCheck;
	
	public int getUserMailCheck() {
		return userMailCheck;
	}
	
	
	
	public String getUserBirthdate() {
		return userBirthdate;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public String getUserPw() {
		return userPw;
	}
	
	public void setUserMailCheck(int userMailCheck) {
		this.userMailCheck = userMailCheck;
	}
	
	public void setUserBirthdate(String userBirthdate) {
		this.userBirthdate = userBirthdate;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	

}
