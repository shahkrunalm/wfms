package com.wfms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.MessageDao;
import com.wfms.dao.UserDao;
import com.wfms.dao.impl.MessageDaoImpl;
import com.wfms.dao.impl.UserDaoImpl;
import com.wfms.model.Message;
import com.wfms.model.User;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private User user = null;

	private UserDao userDao = null;

	private List<User> userList = null;

	private Message message = null;

	private MessageDao messageDao = null;

	private static final Logger LOGGER = Logger.getLogger(UserController.class
			.getName());

	ApplicationContext context = null;

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
		this.messageDao = (MessageDaoImpl) this.context.getBean("messageDao");

		if (action.equals(Constants.ADD)) {
			this.user = (User) this.context.getBean("user");
			final String username = request.getParameter("username");
			final String password = Constants.DEFAULT_PASSWORD;
			final String firstName = request.getParameter("firstName");
			final String lastName = request.getParameter("lastName");
			final String email = username + Constants.AT
					+ Constants.DOMAIN_NAME;
			this.user.setUsername(username);
			this.user.setPassword(password);
			this.user.setFirstName(firstName);
			this.user.setLastName(lastName);
			this.user.setEmail(email);
			this.user.setRegistrationDate(new Date());
			this.user.setStatus(Constants.ACTIVE);
			this.userDao.save(this.user);

			// send message
			this.message = this.getWelcomeMessage(this.user);
			this.messageDao.save(this.message);

			response.sendRedirect(request.getContextPath()
					+ "/save-successfully.jsp?entity=User");
		} else if (action.equals(Constants.DELETE)) {
		} else if (action.equals(Constants.USER_EXISTS)) {
			LOGGER.info("Checking whether username is available or not");
			final String username = request.getParameter("username");
			PrintWriter out = response.getWriter();
			this.userList = this.userDao.userExists(username);
			if (userList.size() == 0)
				out.write("true");
			else
				out.write("false");
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
		return message;
	}

	private String getMessageContent(final User user) {
		StringBuffer messageContent = new StringBuffer();
		messageContent.append(Constants.HI).append(user.getFirstName())
				.append(Constants.COMMA).append(Constants.SINGLE_LINE_BREAK)
				.append(Constants.GREETING).append(Constants.SINGLE_LINE_BREAK)
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
}
