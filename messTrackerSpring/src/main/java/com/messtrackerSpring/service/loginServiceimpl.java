package com.messtrackerSpring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.messtrackerSpring.entity.loginEntity;
import com.messtrackerSpring.repository.loginRepository;

@Service
public class loginServiceimpl implements loginService {
	
	@Autowired
	private loginRepository loginRepository;

	@Override
	public loginEntity login(String email, String password) {
		return loginRepository.findByEmailAndPassword(email, password);
	}

}
