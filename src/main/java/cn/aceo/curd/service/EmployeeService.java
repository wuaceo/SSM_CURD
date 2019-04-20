package cn.aceo.curd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.aceo.curd.bean.Employee;
import cn.aceo.curd.bean.EmployeeExample;
import cn.aceo.curd.bean.EmployeeExample.Criteria;
import cn.aceo.curd.dao.EmployeeMapper;
@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);		
	}
	public void saveEmployee(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	public boolean changeUser(String empName) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count==0;
	}
	public Employee getempByid(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
		
	}
	public void deleteBath(List<Integer> del_ids) {
		EmployeeExample example=new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(del_ids);
		employeeMapper.deleteByExample(example);
		
	}

	
}
