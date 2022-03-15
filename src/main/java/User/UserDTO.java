package User;

import java.util.Collections;
import java.util.List;

public class UserDTO {

	private String name;
	private String birth;
	private String code;
	private int flag;
	
	UserDTO(){		
	}
	public UserDTO(String name) {
		this.name = name;
	}

	public UserDTO(String name, String birth, String code) {
		this.name = name;
		this.birth = birth;
		this.code = code;
	}

	public UserDTO(String name, String birth, String code, int flag) {
		this.name = name;
		this.birth = birth;
		this.code = code;
		this.flag = flag;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String addNan() {
		int a = ((int) (Math.random() * 999) + 100);
		this.code = birth+a;
		return birth+a;
	}
}
