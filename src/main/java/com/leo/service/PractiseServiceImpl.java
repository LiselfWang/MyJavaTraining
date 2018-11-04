package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dto.PractiseDto;
import com.leo.dao.PractiseDao;

@Service
public class PractiseServiceImpl implements PractiseService {
	@Autowired
	private PractiseDao practiseDao;

	@Override
	public List<PractiseDto> getPlayList() {
		return practiseDao.getPlayList();
	}
}
