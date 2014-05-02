package com.wfms.controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CompanyDao;
import com.wfms.dao.ProjectDao;
import com.wfms.dao.UserDao;
import com.wfms.dao.impl.CompanyDaoImpl;
import com.wfms.dao.impl.ProjectDaoImpl;
import com.wfms.dao.impl.UserDaoImpl;
import com.wfms.model.Company;
import com.wfms.model.Project;
import com.wfms.model.User;
import com.wfms.util.Constants;
import com.wfms.util.Utility;

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

	private User deliveryManager = null;

	private User projectManager = null;

	private UserDao userDao = null;

	private List<Project> projectList = null;

	ApplicationContext context = null;

	private static final Logger LOGGER = Logger
			.getLogger(ProjectController.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			final User user = (User) session.getAttribute("userssn");
			final String action = request.getParameter(Constants.ACTION);
			this.context = new ClassPathXmlApplicationContext(
					"application-context.xml");
			this.projectDao = (ProjectDaoImpl) this.context
					.getBean("projectDao");
			this.companyDao = (CompanyDaoImpl) this.context
					.getBean("companyDao");
			this.userDao = (UserDaoImpl) this.context.getBean("userDao");
			if (action.equals(Constants.ADD)) {
				final long companyId = Long.parseLong(request
						.getParameter("companyId"));
				final long dmUserId = Long.parseLong(request
						.getParameter("dmUserId"));
				final long pmUserId = Long.parseLong(request
						.getParameter("pmUserId"));

				this.project = (Project) this.context.getBean("project");

				this.deliveryManager = this.userDao.read(dmUserId);
				this.project.setDeliveryManager(this.deliveryManager);

				this.projectManager = this.userDao.read(pmUserId);
				LOGGER.info("\n\n\n\nproject manager " + this.projectManager);
				this.project.setProjectManager(this.projectManager);

				this.company = this.companyDao.read(companyId);

				final String expectedStartDate = request
						.getParameter("startDate");
				if (expectedStartDate != null) {
					this.project.setExpectedStartDate(Utility
							.convertToSQLDate(expectedStartDate));
				}
				final String expectedEndDate = request.getParameter("endDate");
				if (expectedEndDate != null) {
					this.project.setExpectedEndDate(Utility
							.convertToSQLDate(expectedEndDate));
				}
				this.project.setCompany(this.company);
				this.project
						.setProjectName(request.getParameter("projectName"));
				this.project.setProjectShortName(request
						.getParameter("projectShortName"));
				this.project.setProjectDescription(request
						.getParameter("projectDescription"));
				this.project.setStatus(Constants.ACTIVE);
				this.projectDao.save(project);

				// populating active project list
				getServletContext().setAttribute(
						"activeProjectList",
						this.projectDao.getListByCriteria(this.project,
								"projectName", 1));

				response.sendRedirect(request.getContextPath()
						+ "/save-successfully.jsp?entity=Project");
			} else if (action.equals(Constants.VIEW)) {
				final int status = Integer.parseInt(request.getParameter("status"));
				final long designationId = user.getDesignation().getDesignationId(); 
				if(designationId==1){
					this.projectList = this.projectDao.getProjectList("DM_USER_ID", user.getUserId(), status);
				}else if(designationId==3){
					this.projectList = this.projectDao.getProjectList("PM_USER_ID", user.getUserId(), status);
				}else{
					this.projectList = this.projectDao.getListByCriteria(
							this.project, "projectName", status);
				}
				
				request.setAttribute("projectList", this.projectList);
				request.getRequestDispatcher("view-project-list.jsp").forward(
						request, response);
			} else if (action.equals(Constants.DELETE)) {

			} else if (action.equals(Constants.DETAIL)) {
				final long projectId = Long.parseLong(request
						.getParameter("projectId"));
				this.project = this.projectDao.read(projectId);
				request.setAttribute("project", this.project);
				request.getRequestDispatcher("view-project-detail.jsp")
						.forward(request, response);

			}

		} else {
			response.sendRedirect(request.getContextPath()
					+ "/login.jsp?code=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
