package mini_project;

public class Contact {
	private int type;
	private String title;
	private String content;
	private String name;
	private String phone;
	private String insertDate;
	
	
	public Contact() {
	}
	
	public Contact(int type,String title,String content,String name, String phone, String insertDate) {
		super();
		this.type=type;
		this.title=title;
		this.content=content;
		this.name = name;
		this.phone=phone;
		this.insertDate=insertDate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

}
