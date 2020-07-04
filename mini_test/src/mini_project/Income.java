package mini_project;

public class Income {
	private String date;
	private int sum;
	
	public Income() {
	}

	public Income(String date, int sum) {
		this.date = date;
		this.sum = sum;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
}
