package com.wfms.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CityDao;
import com.wfms.dao.MessageDao;
import com.wfms.dao.StateDao;
import com.wfms.dao.impl.CityDaoImpl;
import com.wfms.dao.impl.MessageDaoImpl;
import com.wfms.dao.impl.StateDaoImpl;
import com.wfms.model.City;
import com.wfms.model.Message;
import com.wfms.model.State;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/pages/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MessageDao messageDao = null;

	ApplicationContext context = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageController() {
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
		this.messageDao = (MessageDaoImpl) this.context.getBean("messageDao");
		if (action.equals(Constants.COMPOSE)) {
			Message message = (Message) this.context.getBean("message");
			final String to = request.getParameter("msgTo");
			
			// later on replaced with session
			final String from = "admin@wfms.com";
			final String subject = request.getParameter("subject");
			final String content = request.getParameter("content");
			message.setMsgTo(to);
			message.setMsgFrom(from);
			message.setSubject(subject);
			message.setContent(content);
			message.setDateTime(new Date());
			message.setReadStatus(Constants.UNREAD);
			message.setFromDeleteStatus(Constants.FROM_HAS_NOT_DELETED_SENT_MSG);
			message.setToDeleteStatus(Constants.TO_HAS_NOT_DELETED_RECEIVED_MSG);
			this.messageDao.save(message);
			response.sendRedirect(request.getContextPath()
					+ "/sent-successfully.jsp?entity=message");
		} else if (action.equals(Constants.DELETE)) {
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
