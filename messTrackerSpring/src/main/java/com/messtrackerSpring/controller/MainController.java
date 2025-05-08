package com.messtrackerSpring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.messtrackerSpring.entity.loginEntity;
import com.messtrackerSpring.entity.messEntity;
import com.messtrackerSpring.service.loginService;
import com.messtrackerSpring.service.messService;

@Controller
public class MainController {
	
	@Autowired
	private messService messService;
	
	@Autowired
	private loginService loginService;
	
	@RequestMapping("demo")
	public String demo() {
		return "demo";
	}
	
	@RequestMapping("Home")
	public String home() {
		return "index";
	}
	
	
	@PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
       loginEntity login = loginService.login(email, password);
        if (login != null) {
            session.setAttribute("user", login);
            model.addAttribute("login", true);
            return "calendar";  // after successful login
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "index";      // back to login page with error
        }
	
    }

	
	 @PostMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // Clears all session data
	        return "index"; // Redirect to login page
	    }
	
	
	
	@RequestMapping("/Calendar_Management")
	public String calmanage(HttpSession session, Model model) {
		 if (session.getAttribute("user") == null) {
		        return "index";
		    }

		    loginEntity user = (loginEntity) session.getAttribute("user");

		    // Only get current user's data
		    List<messEntity> allData = messService.getDataByUser(user);
	    model.addAttribute("dbData", allData);
	    // Count logic
	    long totalMessTiffin = allData.stream()
	            .filter(e -> "yes".equalsIgnoreCase(e.getStatus()))
	            .count();
	    
	 


	    long hotelClosed = allData.stream()
	            .filter(e -> "no".equalsIgnoreCase(e.getStatus()) && 
	                         "Hotel closed".equalsIgnoreCase(e.getNotype()))
	            .count();

	    long sweetMeals = allData.stream()
	            .filter(e -> "yes".equalsIgnoreCase(e.getStatus()) && 
	                         "Meal including sweets".equalsIgnoreCase(e.getMealType()))
	            .count();

	    // Add to model
	    model.addAttribute("totalMessTiffin", totalMessTiffin);
	    model.addAttribute("hotelClosed", hotelClosed);
	    model.addAttribute("sweetMeals", sweetMeals);
	    
		return "calendar";
	}
	
	@RequestMapping("/submitform")
	public String submitform(messEntity entity, Model model, HttpSession session) {
	    // 1. Get the logged-in user from session
	    loginEntity user = (loginEntity) session.getAttribute("user");

	    // Agar user null hai (session expire ya login nahi hua), toh redirect karo login page pe
	    if (user == null) {
	        return "redirect:/Home"; // Ya jo bhi aapka login page ka URL hai
	    }

	    // 2. Set it in the messEntity object
	    entity.setEntity(user); // YEH BAHUT IMPORTANT HAI!

	    messService.savedata(entity);

	    model.addAttribute("selectedDate", entity.getDate());
	    model.addAttribute("status", entity.getStatus());
	    return "redirect:/Calendar_Management";
	}



}
