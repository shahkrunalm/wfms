package com.wfms.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.StoryDao;
import com.wfms.dao.TaskDao;
import com.wfms.dao.UserDao;
import com.wfms.dao.impl.StoryDaoImpl;
import com.wfms.dao.impl.TaskDaoImpl;
import com.wfms.dao.impl.UserDaoImpl;
import com.wfms.model.Story;
import com.wfms.model.Task;
import com.wfms.model.User;
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
	
	private User user = null;
	
	private UserDao userDao = null;
	
	private List<Task> taskList = new ArrayList<Task>();
	
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
		this.userDao = (UserDaoImpl) this.context.getBean("userDao");
		this.user = (User) this.context.getBean("user");
		this.taskDao = (TaskDaoImpl) this.context.getBean("taskDao");
		this.storyDao = (StoryDaoImpl) this.context.getBean("storyDao");
		this.task = (Task) this.context.getBean("task");
		HttpSession session = request.getSession(false);
		if (session != null) {
			final User user = (User) session.getAttribute("userssn");
			if(action.equals(Constants.ADD)){
				this.story = this.storyDao.read(Long.parseLong(request.getParameter("storyId")));
				this.task.setTaskName(request.getParameter("taskName"));
				this.task.setDescription(request.getParameter("description"));
				this.task.setCreatedBy(user.getUsername());
				this.task.setCreatedOn(new Date());
				this.task.setStory(this.story);
				this.task.setStatus(Constants.ACTIVE);
				this.taskDao.save(this.task);
				response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Task");
			}else if(action.equals(Constants.VIEW)){
				this.taskList = this.taskDao.getListByCriteria(this.task, "taskName", Integer.parseInt(request.getParameter("status")));
				request.setAttribute("taskList", this.taskList);
				request.getRequestDispatcher("view-task-list.jsp").forward(request, response);
			}else if(action.equals(Constants.DELETE)){
			}else if(action.equals(Constants.DETAIL)){
				this.task = this.taskDao.read(Long.parseLong(request.getParameter("taskId")));
				request.setAttribute("task", this.task);
				request.getRequestDispatcher("view-task-detail.jsp").forward(request, response);
			} else if(action.equals(Constants.ASSIGN_TASK)){
				this.task = this.taskDao.read(Long.parseLong(request.getParameter("taskId")));
				final long projectId = this.task.getStory().getProject().getProjectId();
				request.setAttribute("task", this.task);
				request.setAttribute("userList", this.userDao.getProjectUserList(projectId));
				request.getRequestDispatcher("assign-task.jsp").forward(request, response);
			} else if(action.equals(Constants.ASSIGN)){
				this.task = this.taskDao.read(Long.parseLong(request.getParameter("taskId")));
				this.user = this.userDao.read(Long.parseLong(request.getParameter("userId")));
				this.task.setUser(this.user);
				this.taskDao.update(this.task);
				response.sendRedirect(request.getContextPath() + "/assigned-successfully.jsp");
			}else if(action.equals(Constants.MY_TASK)){
				this.taskList = this.taskDao.getMyTaskList(user.getUserId());
				request.setAttribute("taskList", this.taskList);
				request.getRequestDispatcher("view-my-task-list.jsp").forward(request, response);
			} else if(action.equals(Constants.CHANGE_STATUS)){
				this.task = this.taskDao.read(Long.parseLong(request.getParameter("taskId")));
				request.setAttribute("task", this.task);
				request.getRequestDispatcher("change-task-status.jsp").forward(request, response);
			} else if(action.equals(Constants.UPDATE_TASK_STATUS)){
				this.task = this.taskDao.read(Long.parseLong(request.getParameter("taskId")));
				this.task.setStatus(Integer.parseInt(request.getParameter("status")));
				this.taskDao.update(this.task);
				response.sendRedirect(request.getContextPath() + "/update-successfully.jsp?entity=Task");
			}
		} else{
			response.sendRedirect(request.getContextPath()
					+ "/login.jsp?code=1");	
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



