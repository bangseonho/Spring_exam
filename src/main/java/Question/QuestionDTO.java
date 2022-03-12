package Question;

public class QuestionDTO {
	String phrase;
	String one;
	String two;
	String three;
	String four;
	String answer;
	String who;
	
	public QuestionDTO() {};
	
	public QuestionDTO(String phrase, String one, String two, String three, String four, String answer, String who) {
		this.phrase = phrase;
		this.one    = one;   
		this.two	= two;
		this.three	= three;
		this.four   = four;
		this.answer = answer;
		this.who    = who;
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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	@Override
	public String toString() {
		return "QuestionDTO [phrase=" + phrase + ", one=" + one + ", two=" + two + ", three=" + three + ", four=" + four
				+ ", answer=" + answer + ", who=" + who + "]";
	}
	
}