package jdbcloginapp;

public class UserLogin
{	    
	   private String userName;
	   private String confrimpassword;
	   private String password;
	   
	   public UserLogin() {
	        
	   }

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getConfrimpassword() {
		return confrimpassword;
	}

	public void setConfrimpassword(String confrimpassword) {
		this.confrimpassword = confrimpassword;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	   
	}