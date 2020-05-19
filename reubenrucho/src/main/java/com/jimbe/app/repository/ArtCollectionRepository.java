package com.jimbe.app.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jimbe.app.model.ArtCollection;
import com.jimbe.app.model.Users;


@Repository
public interface ArtCollectionRepository extends JpaRepository<ArtCollection, Long>{

	//ArtCollection findById(long id);
	Optional<ArtCollection> findById(Long id);
	List<ArtCollection> findByPostedBy(Users user);
	//void delete(Long id);
	//List<ArtCollection> findAll();
	
	
	
}
