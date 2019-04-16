package com.boot.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface EmployeeRepository extends CrudRepository<Employee,Integer>,PagingAndSortingRepository<Employee, Integer>{

	Employee findById(int id);
	Page<Employee> findAll(Pageable pageable);
}
