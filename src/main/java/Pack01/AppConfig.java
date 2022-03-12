package Pack01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import Question.QuestionDTO;
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
   QuestionDTO questionDAO() {
	   return new QuestionDTO();
   }
}