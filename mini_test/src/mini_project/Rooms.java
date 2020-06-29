package mini_project;

public class Rooms {
	private int roomNumber;
	private int roomType;
	private int price;
	
	public Rooms () {
	}

	public Rooms(int roomNumber, int roomType, int price) {
		this.roomNumber = roomNumber;
		this.roomType = roomType;
		this.price = price;
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
	

}
