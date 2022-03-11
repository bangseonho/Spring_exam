package Pack01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
//   @Bean
//   ConnectionDB connectiondb() {
//      return new ConnectionDB();
//   }
   @Bean
   UserDAO UserDAO() {
      return new UserDAO();
   }
}