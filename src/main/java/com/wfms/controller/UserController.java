package com.wfms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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

import com.wfms.dao.CityDao;
import com.wfms.dao.CountryDao;
import com.wfms.dao.DesignationDao;
import com.wfms.dao.MessageDao;
import com.wfms.dao.ProjectDao;
import com.wfms.dao.StateDao;
import com.wfms.dao.UserDao;
import com.wfms.dao.impl.DesignationDaoImpl;
import com.wfms.dao.impl.MessageDaoImpl;
import com.wfms.dao.impl.ProjectDaoImpl;
import com.wfms.dao.impl.UserDaoImpl;
import com.wfms.model.Address;
import com.wfms.model.Contact;
import com.wfms.model.Designation;
import com.wfms.model.Message;
import com.wfms.model.Project;
import com.wfms.model.User;
import com.wfms.util.Constants;
import com.wfms.util.UserType;
import com.wfms.util.Utility;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User user = null;

	private UserDao userDao = null;

	private Designation designation = null;

	private DesignationDao designationDao = null;

	private Project project = null;

	private ProjectDao projectDao = null;
	
	private Message message = null;

	private MessageDao messageDao = null;

	private List<User> userList = new ArrayList<User>();

	private PrintWriter out = null;

	private static final Logger LOGGER = Logger.getLogger(UserController.class
			.getName());

	private ApplicationContext context = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext(
				"application-context.xml");
		this.userDao = (UserDaoImpl) this.context.getBean("userDao");
		this.projectDao = (ProjectDaoImpl) this.context.getBean("projectDao");
		this.messageDao = (MessageDaoImpl) this.context.getBean("messageDao");
		HttpSession session = request.getSession(false);
		if(action.equals(Constants.LOGIN)){
			final String username = request.getParameter("username");
			final String password = request.getParameter("password");
			this.user = this.userDao.login(username, password);
			if(this.user!=null){
				if(user.getStatus()==0){
					response.sendRedirect(request.getContextPath() + "/login.jsp?code=2");
				}else{
					HttpSession ssn = request.getSession(true);
					ssn.setAttribute("userssn", this.user);
					ssn.setAttribute("lastLogin", Utility.getFormattedDate(this.user.getLastLoginDateTime()));
					this.user.setLastLoginDateTime(new Date());
					this.userDao.update(this.user);
					if(this.user.getDesignation().getDesignationId() == UserType.DELIVERY_MANAGER){
						response.sendRedirect(request.getContextPath() + "/dm-dashboard.jsp");
					}else if(this.user.getDesignation().getDesignationId() == UserType.ADMIN){
						response.sendRedirect(request.getContextPath() + "/admin-dashboard.jsp");
					}else if(this.user.getDesignation().getDesignationId() == UserType.PROJECT_MANAGER){
						response.sendRedirect(request.getContextPath() + "/pm-dashboard.jsp");
					}else if(this.user.getDesignation().getDesignationId() == UserType.PROJECT_LEAD){
						response.sendRedirect(request.getContextPath() + "/pl-dashboard.jsp");
					}else{
						response.sendRedirect(request.getContextPath() + "/developer-dashboard.jsp");
					}
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp?code=1");
			}
		}
		else if (session != null) {
			
			final User user = (User) session.getAttribute("userssn");
			if (action.equals(Constants.ADD)) {
				this.user = this.populateUser(request);
				this.userDao.save(this.user);
				LOGGER.info("USER " + Constants.DETAILS_SAVED_SUCCESSFULLY);
				// send welcome message
				this.message = this.getWelcomeMessage(this.user);
				this.messageDao.save(this.message);
				LOGGER.info("MESSAGE " + Constants.DETAILS_SAVED_SUCCESSFULLY);
				// populating active delivery manager list
				getServletContext().setAttribute(
						"activeDMList",
						this.userDao.getUserListByDesignation(1,
								Constants.ACTIVE));

				// populating active project manager list
				getServletContext().setAttribute(
						"activePMList",
						this.userDao.getUserListByDesignation(3,
								Constants.ACTIVE));

				response.sendRedirect(request.getContextPath()
						+ "/save-successfully.jsp?entity=User");
			} else if (action.equals(Constants.VIEW)) {
				final String status = request.getParameter("status");
				this.user = (User) this.context.getBean("user");
				this.userList = this.userDao.getListByCriteria(this.user,
						"username", Integer.parseInt(status));
				request.setAttribute("userList", this.userList);
				request.getRequestDispatcher("view-user-list.jsp").forward(
						request, response);
			} else if (action.equals(Constants.DELETE)) {
				final long userId = Long.parseLong(request
						.getParameter("userId"));
				LOGGER.info("DELETE USER METHOD CALLED - " + userId);
				this.user = (User) this.context.getBean("user");
				this.user = this.userDao.read(userId);
				this.userDao.delete(this.user);
				final String status = request.getParameter("status");
				this.userList = this.userDao.getListByCriteria(this.user,
						"username", Integer.parseInt(status));
				request.setAttribute("userList", this.userList);
				request.getRequestDispatcher("view-user-list.jsp").forward(
						request, response);
			} else if (action.equals(Constants.EXISTS)) {
				LOGGER.info("Checking whether username is available or not");
				final String username = request.getParameter("username");
				this.user = (User) this.context.getBean("user");
				this.out = response.getWriter();
				final boolean isUserNameAvailable = this.userDao.isExists(
						this.user, "username", username);
				if (isUserNameAvailable)
					this.out.write(Constants.TRUE);
				else
					this.out.write(Constants.FALSE);
			} else if (action.equals(Constants.CHANGE_PASSWORD)) {
				String currentPassword = request.getParameter("password");
				String newPassword = request.getParameter("newPassword");
				if(currentPassword.equals(user.getPassword())){
					if(currentPassword.equals(newPassword)){
						request.setAttribute("code", "2");
					}else{
						user.setPassword(newPassword);
						session.setAttribute("user", user);
						this.userDao.update(user);
						request.setAttribute("code", "1");
					}
				}else{
					request.setAttribute("code", "0");
				}
				request.getRequestDispatcher("change-password.jsp").forward(request, response);
			} else if (action.equals(Constants.DETAIL)) {
				LOGGER.info("user details called\n\n\n\n");
				final long userId = Long.parseLong(request
						.getParameter("userId"));
				this.user = (User) this.context.getBean("user");
				this.user = this.userDao.read(userId);
				request.setAttribute("user", this.user);
				request.getRequestDispatcher("view-user-detail.jsp").forward(
						request, response);
			} else if (action.equals(Constants.BY_DESIGNATION)) {
				final int status = Integer.parseInt(request
						.getParameter("status"));
				final int designationId = Integer.parseInt(request
						.getParameter("designationId"));
				this.userList = this.userDao.getUserListByDesignation(
						designationId, status);
				request.setAttribute("userList", this.userList);
				request.getRequestDispatcher(
						"view-user-list-by-designation.jsp").forward(request,
						response);
			} else if (action.equals(Constants.GET_RESOURCES)) {
				if(user.getDesignation().getDesignationId() == UserType.ADMIN){
					request.setAttribute("projectList", getServletContext().getAttribute("activeProjectList"));
				}else if(user.getDesignation().getDesignationId() == UserType.DELIVERY_MANAGER){
					request.setAttribute("projectList", this.projectDao.getProjectList("DM_USER_ID", user.getUserId(), Constants.ACTIVE));
				}else if(user.getDesignation().getDesignationId() == UserType.PROJECT_MANAGER){
					request.setAttribute("projectList", this.projectDao.getProjectList("PM_USER_ID", user.getUserId(), Constants.ACTIVE));
				}
				this.userList = this.userDao.getResourcePoolList();
				request.setAttribute("userList", this.userList);
				request.getRequestDispatcher("add-resource.jsp").forward(
						request, response);
			} else if (action.equals(Constants.ADD_RESOURCE)) {
				this.user = this.userDao.read(Long.parseLong(request
						.getParameter("userId")));
				this.project = this.projectDao.read(Long.parseLong(request
						.getParameter("projectId")));
				this.user.setProject(project);
				this.userDao.update(this.user);
				response.sendRedirect(request.getContextPath()
						+ "/added-resource.jsp");
			} else if (action.equals(Constants.CHANGE_STATUS)){
				LOGGER.info("CHANGE USER STATUS METHOD CALLED ");

				this.user = (User) this.context.getBean("user");
				this.user = this.userDao.read(Long.parseLong(request
						.getParameter("userId")));
				final int status = Integer.parseInt(request.getParameter("status"));
				
				
				this.user.setStatus(Integer.parseInt(request.getParameter("userStatus")));
				this.userDao.update(this.user);
				this.userList = this.userDao.getListByCriteria(this.user,
						"username", status);
				request.setAttribute("userList", this.userList);
				request.getRequestDispatcher("view-user-list.jsp").forward(
						request, response);
			}	else if (action.equals(Constants.LOGOUT)) {
				this.userDao.logout(session);
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		}else {
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

	private Message getWelcomeMessage(final User user) {
		Message message = (Message) this.context.getBean("message");
		message.setMsgTo(user.getUsername());
		message.setMsgFrom(Constants.ADMIN);
		message.setSubject(Constants.WELCOME_SUBJECT);
		message.setContent(this.getMessageContent(user));
		message.setDateTime(new Date());
		message.setReadStatus(Constants.UNREAD);
		message.setFromDeleteStatus(Constants.FROM_HAS_NOT_DELETED_SENT_MSG);
		message.setToDeleteStatus(Constants.TO_HAS_NOT_DELETED_RECEIVED_MSG);
		LOGGER.info("msg content " + message);
		return message;
	}

	private String getMessageContent(final User user) {
		StringBuffer messageContent = new StringBuffer();
		messageContent.append(Constants.HI).append(" ")
				.append(user.getFirstName()).append(Constants.COMMA)
				.append(Constants.SINGLE_LINE_BREAK).append(Constants.GREETING)
				.append(Constants.SINGLE_LINE_BREAK)
				.append(Constants.USERNAME_PASSWORD_TEXT)
				.append(Constants.USERNAME).append(Constants.COLLON)
				.append(user.getUsername()).append(Constants.SINGLE_LINE_BREAK)
				.append(Constants.PASSWORD).append(Constants.COLLON)
				.append(user.getPassword()).append(Constants.SINGLE_LINE_BREAK)
				.append(Constants.REGISTER_MSG)
				.append(Constants.FOR_QUERIES_MSG).append(Constants.THANKS)
				.append(Constants.COMMA).append(Constants.SINGLE_LINE_BREAK)
				.append(Constants.SIGNATURE);
		return messageContent.toString();
	}

	private User populateUser(HttpServletRequest request) {
		User user = (User) this.context.getBean("user");
		Address address = (Address) this.context.getBean("address");
		Contact contact = (Contact) this.context.getBean("contact");
		final long designationId = Long.parseLong(request
				.getParameter("designationId"));
		this.designationDao = (DesignationDaoImpl) this.context
				.getBean("designationDao");
		this.designation = this.designationDao.read(designationId);
		final String username = request.getParameter("username");
		final String password = Constants.DEFAULT_PASSWORD;
		final String firstName = request.getParameter("firstName");
		final String lastName = request.getParameter("lastName");
		final String email = username + Constants.AT + Constants.DOMAIN_NAME;
		user.setDesignation(this.designation);
		user.setUsername(username);
		user.setPassword(password);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setUserType(this.designation.getDesignationName());
		user.setRegistrationDate(new Date());
		user.setStatus(Constants.ACTIVE);
		user.setLastLoginDateTime(new Date());
		final String birthDate = request.getParameter("birthDate");
		user.setGender(request.getParameter("gender"));
		if (birthDate != null) {
			user.setBirthDate(Utility.convertToSQLDate(birthDate));
		}
		address.setStreet(request.getParameter("street"));

		final long countryId = Long
				.parseLong(request.getParameter("countryId"));
		CountryDao countryDao = (CountryDao) this.context.getBean("countryDao");
		address.setCountry(countryDao.getCountryName(countryId));

		final long stateId = Long.parseLong(request.getParameter("stateId"));
		StateDao stateDao = (StateDao) this.context.getBean("stateDao");
		address.setState(stateDao.getStateName(stateId));

		final long cityId = Long.parseLong(request.getParameter("cityId"));
		CityDao cityDao = (CityDao) this.context.getBean("cityDao");
		address.setCity(cityDao.getCityName(cityId));

		address.setZipcode(request.getParameter("zipcode"));

		user.setAddress(address);

		contact.setMobile(request.getParameter("mobile"));

		contact.setHomePhone(request.getParameter("homePhone"));

		contact.setEmergencyContactName(request
				.getParameter("emergencyContactName"));

		contact.setEmergencyContactNo(request
				.getParameter("emergencyContactNo"));

		contact.setPersonalEmail(request.getParameter("personalEmail"));

		contact.setWorkPhone(request.getParameter("workPhone"));

		user.setContact(contact);

		return user;
	}
}
