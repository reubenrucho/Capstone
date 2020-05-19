package com.jimbe.app.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jimbe.app.model.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Long> {
	
Optional<Users> findByEmail(String email);

	
	
	@Query("FROM Users WHERE email=?1 AND password=?2")
	Optional<Users> login(String email, String password);
		
	@Query("FROM Users u WHERE u.lastName=?1 OR u.firstName=?1 ")
	List<Users> findByName(String name);
}
