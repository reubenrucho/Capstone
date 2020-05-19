package com.jimbe.app.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jimbe.app.service.UserService;
import com.jimbe.app.utils.DataValidation;
import com.jimbe.app.utils.States;
import com.jimbe.app.utils.WebUtils;
import com.jimbe.app.model.Address;
import com.jimbe.app.model.ArtCollection;
import com.jimbe.app.model.Users;
import com.jimbe.app.repository.AddressRepository;
import com.jimbe.app.repository.ArtCollectionRepository;

@Controller
@SessionAttributes({ "loggedInUser", "role" })
public class AppController {

	@Autowired
	private UserService userService;

	@Autowired
	private ArtCollectionRepository artCollectionRepository;

	@Autowired
	private AddressRepository addressRepository;

	@Autowired
	private DataValidation dataValidation;

	@Autowired
	WebUtils webUtils;

	private final String UPLOAD_FOLDER = "profile-images";

	@GetMapping("getstate")
	String state(@RequestParam String state, Model model) {
		model.addAttribute("msg", state);
		return "signup";
	}

	@ModelAttribute("states")
	public List<States> populateStates() {
		return Arrays.asList(States.values());
	}

	@GetMapping("message-{msg}")
	String message(@PathVariable String msg, Model model) {
		model.addAttribute("msg", msg);
		return "index";
	}

	@GetMapping({ "/", "index" })
	String index(Model model) throws IllegalStateException, IOException{
		model.addAttribute("page", "Home Page");

		return "index";
	}

	@GetMapping("login")
	String login(Model model) {
		model.addAttribute("msg", "Login");

		return "login";
	}

	@GetMapping("contact")
	String cont(Model model) {
		model.addAttribute("msg", "This is contact us page");
		return "contact";
	}

	@GetMapping("sales")
	String sales(Model model) {
		model.addAttribute("msg", "This is sales page");
		return "sales";
	}

	@GetMapping("market")
	String market(Model model, String email) {
	//	Optional<Users> user = userService.findByEmail(email);
	//	model.addAttribute("userArt", user.get());
		model.addAttribute("msg", "");
		model.addAttribute("artCollectionList", artCollectionRepository.findAll());
		return "market";
	}

	@GetMapping("art")
	String art(Model model) {
		model.addAttribute("msg", "");
		return "art";
	}

	@GetMapping("upload")
	String upload(Model model) {
		model.addAttribute("msg", "upload page!");
		return "upload";
	}

	@GetMapping("message")
	String message(Model model) {
		model.addAttribute("msg", "message page!");
		return "message";
	}

	@ModelAttribute("address")
	Address address() {
		return new Address();
	}
	
	@ModelAttribute("artCollection")
	ArtCollection artCollection() {
		return new ArtCollection();
	}

	@GetMapping("personalization")
	String personalization(@SessionAttribute("loggedInUser") String email, Model model) {
		Optional<Users> user = userService.findByEmail(email);
		if (user.isPresent()) {
			model.addAttribute("user_account", user.get());
			model.addAttribute("user", user.get());
		}
		model.addAttribute("msg", "");
		return "personalization";
	}

	@PostMapping("uploadPhoto")
	String uploadPhoto(@SessionAttribute("loggedInUser") String email, @RequestParam("file") MultipartFile file) {
		// WILL ADD call to upload photo
		Optional<Users> user = userService.findByEmail(email);
		if (user.isPresent()) {
			try {
				webUtils.addProfilePhoto(file, user.get().getId(), UPLOAD_FOLDER);
			} catch (Exception e) {
				System.out.println("Failed to upload");
			}
		}
		return "redirect:/personalization";
	}

//	@PostMapping("uploadArtCollection")
//	String uploadArtCollection(@SessionAttribute("loggedInUser") String email, @RequestBody ArtCollection art,
//			@RequestParam("file") MultipartFile file) {
//		// WILL ADD call to upload photo
//		Optional<Users> user = userService.findByEmail(email);
//		if (user.isPresent()) {
//			art.setPostedBy(user.get());
//			// Upload photo and save data
//		}
//		return "redirect:/personalization";
//	}

	@GetMapping("profile")
	String profile(@SessionAttribute("loggedInUser") String email, Model model) {
		Users user = userService.findByEmail(email).get();
		try {
			model.addAttribute("user_account", user);
			model.addAttribute("msg", "Welcome");
			model.addAttribute("artCollectionList", artCollectionRepository.findByPostedBy(user));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		return "profile";
	}

	@PostMapping("login")
	String login(@RequestParam String email, @RequestParam String password, Model model, RedirectAttributes redirect) {

		Optional<Users> findUser = userService.login(email, password);
		if (findUser.isPresent()) {
			model.addAttribute("role", findUser.get().getRole());
			model.addAttribute("loggedInUser", findUser.get().getEmail());
			redirect.addFlashAttribute("msg", " Login Success  " + email);
		} else {
			redirect.addFlashAttribute("error", "Invalid Credentials  ");
			return "redirect:/login";
		}
		return "redirect:/index";
	}

	@GetMapping("logout")
	String logout(HttpSession session, SessionStatus status, Model model) {
		status.setComplete();
		// session.invalidate();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("success", "You have been logged out");

		return "login";
	}

	@GetMapping("signup")
	String signup(Model model) {
		model.addAttribute("user", new Users());

		return "signup";
	}

	@PostMapping("register")
	String register(@ModelAttribute("user") Users user, BindingResult result, RedirectAttributes redirect,
			Model model) {
		try {
			dataValidation.validate(user, result);
			if (result.hasErrors()) {
				return "signup";
			}
			user.setRole("USER");
			userService.save(user);
			model.addAttribute("role", user.getRole());
			model.addAttribute("loggedInUser", user.getEmail());
			redirect.addFlashAttribute("msg", "Registration success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/profile";
	}

	@GetMapping("customers")
	String users(Model model) {
		model.addAttribute("msg", "Users");
		model.addAttribute("list", userService.findAll());

		return "users";
	}

	@GetMapping("forgotpassword")
	String forgotpassword(Model model) {
		model.addAttribute("msg", "Login");

		return "forgotpassword";
	}

	@PostMapping("request-passord-reset")
	String resetpass(Model model, @RequestParam String email) {
		try {
			Optional<Users> findUser = userService.findByEmail(email);
			if (findUser.isPresent()) {
				Users usr = findUser.get();
				Random random = new Random();
				String token = String.format("%04d", random.nextInt(10000));
				usr.setToken(token);
				userService.save(usr);
				model.addAttribute("email", email);
				webUtils.sendMail(email, "Please use this token to reset your password " + token, "Password Reset");
			} else {
				model.addAttribute("error", "No user account found with " + email);
				return "login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forgotpassword";
	}

	@PostMapping("forgotpassword")
	String forgotpassword(RedirectAttributes red, Model model, @RequestParam String email, @RequestParam String token,
			@RequestParam String password) {
		try {
			String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";

			if (!password.matches(passwordRegex)) {
				model.addAttribute("error",
						"Password should be at least 8 characters, lower case, upper case and a special character.");
				model.addAttribute("email", email);
				return "resetpassword";
			}
			Optional<Users> findUser = userService.findByEmail(email);
			if (findUser.isPresent() && token.equals(findUser.get().getToken())) {
				Users usr = findUser.get();
				usr.setToken("");
				usr.setPassword(password);
				userService.save(usr);
				model.addAttribute("role", usr.getRole());
				model.addAttribute("loggedInuser", usr.getEmail());
				red.addFlashAttribute("success",
						"Password reset success thanks, please contact admin if you did not perform this change");
				webUtils.sendMail(email,
						"Password reset success thanks, please contact admin if you did not perform this change",
						"Password Reset");
				return "redirect:profile";
			} else {
				model.addAttribute("error", "Invalid token");
				model.addAttribute("email", email);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forgotpassword";
	}

	@PostMapping("sendemail")
	String sendemail(Model model, @RequestParam String email, @RequestParam String name, @RequestParam String message,
			@RequestParam String subject) {
		try {
			webUtils.sendMail(email, message + " From " + name, subject);
			model.addAttribute("msg", "Thank you " + name + ". Email sent :) ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "contact";
	}
	
	@PostMapping("sendMessage")
	String sendMessage(Model model, @RequestParam String email, @RequestParam String name, @RequestParam String message,
			@RequestParam String subject) {
		try {
			webUtils.sendMessage(email, message + " From " + name, subject);
			model.addAttribute("msg", "Thank you " + name + ". Email sent :) ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/market";
	}

	@ModelAttribute("user")
	Users user() {
		return new Users();
	}
	
	@GetMapping("delete")
	String delete(@RequestParam Long id, RedirectAttributes model) {
		try {
			userService.delete(id);	
			webUtils.deletefolder(5);
			model.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return "redirect:/logout";		
	}
	
	@PostMapping("deleteArt")
	String deleteArt(@RequestParam Long id, RedirectAttributes model) {
		try {
			artCollectionRepository.deleteById(id);	
			webUtils.deleteArtCollection(id);
			model.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return "redirect:/profile";		
	}

	@PostMapping("updatecontact")
	String update(@ModelAttribute Address address, Model model) {
		try {
			Users user = userService.findById(address.getId()).get();
			address.setUser(user);
			addressRepository.save(address);
			model.addAttribute("msg", "Update success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:personalization";
	}

	@PostMapping(path = "update-user")
	public String updateuser(@ModelAttribute("user") Users user, Model model) {
		try {
			userService.findById(user.getId()).ifPresent(dbUser -> {
				dbUser.setFirstName(user.getFirstName());
				dbUser.setLastName(user.getLastName());
				dbUser.setSkills(user.getSkills());
				dbUser.setProfession(user.getProfession());
				dbUser.setDescription(user.getDescription());
				dbUser.setWebsite(user.getWebsite());
				userService.save(dbUser);
			});
			model.addAttribute("list", userService.findAll());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/personalization";
	}

	@PostMapping(path = "artupload")
	public String artupload(@SessionAttribute("loggedInUser") String email, @ModelAttribute("artCollection") ArtCollection art,
			Model model, @RequestParam("file") MultipartFile file) {
		Optional<Users> user = userService.findByEmail(email);
		if (user.isPresent()) {
			try {
					art.setPostedBy(user.get());
					art=artCollectionRepository.save(art);
					try {
						webUtils.addArtImage(file, art.getId(), "artfolder");
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				model.addAttribute("art" );
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "redirect:/profile";
	}

}
