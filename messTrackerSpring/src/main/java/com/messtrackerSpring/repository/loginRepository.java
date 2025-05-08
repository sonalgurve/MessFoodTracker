package com.messtrackerSpring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.messtrackerSpring.entity.loginEntity;

@Repository
public interface loginRepository extends JpaRepository<loginEntity, Long>{

	loginEntity findByEmailAndPassword(String email, String password);
	

}
