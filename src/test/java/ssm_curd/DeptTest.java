package ssm_curd;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.aceo.curd.bean.Employee;
import cn.aceo.curd.dao.DepartmentMapper;
import cn.aceo.curd.dao.EmployeeMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DeptTest {
	@Autowired
	private DepartmentMapper deparmentMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private SqlSession sqlSession;
	@Test
	public void test() {
//		System.out.println(deparmentMapper);
		
//		deparmentMapper.insertSelective(new Department(null, "开发部"));
//		deparmentMapper.insertSelective(new Department(null, "测试部"));
//		deparmentMapper.updateByPrimaryKeySelective(new Department(1, "java开发部"));
//		deparmentMapper.updateByPrimaryKeySelective(new Department(1, "开发部2"));
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for(int i=1;i<1000;i++) {
//			String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Employee(null,uuid,"男",uuid+"@163.com",1));
//		}
		
		List<Employee> selectByExampleWithDept = employeeMapper.selectByExampleWithDept(null);
		for (Employee employee : selectByExampleWithDept) {
			System.out.println(employee.getEmpName());
		}
		System.out.println("完成");
	}
}
