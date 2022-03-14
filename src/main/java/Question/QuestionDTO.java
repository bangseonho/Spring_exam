package Question;

public class QuestionDTO {
	String id;
	String phrase;
	String one;
	String two;
	String three;
	String four;
	int answer;
	String who;
	int remove;
	
	public QuestionDTO() {};
	
	public QuestionDTO(String id, String phrase, String one, String two, String three, String four, int answer, String who) {
		this.id 	= id;
		this.phrase = phrase;
		this.one    = one;   
		this.two	= two;
		this.three	= three;
		this.four   = four;
		this.answer = answer;
		this.who    = who;
	}
	public QuestionDTO(String id, String phrase, String one, String two, String three, String four, int answer, String who, int remove) {
		this.id 	= id;
		this.phrase = phrase;
		this.one    = one;   
		this.two	= two;
		this.three	= three;
		this.four   = four;
		this.answer = answer;
		this.who    = who;
		this.remove = remove;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhrase() {
		return phrase;
	}

	public void setPhrase(String phrase) {
		this.phrase = phrase;
	}

	public String getOne() {
		return one;
	}

	public void setOne(String one) {
		this.one = one;
	}

	public String getTwo() {
		return two;
	}

	public void setTwo(String two) {
		this.two = two;
	}

	public String getThree() {
		return three;
	}

	public void setThree(String three) {
		this.three = three;
	}

	public String getFour() {
		return four;
	}

	public void setFour(String four) {
		this.four = four;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	public int getRemove() {
		return remove;
	}

	public void setRemove(int remove) {
		this.remove = remove;
	}

	@Override
	public String toString() {
		return "QuestionDTO [id=" + id + ", phrase=" + phrase + ", one=" + one + ", two=" + two + ", three=" + three
				+ ", four=" + four + ", answer=" + answer + ", who=" + who + ", remove=" + remove + "]";
	}

	
}