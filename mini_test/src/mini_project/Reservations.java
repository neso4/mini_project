package mini_project;

public class Reservations {
	private String name;
	private String email;
	private int roomNumber;
	private String checkin;
	private String checkout;
	private String requirement;
	private int adults;
	private int kids;
	private int price;
	
	public Reservations() {
	}

	public Reservations(String name, String email, int roomNumber, String checkin, String checkout, String requirement,
			int adults, int kids, int price) {
		super();
		this.name = name;
		this.email = email;
		this.roomNumber = roomNumber;
		this.checkin = checkin;
		this.checkout = checkout;
		this.requirement = requirement;
		this.adults = adults;
		this.kids = kids;
		this.price = price;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getKids() {
		return kids;
	}

	public void setKids(int kids) {
		this.kids = kids;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
