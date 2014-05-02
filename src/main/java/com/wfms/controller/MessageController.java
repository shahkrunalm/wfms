package com.wfms.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.MessageDao;
import com.wfms.dao.impl.MessageDaoImpl;
import com.wfms.model.Message;
import com.wfms.model.User;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Message message = null;
	
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
		this.message = (Message) this.context.getBean("message");
		HttpSession session = request.getSession(false);
		if (session != null) {
			final User user = (User) session.getAttribute("userssn");
			if (action.equals(Constants.COMPOSE)) {
				this.message.setMsgTo(request.getParameter("msgTo"));
				this.message.setMsgFrom(user.getUsername());
				this.message.setSubject(request.getParameter("subject"));
				this.message.setContent(request.getParameter("content"));
				this.message.setDateTime(new Date());
				this.message.setReadStatus(Constants.UNREAD);
				this.message.setFromDeleteStatus(Constants.FROM_HAS_NOT_DELETED_SENT_MSG);
				this.message.setToDeleteStatus(Constants.TO_HAS_NOT_DELETED_RECEIVED_MSG);
				this.messageDao.save(this.message);
				response.sendRedirect(request.getContextPath()
						+ "/sent-successfully.jsp?entity=Message");
			} else if (action.equals(Constants.VIEW)) {
				this.message = this.messageDao.read(Long.parseLong(request.getParameter("messageId")));
				this.message.setReadStatus(Constants.READ);
				this.messageDao.update(this.message);
				request.setAttribute("msg", this.message);
				request.getRequestDispatcher("view-message.jsp").forward(request, response);
			} else if(action.equals(Constants.INBOX)){
				request.setAttribute("messageList", this.messageDao.inbox(user.getUsername()));
				request.getRequestDispatcher("inbox.jsp").forward(request, response);
			}  else if(action.equals(Constants.SENT)){
				request.setAttribute("messageList", this.messageDao.sent(user.getUsername()));
				request.getRequestDispatcher("sent.jsp").forward(request, response);
			} else if (action.equals(Constants.INBOX_DELETE)) {
				this.message = this.messageDao.read(Long.parseLong(request.getParameter("messageId")));
				this.message.setToDeleteStatus(Constants.TO_HAS_DELETED_RECEIVED_MSG);
				this.messageDao.update(this.message);
				response.sendRedirect(request.getContextPath()
						+ "/MessageController?action=inbox");
			} else if (action.equals(Constants.SENT_DELETE)) {
				this.message = this.messageDao.read(Long.parseLong(request.getParameter("messageId")));
				this.message.setFromDeleteStatus(Constants.FROM_HAS_DELETED_SENT_MSG);
				this.messageDao.update(this.message);
				response.sendRedirect(request.getContextPath()
						+ "/MessageController?action=sent");
			}

		} else{
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
