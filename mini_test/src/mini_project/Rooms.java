package mini_project;

public class Rooms {
	private int roomNumber;
	private int roomType;
	private int price;
	private boolean isUsed;
	
	public Rooms () {
	}
	
	public Rooms(int roomNumber) {
		super();
		this.roomNumber = roomNumber;
	}

	public Rooms(int roomNumber, int roomType, int price) {
		this.roomNumber = roomNumber;
		this.roomType = roomType;
		this.price = price;
	}
	
	public Rooms(int roomNumber, int roomType, int price, boolean isAvailable) {
		super();
		this.roomNumber = roomNumber;
		this.roomType = roomType;
		this.price = price;
		this.isUsed = isAvailable;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public int getRoomType() {
		return roomType;
	}

	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return isUsed;
	}

	public void setAvailable(boolean isAvailable) {
		this.isUsed = isAvailable;
	}
}
