package com.drivease.serviceimpl;

import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.StateDao;
import com.drivease.model.State;
import com.drivease.service.StateService;

@Service("stateservice")
@Transactional
public class StateServiceImpl implements StateService{

	@Autowired
	StateDao statedao;
	
	
	public long addState(State state) {
		if(state.getStateId()>=1)
		{
			state.setModifiedBy(1);
			state.setModifiedDate(new Date(System.currentTimeMillis()));
		}
		else
		{
			state.setCreatedBy(1);
			state.setCreatedDate(new Date(System.currentTimeMillis()));
		}
		state.setIsActive(1);
		state.setIsDeleted(0);
		return statedao.addState(state);
	}

	public State editState(long id) {
		// TODO Auto-generated method stub
		return statedao.getById(id);
	}

	public boolean deleteState(long id) {
		return statedao.deleteState(id);
	}

	public List<State> getAll() {
		return statedao.getAll();
	}

	public int updateState(State state) {
		// TODO Auto-generated method stub
		return 0;
	}

	public State getById(long id) {
		return statedao.getById(id);
	}
	

}
