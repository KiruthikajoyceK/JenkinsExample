package com.hcl.main.Rep;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.hcl.main.model.Employee;

public interface EmployeeRepository extends CrudRepository<Employee,Integer> {

	Page findAll(Pageable pageable);

	Employee findById(int id);

}
