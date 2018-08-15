package mypack;

public class User 
{
	private String username;
	private String password;
	private String phoneno;
	private String emailid;
	private String usermode;
	
	public User() {
		super();
	}
	
	public User(String username, String password, String phoneno, String emailid, String usermode) {
		super();
		this.username = username;
		this.password = password;
		this.phoneno = phoneno;
		this.emailid = emailid;
		this.usermode = usermode;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	
	public String getUsermode() {
		return usermode;
	}

	public void setUsermode(String usermode) {
		this.usermode = usermode;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", phoneno=" + phoneno + ", emailid=" + emailid
				+ ", usermode=" + usermode + "]";
	}
}
