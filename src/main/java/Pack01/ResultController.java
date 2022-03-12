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
	
	@RequestMapping("/result")
	public String form(Model model, ResultDTO result) {

		ResultDAO resultDAO = new ResultDAO(); //select 결과쿼리
		
		try {			
			model.addAttribute("rs2", resultDAO.resultAllCount());
			model.addAttribute("rs3", resultDAO.resultCollectCount());
			model.addAttribute("rs1", resultDAO.resultAnswer());
		}catch(Exception e){
			System.out.println("ȸ������ ����");
		}
		
		
		return "ResultView";
	}
	
	/*public String form(Model model, ResultDTO result) {
		System.out.println(123123);

		ResultDAO resultDAO = new ResultDAO(); //select 결과쿼리
		
		try {
			model.addAttribute("rs", resultDAO.resultAnswer());
		}catch(Exception e){
			System.out.println("ȸ������ ����");
		}
		
		
		return "ResultView";
	}*/
	
	
	/*@Autowired
	ResultDAO resultDAO;
	
	@RequestMapping("/result")
	public String form(Model model, ResultDTO result) {
	
		
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
		
	
		ResultDTO dto = new ResultDTO(result.getCode(), result.getAnswered());
		return "ResultView";
	}*/
}
