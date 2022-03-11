package Result;

import org.json.JSONArray;

public class ResultDTO {
	private String code;
	private JSONArray answered;

	public ResultDTO(String code, JSONArray answered) {
		this.code = code;
		this.answered = answered;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public JSONArray getAnswered() {
		return answered;
	}

	public void setAnswered(JSONArray answered) {
		this.answered = answered;
	}
}
