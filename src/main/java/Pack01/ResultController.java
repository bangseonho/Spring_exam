package Pack01;

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
		
		ResultDTO dto = new ResultDTO(result.getCode(), result.getAnswered());
		
		
		return "ResultView";
	}
}
