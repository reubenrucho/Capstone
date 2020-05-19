package com.jimbe.app.service;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimbe.app.model.Users;
import com.jimbe.app.repository.UserRepository;
import com.jimbe.app.service.UserService;

@Service
@Transactional
public class UserServiceImplement implements UserService {


private UserRepository userRepository;	
	
	@Autowired
	public UserServiceImplement(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}
	@Override
	public Optional<Users> findById(Long id) {
		return userRepository.findById(id);
	}
	@Override
	public Optional<Users> findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	@Override
	public Optional<Users> login(String email, String password) {
		return userRepository.login(email, password);
	}
	@Override
	public List<Users> findByName(String name) {
		return userRepository.findByName(name);
	}
	@Override
	public void delete(Long id) {
		userRepository.deleteById(id);
	}
	@Override
	public void updateUser(Users user) {
		userRepository.findById(user.getId()).ifPresent(a->{
			a.setFirstName(user.getFirstName());
			a.setLastName(user.getLastName());			
		});
	}
	
	@Override
	public void resetpassword(String password, Long id) {
		userRepository.findById(id).ifPresent(a->{
			a.setPassword(password);			
		});
	}
	@Override
	public void save(Users user) {
		userRepository.save(user);
	}
	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}
	@Override
	public void updateRole(String role, Long id) {
		// TODO Auto-generated method stub
		
	}
}
