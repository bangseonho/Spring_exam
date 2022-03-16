package Pack01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import Manager.ManagerDAO;
import Question.QuestionDAO;
import User.UserDAO;
import Result.ResultDAO;
import Setting.SettingDAO;
import Setting.SettingDTO;

@Configuration
public class AppConfig {
   @Bean
   ConnectionDB connectiondb() {
      return new ConnectionDB();
   }
   @Bean
   UserDAO UserDAO() {
      return new UserDAO();
   }
   @Bean
   ResultDAO resultDAO() {
      return new ResultDAO();
   }
   @Bean
   QuestionDAO questionDAO() {
	   return new QuestionDAO();
   }
   @Bean
   ManagerDAO mangerDAO() {
	   return new ManagerDAO();
   }
   @Bean
   SettingDAO settingDAO() {
	   return new SettingDAO();
   }
   @Bean
   SettingDTO settingDTO() {
	   return new SettingDTO();
   }
}