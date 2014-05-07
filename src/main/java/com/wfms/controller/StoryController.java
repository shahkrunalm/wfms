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

import com.wfms.dao.ProjectDao;
import com.wfms.dao.StoryDao;
import com.wfms.dao.impl.ProjectDaoImpl;
import com.wfms.dao.impl.StoryDaoImpl;
import com.wfms.model.Project;
import com.wfms.model.Story;
import com.wfms.model.User;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/StoryController")
public class StoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Story story = null;
	
	private StoryDao storyDao = null;
	
	private Project project = null;
	
	private ProjectDao projectDao = null;
	
	private List<Story> storyList = new ArrayList<Story>();
	
	ApplicationContext context = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.projectDao = (ProjectDaoImpl) this.context.getBean("projectDao");
		this.storyDao = (StoryDaoImpl) this.context.getBean("storyDao");
		this.story = (Story) this.context.getBean("story");
		HttpSession session = request.getSession(false);
		if (session != null) {
			final User user = (User) session.getAttribute("userssn");
			if(action.equals(Constants.ADD)){
				final long projectId = Long.parseLong(request.getParameter("projectId"));
				final String storyName = request.getParameter("storyName");
				final String description = request.getParameter("description");
				this.project = this.projectDao.read(projectId);
				this.story.setStoryName(storyName);
				this.story.setDescription(description);
				this.story.setProject(this.project);
				this.story.setCreatedOn(new Date());
				this.story.setCreatedBy(user.getUsername());
				this.story.setStatus(Constants.ACTIVE);
				this.storyDao.save(this.story);
				response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Story");
			}else if(action.equals(Constants.VIEW)){
				this.storyList = this.storyDao.getListByCriteria(this.story, "storyName", Integer.parseInt(request.getParameter("status")));
				request.setAttribute("storyList", this.storyList);
				request.getRequestDispatcher("view-story-list.jsp").forward(request, response);
			}else if(action.equals(Constants.DELETE)){
			}else if(action.equals(Constants.DETAIL)){
				final long storyId = Long.parseLong(request.getParameter("storyId"));
				this.story = this.storyDao.read(storyId);
				request.setAttribute("story", this.story);
				request.getRequestDispatcher("view-story-detail.jsp").forward(request, response);
			}else if(action.equals(Constants.VIEW_STORIES_BY_PROJECT)){
				final long projectId = Long.parseLong(request.getParameter("projectId"));
				this.storyList = this.storyDao.getStoryListByProject(projectId, Integer.parseInt(request.getParameter("status")));
				request.setAttribute("storyList", this.storyList);
				request.getRequestDispatcher("view-story-list.jsp").forward(request, response);	
			}

		}else{
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



