import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.leo.dto.Todo;
import com.leo.service.TodoService;
import com.leo.service.TodoServiceImpl;
import com.leo.viewModel.Pager;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring-servlet.xml", "classpath:spring-mybatis.xml"})    
public class TodoServiceTest {
	
	@Autowired
	TodoService todoService;
	
	@Test
	public void testGetAllTodos() {
		try {
			Pager<Todo> todoList = todoService.getAllTodos("", 5, 1);
			if(todoList.getResult() == null) {
				fail("No Result found!");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
		
		
	}

	@Test
	public void testGetTodo() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddTodo() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateTodo() {
		fail("Not yet implemented");
	}

}
