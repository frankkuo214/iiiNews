package CR.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class socketController {

	
	@GetMapping("/msg")
	public String index() {
	      return "CR/Sockettest";
	   }
}