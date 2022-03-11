package Pack01;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Result.ResultDAO;
import Result.ResultDTO;
import User.UserDAO;
import User.UserDTO;

@Controller
public class ResultController {
	@Autowired
	ResultDAO resultDAO;
	
	@RequestMapping("/result")
	public String form(Model model, ResultDTO result) {
<<<<<<< HEAD
		
		JSONObject obj1 = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		for(int i=0; i<5; i++){
		
			JSONObject obj2 = new JSONObject();
			
			obj2.put("name",i);
			
			jArray.put(obj2);

		}
		
		
		obj1.put("data", jArray);
		
		String resp = obj1.toString();
		
		try {
			model.addAttribute("dto", resp);
		} catch (Exception e) {
			System.out.println("find failed _ controller");
		}
		
=======
>>>>>>> 546c9e2aa8f6d440ce48d7431218610c868ffe2b
		ResultDTO dto = new ResultDTO(result.getCode(), result.getAnswered());
		return "ResultView";
	}
}
