package Result;

import org.json.JSONObject;

public class ResultDTO {
	private String code;
	private JSONObject answered;

	public ResultDTO(String code, JSONObject answered) {
		this.code = code;
		this.answered = answered;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public JSONObject getAnswered() {
		return answered;
	}

	public void setAnswered(JSONObject answered) {
		this.answered = answered;
	}
}
