package cn.aceo.curd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.aceo.curd.bean.Employee;
import cn.aceo.curd.bean.Msg;
import cn.aceo.curd.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn,Model model) {
		PageHelper.startPage(pn,10);
		List<Employee> emps= employeeService.getAll();
		//用PageInfo对结果进行包装
		PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	/**
	 * 验证
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/changeUser")
	public Msg changeUser(@RequestParam("empName") String empName) {
		String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regx)) {
			return Msg.fail().add("va_msg","用户名格式不正确");
		}
		boolean b= employeeService.changeUser(empName);
		if(b) {
			return Msg.succes();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
		
	}
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteListEmp/{ids}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteListEmp(@PathVariable("ids") String ids) {
		List<Integer> del_ids= new ArrayList<Integer>();
		String[] str_ids = ids.split("-");
		for (String string : str_ids) {
			del_ids.add(Integer.parseInt(string));
		}
		employeeService.deleteBath(del_ids);
		return Msg.succes();
	}
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteEmp/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("id") Integer id) {
		employeeService.deleteEmp(id);
		return Msg.succes();
	}
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getemp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getemp(@PathVariable("id") Integer id) {
		Employee employee=employeeService.getempByid(id);
		return Msg.succes().add("employee", employee);
	}
	/**
	 * 更新 根据id
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/updateEmp/{empId}",method = RequestMethod.POST)
	@ResponseBody
	public Msg updateEmp(@Valid Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.succes();
	}
	/**
	 * 保存
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "saveEmp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			Map<String , Object> map=new HashMap<String, Object>();
			 List<FieldError> fieldErrors = result.getFieldErrors();
			 for (FieldError fieldError : fieldErrors) {
				 map.put(fieldError.getField(), fieldError.getDefaultMessage() );
			}
			return Msg.fail().add("errorFieds", map);
		}else {
			employeeService.saveEmployee(employee);
			return Msg.succes();
		}
		
		
		
		
	}
	
	/*Json返回*/
//	@ResponseBody
//	@RequestMapping("empsJson")
//	public Msg getEmpsWithJSON(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn) {
//		PageHelper.startPage(pn,5);
//		List<Employee> emps= employeeService.getAll();
//		//用PageInfo对结果进行包装
//		PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
//		return Msg.succes().add("pageInfo", page);
//	}
}
