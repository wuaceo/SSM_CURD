package cn.aceo.curd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.aceo.curd.bean.Department;
import cn.aceo.curd.bean.Msg;
import cn.aceo.curd.service.DepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
//	@RequestMapping("/depts")
//	public String getDepts(Model model) {
//		List<Department> deptAll = departmentService.getDeptAll();
//		model.addAttribute("deptList", deptAll);
//		return "list";			
//	}
	/**
	 * Json
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts() {
		List<Department> deptAll = departmentService.getDeptAll();
		return Msg.succes().add("deptList", deptAll);			
	}
}
