package mini_project;

public class Guests {
private String custname;
private String email;
private String phonenumber;
private String usedate;
private int counts;

public Guests() {
}

public Guests(String custname,String email,String phonenumber, String usedate) {
	super();
	this.custname=custname;
	this.email=email;
	this.phonenumber=phonenumber;
	this.usedate = usedate;
	
}

public Guests(String custname, String email, String phonenumber, int counts) {
	super();
	this.custname = custname;
	this.email = email;
	this.phonenumber = phonenumber;
	this.counts = counts;
}

public String getCustname() {
	return custname;
}

public void setCustname(String custname) {
	this.custname = custname;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPhonenumber() {
	return phonenumber;
}

public void setPhonenumber(String phonenumber) {
	this.phonenumber = phonenumber;
}

public String getUsedate() {
	return usedate;
}

public void setUsedate(String usedate) {
	this.usedate = usedate;
}

public int getCounts() {
	return counts;
}

public void setCounts(int counts) {
	this.counts = counts;
}





}
