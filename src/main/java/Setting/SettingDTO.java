package Setting;

public class SettingDTO {
	private int limitTime;
	private int questionNum;
	private int questionChance;
	
	public SettingDTO(int limitTime, int questionNum, int questionChance) {
		this.limitTime = limitTime;
		this.questionNum = questionNum;
		this.questionChance = questionChance;
	}
	public int getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(int limitTime) {
		this.limitTime = limitTime;
	}
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public int getQuestionChance() {
		return questionChance;
	}
	public void setQuestionChance(int questionChance) {
		this.questionChance = questionChance;
	}
	
	@Override
	public String toString() {
		return "SettingDTO [limitTime=" + limitTime + ", questionNum=" + questionNum + ", questionChance="
				+ questionChance + "]";
	}

}
