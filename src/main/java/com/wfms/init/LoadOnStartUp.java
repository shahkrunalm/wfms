package com.wfms.init;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CompanyDao;
import com.wfms.dao.CountryDao;
import com.wfms.dao.DesignationDao;
import com.wfms.dao.ProjectDao;
import com.wfms.dao.StoryDao;
import com.wfms.dao.UserDao;
import com.wfms.dao.impl.CompanyDaoImpl;
import com.wfms.dao.impl.CountryDaoImpl;
import com.wfms.dao.impl.DesignationDaoImpl;
import com.wfms.dao.impl.ProjectDaoImpl;
import com.wfms.dao.impl.StoryDaoImpl;
import com.wfms.dao.impl.UserDaoImpl;
import com.wfms.model.Company;
import com.wfms.model.Country;
import com.wfms.model.Designation;
import com.wfms.model.Project;
import com.wfms.model.Story;
import com.wfms.model.User;
import com.wfms.util.Constants;
import com.wfms.util.UserType;

/**
 * Servlet implementation class LoadOnStartUp
 */
@WebServlet("/LoadOnStartUp")
public class LoadOnStartUp extends HttpServlet {
	
	private static final Logger LOGGER = Logger.getLogger(LoadOnStartUp.class
		      .getName());

	private static final long serialVersionUID = 1L;

	private Country country = null;
	
	private CountryDao countryDao = null;
	
	private Company company = null;
	
	private CompanyDao companyDao = null;
	
	private Project project = null;
	
	private ProjectDao projectDao = null;
	
	private Story story = null;
	
	private StoryDao storyDao = null;
	
	private Designation designation  = null;
	
	private DesignationDao designationDao = null;
	
	private User user = null;
	
	private UserDao userDao = null;
	
	ApplicationContext context = null;

	public void init() throws ServletException {
		
		LOGGER.info("init() method called");
		
		this.context = new ClassPathXmlApplicationContext(
				"application-context.xml");
		
		this.countryDao = (CountryDaoImpl) this.context.getBean("countryDao");
		
		this.country = (Country) this.context.getBean("country");
		
		// populating active country list
		getServletContext().setAttribute("activeCountryList",
				this.countryDao.getListByCriteria(this.country, "countryName", Constants.ACTIVE));
		
		
		this.companyDao = (CompanyDaoImpl) this.context.getBean("companyDao");
		
		this.company = (Company) this.context.getBean("company");
		
		// populating active company list
		getServletContext().setAttribute("activeCompanyList",
				this.companyDao.getListByCriteria(this.company, "companyName", Constants.ACTIVE));
		
		this.projectDao = (ProjectDaoImpl) this.context.getBean("projectDao");
		
		this.project = (Project) this.context.getBean("project");
		
		// populating active project list
		getServletContext().setAttribute("activeProjectList",
				this.projectDao.getListByCriteria(this.project, "projectName", Constants.ACTIVE));
		
		this.storyDao = (StoryDaoImpl) this.context.getBean("storyDao");
		
		this.story = (Story) this.context.getBean("story");
		
		// populating active story list
		getServletContext().setAttribute("activeStoryList",
				this.storyDao.getListByCriteria(this.story, "storyName", Constants.ACTIVE));

		this.designationDao = (DesignationDaoImpl) this.context.getBean("designationDao");
		
		this.story = (Story) this.context.getBean("story");
		
		// populating active story list
		getServletContext().setAttribute("activeDesignationList",
				this.designationDao.getListByCriteria(this.designation, "designationName", Constants.ACTIVE));
		
		this.userDao = (UserDaoImpl) this.context.getBean("userDao");
		
		this.user = (User) this.context.getBean("user");
		
		
		// populating active delivery manager list
		getServletContext().setAttribute("activeDMList",
				this.userDao.getUserListByDesignation(UserType.DELIVERY_MANAGER, Constants.ACTIVE));
		
		// populating active project manager list
		getServletContext().setAttribute("activePMList",
				this.userDao.getUserListByDesignation(UserType.PROJECT_MANAGER, Constants.ACTIVE));
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadOnStartUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
