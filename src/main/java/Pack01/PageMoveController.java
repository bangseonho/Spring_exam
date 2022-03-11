package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageMoveController {

	@RequestMapping("/PageMove")
	String pageMove(@RequestParam(value = "page") String page) {
		return page;
	}
	
}
