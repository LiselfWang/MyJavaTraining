package com.leo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.leo.dto.PractiseDto;

@Repository
public interface PractiseDao {
	List<PractiseDto> getPlayList();
}
