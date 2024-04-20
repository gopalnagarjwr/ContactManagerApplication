package com.manager.controller;

import org.aspectj.bridge.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.manager.dao.UserRepository;
import com.manager.entity.User;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import java.security.Principal;

@Controller
public class HomeController {

    @Autowired
    private UserRepository userRepository;

//    @Autowired
//    public PasswordEncoder passwordEncoder;

    @ModelAttribute
    public void commanUser(ModelMap model, Principal principal) {
        if (principal != null) {
            User user = userRepository.findByUserEmail(principal.getName());
            model.put("user", user);
        }
    }

    @RequestMapping("/home")
    public String home(ModelMap model, Principal principal) {

        return "Home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/registerHere")
    public String register(@Valid @ModelAttribute("user1") User user1, BindingResult result,
                           @RequestParam(value = "agreement", defaultValue = "false") boolean agreement, Model model,
                           HttpSession session) {
        try {

            if (result.hasErrors()) {
                model.addAttribute("errors", result);
                model.addAttribute("user1", user1);
                return "Signup";
            }

            if (!agreement) {
                throw new Exception("You have not agreed terms and conditions !! ");
            }

            user1.setEnable("1");
            user1.setRole("USER");

//            user1.setPassword(this.passwordEncoder.encode(user1.getPassword()));

            User u = this.userRepository.save(user1);
            model.addAttribute("user1", new User());
            session.setAttribute("message", new Message("Successfully Register !!", Message.INFO, null, null));
            return "Signup";

        } catch (Exception e) {
            model.addAttribute("user1", user1);
            session.setAttribute("message",
                    new Message("Something went wrong " + e.getMessage(), Message.ERROR, e, null));
            return "Signup";
        }

    }

    @GetMapping("/registerHere")
    public String sign(Model model) {
        model.addAttribute("user1", new User());
        return "Signup";
    }


}
