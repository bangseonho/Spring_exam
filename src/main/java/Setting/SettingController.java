package Setting;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {
	@Autowired
	SettingDAO settingDAO;
	
	@RequestMapping("/SettingSelect")
	String SettingSelect(Model model) {
		
		try {
			ResultSet rs = settingDAO.selectSetting();
			rs.next();
			model.addAttribute("settingDTO", new SettingDTO(rs.getInt(2), rs.getInt(3), rs.getInt(4)));
		} catch (Exception e) { e.printStackTrace(); }
		
		return "Manager/ManagerDBView";
	}

	@RequestMapping("/SettingUpdate")
	String SettingUpdate(SettingDTO settingDTO) {
		
		try {
			int cnt = settingDAO.updateSetting(settingDTO);
			
		} catch (Exception e) { e.printStackTrace(); }
		
		return "redirect:SettingSelect";
	}
}
