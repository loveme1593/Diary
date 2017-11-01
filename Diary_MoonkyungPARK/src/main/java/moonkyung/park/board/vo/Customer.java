package moonkyung.park.board.vo;

public class Customer {
	private String cus_id;
	private String cus_pw;
	private String cus_gender;
	private String cus_nickname;
	private int cus_question;
	private String cus_answer;
	private String cus_hobbies;
	private String cus_status;
	private String friend_id;
	private String friend_status;
	
	public String getCus_status() {
		return cus_status;
	}

	public void setCus_status(String cus_status) {
		this.cus_status = cus_status;
	}

	public String getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}

	public String getFriend_status() {
		return friend_status;
	}

	public void setFriend_status(String friend_status) {
		this.friend_status = friend_status;
	}

	public String getCus_gender() {
		return cus_gender;
	}

	public void setCus_gender(String cus_gender) {
		this.cus_gender = cus_gender;
	}

	public int getCus_question() {
		return cus_question;
	}

	public void setCus_question(int cus_question) {
		this.cus_question = cus_question;
	}

	public String getCus_answer() {
		return cus_answer;
	}

	public void setCus_answer(String cus_answer) {
		this.cus_answer = cus_answer;
	}

	public String getCus_hobbies() {
		return cus_hobbies;
	}

	public void setCus_hobbies(String cus_hobbies) {
		this.cus_hobbies = cus_hobbies;
	}

	public String getCus_id() {
		return cus_id;
	}

	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}

	public String getCus_pw() {
		return cus_pw;
	}

	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}

	public String getCus_nickname() {
		return cus_nickname;
	}

	public void setCus_nickname(String cus_nickname) {
		this.cus_nickname = cus_nickname;
	}

	@Override
	public String toString() {
		return "Customer [cus_id=" + cus_id + ", cus_pw=" + cus_pw + ", cus_gender=" + cus_gender + ", cus_nickname="
				+ cus_nickname + ", cus_question=" + cus_question + ", cus_answer=" + cus_answer + ", cus_hobbies="
				+ cus_hobbies + ", cus_status=" + cus_status + ", friend_id=" + friend_id + ", friend_status="
				+ friend_status + "]";
	}
}
