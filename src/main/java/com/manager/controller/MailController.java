package com.manager.controller;

import com.manager.dao.ContactRepository;
import com.manager.dao.UserRepository;
import com.manager.entity.Contacts;
import com.manager.entity.DataClass;
import com.manager.entity.GmailSender;
import com.manager.entity.User;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequestMapping("/sender")
public class MailController {

    @Autowired
    private GmailSender sender;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContactRepository contactRepository;


    @ModelAttribute
    public void commanUser(ModelMap model, Principal principal) {
        User user = userRepository.findByUserEmail(principal.getName());
        model.put("user", user);
    }

    @GetMapping("/G-mail/{cid}")
    public String getEmail(@PathVariable("cid") int cid, ModelMap model) {
        Contacts c = contactRepository.findById(cid).get();
        User user = (User) model.get("user");
        model.put("Cemail", c.getEmail());
        model.put("Uemail", user.getEmail());
        return "Gmail/Email";
    }

    @PostMapping("/EmailProcessing")
    public String processEmail(@Valid @ModelAttribute DataClass data, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.put("errors", result);
            model.put("data", data);
            return "Gmail/Email";
        }
        try {
            User user = (User) model.get("user");
            boolean f = sender.sendMail(data.getTo(), data.getFrom(), data.getSubject(), data.getText(), user);
            if (f) {
                model.put("successAlert", "mail send successfully !");
                model.put("Cemail", data.getTo());
                model.put("Uemail", data.getFrom());
            } else {
                model.put("errorAlert", "mail not send !");
                model.put("data", data);
                return "Gmail/Email";
            }
        } catch (Exception e) {
            model.put("data", data);
            model.put("errorAlert", "server error is" + e.getMessage());
            return "Gmail/Email";
        }

        return "Gmail/Email";
    }

}
