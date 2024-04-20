package com.manager.controller;

import com.manager.dao.ContactRepository;
import com.manager.dao.UserRepository;
import com.manager.entity.Contacts;
import com.manager.entity.User;

import jakarta.validation.Valid;
import org.aspectj.bridge.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;

import java.nio.file.*;
import java.security.Principal;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Controller
//@EnableMethodSecurity
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepository;

//    @Autowired
//    private  PasswordEncoder passwordEncoder;

	@Autowired
	private ContactRepository contactRepository;

	@ModelAttribute
	public void commanUser(ModelMap model, Principal principal) {
		User user = userRepository.findByUserEmail(principal.getName());
		model.put("user", user);
	}

	@GetMapping("/dashboard")
	public String showUserDashboard() {
		return "normal/Deshbord";
	}

	@GetMapping("/profileUser")
	public String profile(ModelMap model) {
		User u = (User) model.get("user");
		String base64Image = Base64.getEncoder().encodeToString(u.getImage());
		model.put("base64Image", base64Image);
		return "normal/Profile";
	}

	@GetMapping("/add-Contact")
	public String addContact(ModelMap model) {
		model.put("title", "Add Contact");
		model.put("contact", new Contacts());
		return "normal/addContact";
	}

	@PostMapping("/add-Contact")
	public String addContactProcess(@Valid @ModelAttribute Contacts contact, BindingResult result, ModelMap model,
			@RequestParam("profileImage") MultipartFile file, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			model.put("contact", contact);
			model.put("errors", result);
			return "normal/addContact";
		}
		boolean exists = false;
		try {
			if (file.isEmpty()) {
				model.put("contact", contact);
				model.put("emptyfile", file.isEmpty());
				return "normal/addContact";
			} else {
				// Assuming you have a User entity and UserRepository
				User user = (User) model.get("user");
				exists = user.getLl().stream().anyMatch(c -> c.getCid() == contact.getCid());
				contact.setU(user);
				contact.setImage(file.getBytes());
				if (exists) {
					Contacts save = contactRepository.save(contact);
					String base64Image = Base64.getEncoder().encodeToString(save.getImage());
					redirectAttributes.addFlashAttribute("base64Image", base64Image);
					redirectAttributes.addFlashAttribute("successMessage", "Updation successfully!");
					return "redirect:/user/show-contact/0";
				} else {
					user.getLl().add(contact);
					userRepository.save(user); // Save the user entity
					model.put("successMessage", "Add Contact successfully!");
					model.put("title", "Add Contact");
				}
			}
		} catch (Exception e) {
			if (exists) {
				model.put("errorMessage", "Failed To Update : " + e.getMessage());
			} else {
				model.put("errorMessage", "Failed To Add Contact : " + e.getMessage());
			}
			e.printStackTrace();
		}
		return "normal/addContact";
	}

	@GetMapping("/show-contact/{currentPage}")
	public String showContact(@PathVariable("currentPage") Integer currentPage, ModelMap model) {
		User u = (User) model.get("user");
	

		Pageable page = PageRequest.of(currentPage, 5);

		Page<Contacts> contacts = contactRepository.findAllByU_Id(u.getId(), page);
		
		for (Contacts contact : contacts.getContent()) {
		  contact.setBase64Image(Base64.getEncoder().encodeToString(contact.getImage()));
		   
		}
		
		model.put("contacts", contacts);
		model.put("currentPage", currentPage);
		model.put("totalPage", contacts.getTotalPages());
		return "normal/Contacts";
	}

	@GetMapping("/remove-contact/{id}")
	public String deleteContact(@PathVariable("id") int id, ModelMap model, RedirectAttributes redirectAttributes) {
		try {
			Optional<Contacts> c = contactRepository.findById(id);
			Contacts contact = c.get();
			User u = (User) model.get("user");
			if (u.getId() == contact.getU().getId())
				contactRepository.delete(contact);
			redirectAttributes.addFlashAttribute("successMessage", "remove successfull !!!");
		} catch (Exception ex) {
			redirectAttributes.addFlashAttribute("errorMessage", "This Contact not available...");
			ex.printStackTrace();
		}
		return "redirect:/user/show-contact/0";
	}

	@GetMapping("/contact-profile/{cid}")
	public String contactProfile(@PathVariable("cid") int cid, ModelMap model) {
		try {
			Optional<Contacts> c = contactRepository.findById(cid);
			Contacts contact = c.get();
			String base64Image = Base64.getEncoder().encodeToString(contact.getImage());
			contact.setBase64Image(base64Image);
			User u = (User) model.get("user");
			if (u.getId() == contact.getU().getId())
				model.put("contact", contact);
		} catch (Exception ex) {
			ex.getMessage();
		}

		return "normal/ContactProfile";
	}

	@GetMapping("/contact-update/{cid}")
	public String updateContact(@PathVariable("cid") int cid, ModelMap model) {
		try {
			Optional<Contacts> c = contactRepository.findById(cid);
			Contacts contact = c.get();
			String base64Image = Base64.getEncoder().encodeToString(contact.getImage());
			contact.setBase64Image(base64Image);
			User u = (User) model.get("user");
			if (u.getId() == contact.getU().getId())
				model.put("title", "Update Contact");
			model.put("contact", contact);
		} catch (Exception ex) {
			ex.getMessage();
		}
		return "normal/addContact";
	}

	@PostMapping("/search-data")
	public String filterData(@RequestParam("value") String value, ModelMap model) {
		User u = (User) model.get("user");
		Pageable page = PageRequest.of(0, 5);
		Page<Contacts> contacts = null;
		if (!value.equals("")) {
			contacts = contactRepository.findAllByNameContainsIgnoreCaseAndU_Id(value, u.getId(), page);
		} else {
			contacts = contactRepository.findAllByU_Id(u.getId(), page);
		}
		model.put("contacts", contacts);
		model.put("currentPage", 0);
		model.put("totalPage", contacts.getTotalPages());
		return "normal/Contacts";
	}

	@GetMapping("/profile-Update")
	public String updateUser(ModelMap model) {
		User user = (User) model.get("user");
		model.put("user1", user);
		return "normal/updateProfile";
	}

	@PostMapping("/update-process")
	public String userProcess(@Valid @ModelAttribute("user2") User user2, BindingResult result,
			@RequestParam("profileImage") MultipartFile file,
			@RequestParam(value = "agreement", defaultValue = "false") boolean agreement, ModelMap model,
			RedirectAttributes redirectAttributes) {
		try {
			if (result.hasErrors()) {
				model.put("errors", result);
				model.put("user1", user2);
				System.out.println("error");
				return "normal/updateProfile";
			}
			if (!agreement) {
				throw new Exception("You have not agreed Enable Account !! ");
			}
			User user = (User) model.get("user");

			if (!file.isEmpty()) {
				user2.setImage(file.getBytes());
			} else {
				user2.setImage(user.getImage());
			}

			if (!user2.getPassword().equals("jwr")) {
//                user2.setPassword(this.passwordEncoder.encode(user2.getPassword()));

			} else {
				user2.setPassword(user.getPassword());
			}
			User u = this.userRepository.findById(user.getId()).get();
			u.setImage(user2.getImage());
			u.setName(user2.getName());
			u.setAbout(user2.getAbout());
			u.setPassword(user2.getPassword());
			u.setPhone(user2.getPhone());
			u = this.userRepository.save(u);

			String base64Image = Base64.getEncoder().encodeToString(u.getImage());
			redirectAttributes.addFlashAttribute("base64Image", base64Image);

			redirectAttributes.addFlashAttribute("successMessage", "Successfully update your information !!");
			return "redirect:/user/profileUser";

		} catch (Exception e) {
			model.addAttribute("user1", user2);
			model.put("errorMessage", "Something went wrong " + e.getMessage());
			return "normal/updateProfile";
		}

	}

}
