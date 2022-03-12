package Pack01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import Manager.ManagerDAO;
import Question.QuestionDAO;
import User.UserDAO;
import Result.ResultDAO;

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
   ManagerDAO managerDAO() {
	   return new ManagerDAO();
   }
   
}