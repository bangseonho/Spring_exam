package Question;

import org.json.JSONArray;

public class QuestionDTO {
	String phrase;
	JSONArray choice;
	String answer;

	public String getPhrase() {
		return phrase;
	}

	public void setPhrase(String phrase) {
		this.phrase = phrase;
	}

	public JSONArray getChoice() {
		return choice;
	}

	public void setChoice(JSONArray choice) {
		this.choice = choice;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
