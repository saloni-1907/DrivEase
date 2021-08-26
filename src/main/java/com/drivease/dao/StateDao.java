package com.drivease.dao;

import java.util.List;

import com.drivease.model.State;

public interface StateDao extends GenericDAO<State>{
	public List<State> getAll();
	public State getById(long id);
	public boolean deleteState(long id);
	public long addState(State state);

}
