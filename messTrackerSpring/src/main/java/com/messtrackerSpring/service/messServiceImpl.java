package com.messtrackerSpring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.messtrackerSpring.entity.loginEntity;
import com.messtrackerSpring.entity.messEntity;
import com.messtrackerSpring.repository.messRepository;

@Service
public class messServiceImpl implements messService{
	
	@Autowired
	private messRepository messRepository;

	@Override
	public void savedata(messEntity entity) {
		 // Check if a record with the same date already exists
        Optional<messEntity> existingEntityOptional = messRepository.findByDateAndEntity(entity.getDate(), entity.getEntity());
        
        if (existingEntityOptional.isPresent()) {
            // Agar current user ke liye uss date ka record milta hai, toh use update karo
            messEntity existingRecordForUser = existingEntityOptional.get();
            existingRecordForUser.setStatus(entity.getStatus());
            existingRecordForUser.setMealType(entity.getMealType());
            existingRecordForUser.setNotype(entity.getNotype());
            // User already wahi hai, toh dobara set karne ki zarurat nahi.
            messRepository.save(existingRecordForUser);
        } else {
            // Agar current user ke liye uss date ka record nahi milta hai, toh naya save karo.
            // Controller ne entity.setEntity(user) pehle hi kar diya hai.
            messRepository.save(entity);
        }	
	}

	@Override
	public List<messEntity> getAllData() {
		return messRepository.findAll();
	}

	@Override
	public List<messEntity> getDataByUser(loginEntity entity) {
	    return messRepository.findByEntity(entity);
	}


	
	
}
