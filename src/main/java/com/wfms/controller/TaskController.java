package com.wfms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.StoryDao;
import com.wfms.dao.TaskDao;
import com.wfms.dao.impl.StoryDaoImpl;
import com.wfms.dao.impl.TaskDaoImpl;
import com.wfms.model.Story;
import com.wfms.model.Task;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/TaskController")
public class TaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Story story = null;
	
	private StoryDao storyDao = null;
	
	private Task task = null;
	
	private TaskDao taskDao = null;
	
	private List<Task> taskList = null;
	
	ApplicationContext context = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.taskDao = (TaskDaoImpl) this.context.getBean("taskDao");
		this.storyDao = (StoryDaoImpl) this.context.getBean("storyDao");
		if(action.equals(Constants.ADD)){
			final long storyId = Long.parseLong(request.getParameter("storyId"));
			final String taskName = request.getParameter("taskName");
			this.story = this.storyDao.read(storyId);
			this.task = (Task) this.context.getBean("task");
			this.task.setTaskName(taskName);
			this.task.setStory(this.story);
			this.task.setStatus(Constants.ACTIVE);
			this.taskDao.save(this.task);
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Task");
		}else if(action.equals(Constants.VIEW)){
			int id = -1;
			final String status = request.getParameter("status");
			if(status!=null){
				id = Integer.parseInt(status);
				this.taskList = this.taskDao.getListByCriteria(this.task, "taskName", id);
			}else{
				this.taskList = this.taskDao.getListByCriteria(this.task, "taskName", id);
			}
			request.setAttribute("projectList", this.taskList);
			request.getRequestDispatcher("view-task-list.jsp").forward(request, response);
		}else if(action.equals(Constants.DELETE)){
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



