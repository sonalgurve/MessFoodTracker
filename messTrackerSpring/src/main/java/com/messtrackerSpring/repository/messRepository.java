package com.messtrackerSpring.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.messtrackerSpring.entity.loginEntity;
import com.messtrackerSpring.entity.messEntity;

public interface messRepository extends JpaRepository<messEntity, Long>{
	Optional<messEntity> findByDateAndEntity(LocalDate date, loginEntity entity);

	List<messEntity> findByEntity(loginEntity entity); 
}
