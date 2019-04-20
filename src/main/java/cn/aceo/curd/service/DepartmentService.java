package cn.aceo.curd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.aceo.curd.bean.Department;
import cn.aceo.curd.bean.DepartmentExample;
import cn.aceo.curd.dao.DepartmentMapper;
@Service
public class DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	public List<Department> getDeptAll() {	
		return departmentMapper.selectByExample(null);
	}
	public List<Department> getDeptByname() {
		DepartmentExample example = null;
		return departmentMapper.selectByExample(example);
		
	}
}
