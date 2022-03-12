package Manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	@RequestMapping("/ManagerController")
	String managerController() {
		
		return "ManagerMainView";
	}
}
