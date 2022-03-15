package Result;

public class ResultDTO {
	private String code;
	private int question;
	private int choice;
	private int correct;
	private int flag;

	public ResultDTO(String code, int question, int choice, int correct) {
		this.code = code;
		this.question = question;
		this.choice = choice;
		this.correct = correct;
	}

	public ResultDTO(String code, int question, int choice, int correct, int flag) {
		this.code = code;
		this.question = question;
		this.choice = choice;
		this.correct = correct;
		this.flag = flag;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getQuestion() {
		return question;
	}

	public void setQuestion(int question) {
		this.question = question;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	@Override
	public String toString() {
		return "ResultDTO [code=" + code + ", question=" + question + ", choice=" + choice + ", correct=" + correct
				+ ", flag=" + flag + "]";
	}

}
