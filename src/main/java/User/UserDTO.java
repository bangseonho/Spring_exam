package User;

import java.util.Collections;
import java.util.List;

public class UserDTO {

	private String name;
	private String birth;
	private String code;
	private boolean flag;
	
	UserDTO(){		
	}
	

	public UserDTO(String name, String birth, String code) {
		this.name = name;
		this.birth = birth;
		this.code = code;
	}

	public UserDTO(String name, String birth, String code, boolean flag) {
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

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	

}
