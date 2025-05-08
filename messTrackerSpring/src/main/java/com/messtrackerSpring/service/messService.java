package com.messtrackerSpring.service;

import java.util.List;

import com.messtrackerSpring.entity.loginEntity;
import com.messtrackerSpring.entity.messEntity;

public interface messService {

	void savedata(messEntity entity);

	List<messEntity> getAllData();

	List<messEntity> getDataByUser(loginEntity entity);


}
