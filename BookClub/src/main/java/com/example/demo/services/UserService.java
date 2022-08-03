package com.example.demo.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	public User register(User user, BindingResult bindingResult) {
		Optional<User> userOptional = userRepository.findByEmail(user.getEmail());
		if(userOptional.isPresent()) {
			bindingResult.rejectValue("email", "unique", "Email address already exist");
		}
		
		if(!user.getPassword().equals(user.getConfirmpassword())) {
			bindingResult.rejectValue("password", "matches", "Passwords don't match");
		}
		
		
		if(bindingResult.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashed);
			return userRepository.save(user);
		}
	}
	
	public User login(LoginUser loginUser, BindingResult bindingResult) {
		Optional<User> optionalUser = userRepository.findByEmail(loginUser.getEmail());
		if(!optionalUser.isPresent()) {
			bindingResult.rejectValue("email", "exists", "Email address does not exist.");
		} else {
			User user = optionalUser.get();
			if(BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
				return user;
			} else {
				bindingResult.rejectValue("password", "Invalid", "Invalid password.");
			}
		}
		return null;
	}
	public User getUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
    	if(optionalUser.isPresent()) {
    		return optionalUser.get();
    	}else {
    		return null;
    	}
	}
}
