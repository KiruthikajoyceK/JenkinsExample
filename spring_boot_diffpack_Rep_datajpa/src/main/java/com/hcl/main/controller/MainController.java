package com.hcl.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.main.Rep.EmployeeRepository;
import com.hcl.main.model.Employee;

@RestController
public class MainController {
	@Autowired
	EmployeeRepository empRep;

	@RequestMapping(value = "/")
	public ModelAndView save(@ModelAttribute("employee") Employee employee) {
		return new ModelAndView("login");

	}

	@RequestMapping(value = "/save")
	public ModelAndView saveEmployee(@ModelAttribute("employee") Employee employee) {
		empRep.save(employee);
		return new ModelAndView("redirect:/listEmployee");

	}

	@RequestMapping(value = "/listEmployee")
	public ModelAndView listEmployee(@PageableDefault(value=2,page=0) Pageable pageable) {
	
		Page page= empRep.findAll(pageable);
		List<Employee> listemp=page.getContent();
		ModelAndView m= new ModelAndView("list","list",listemp);
		m.addObject("total",page.getTotalPages());
		m.addObject("current",page.getNumber());
		return m;

	}
	@RequestMapping(value = "/findById/{id}")
	public ModelAndView findById(@ModelAttribute("employee") Employee employee,@PathVariable int id) {
		Employee employee2=empRep.findById(id);
		List<Employee> listemp=(List)empRep.findAll();
		
		ModelAndView m=new ModelAndView("list","findlist",listemp);
		m.addObject("ls",employee2);
		return m;

	}
	@RequestMapping(value = "/edit")
	public ModelAndView editEmployee(HttpServletRequest request, @ModelAttribute("employee") Employee employee) {
		int id1 = Integer.parseInt(request.getParameter("id"));
		Employee employee2=empRep.findOne(id1);
		List<Employee> listemp=(List)empRep.findAll();
		ModelAndView m=new ModelAndView("edit", "listEmployee", listemp);
		m.addObject("employee",employee2);
		return m;
		

	}
	@RequestMapping(value = "/update")
	public ModelAndView updateEmployee(@ModelAttribute("employee") Employee employee) {
		empRep.save(employee);
		return new ModelAndView("redirect:/listEmployee");

	}
	@RequestMapping(value = "/delete")
	public ModelAndView deleteEmployee(@ModelAttribute("employee") Employee employee) {
		empRep.delete(employee);
		return new ModelAndView("redirect:/listEmployee");

	}
	
}
