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

import com.wfms.dao.CompanyDao;
import com.wfms.dao.ProjectDao;
import com.wfms.dao.impl.CompanyDaoImpl;
import com.wfms.dao.impl.ProjectDaoImpl;
import com.wfms.model.Company;
import com.wfms.model.Project;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/ProjectController")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Company company = null;
	
	private CompanyDao companyDao = null;
	
	private Project project = null;
	
	private ProjectDao projectDao = null;
	
	private List<Project> projectList = null;
	
	ApplicationContext context = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.projectDao = (ProjectDaoImpl) this.context.getBean("projectDao");
		this.companyDao = (CompanyDaoImpl) this.context.getBean("companyDao");
		if(action.equals(Constants.ADD)){
			final long companyId = Long.parseLong(request.getParameter("companyId"));
			final String projectName = request.getParameter("projectName");
			this.company = this.companyDao.read(companyId);
			this.project = (Project) this.context.getBean("project");
			this.project.setCompany(this.company);
			this.project.setProjectName(projectName);
			this.project.setStatus(Constants.ACTIVE);
			this.projectDao.save(project);
			
			// populating active project list
			getServletContext().setAttribute("activeProjectList", this.projectDao.getListByCriteria(this.project, "projectName", 1));
			
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Project");
		}else if(action.equals(Constants.VIEW)){
			int id = -1;
			final String status = request.getParameter("status");
			if(status!=null){
				id = Integer.parseInt(status);
				this.projectList = this.projectDao.getListByCriteria(this.project, "projectName", id);
			}else{
				this.projectList = this.projectDao.getListByCriteria(this.project, "projectName", id);
			}
			request.setAttribute("projectList", this.projectList);
			request.getRequestDispatcher("view-project-list.jsp").forward(request, response);
		}else if(action.equals(Constants.DELETE)){
		
		}else if(action.equals(Constants.DETAIL)){
			final long projectId = Long.parseLong(request.getParameter("projectId"));
			this.project = this.projectDao.read(projectId);
			request.setAttribute("project", this.project);
			request.getRequestDispatcher("view-project-detail.jsp").forward(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



