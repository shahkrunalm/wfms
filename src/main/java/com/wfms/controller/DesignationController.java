package com.wfms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.wfms.dao.DesignationDao;
import com.wfms.dao.impl.DesignationDaoImpl;
import com.wfms.model.Designation;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/DesignationController")
public class DesignationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Designation designation = null;

	private DesignationDao designationDao = null;

	private ApplicationContext context = null;

	private List<Designation> designationList = new ArrayList<Designation>();

	private PrintWriter out = null;

	private static final Logger LOGGER = Logger
			.getLogger(DesignationController.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DesignationController() {
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
			final String action = request.getParameter(Constants.ACTION);
			this.context = new ClassPathXmlApplicationContext(
					"application-context.xml");
			this.designationDao = (DesignationDaoImpl) this.context
					.getBean("designationDao");
			this.designation = (Designation) this.context
					.getBean("designation");

			if (action.equals(Constants.ADD)) {
				this.designation.setDesignationName(request
						.getParameter("designationName"));
				this.designation.setStatus(Constants.ACTIVE);
				this.designationDao.save(designation);
				LOGGER.info("Designation " + Constants.DETAILS_SAVED_SUCCESSFULLY);
				
				// Populating active designation list
				getServletContext().setAttribute(
						"activeDesignationList",
						this.designationDao.getListByCriteria(this.designation,
								"designationName", Constants.ACTIVE));

				response.sendRedirect(request.getContextPath()
						+ "/save-successfully.jsp?entity=Designation");
			} else if (action.equals(Constants.VIEW)) {
				this.designationList = this.designationDao.getListByCriteria(
						this.designation, "designationName",
						Integer.parseInt(request.getParameter("status")));
				request.setAttribute("designationList", this.designationList);
				request.getRequestDispatcher("view-designation-list.jsp")
						.forward(request, response);
			} else if (action.equals(Constants.UPDATE)) {
			} else if (action.equals(Constants.DELETE)) {
			} else if (action.equals(Constants.EXISTS)) {
				LOGGER.info("Checking whether designation is available or not");
				final String designationName = request
						.getParameter("designationName");
				this.designation = (Designation) this.context
						.getBean("designation");
				this.out = response.getWriter();
				final boolean isDesignationAvailable = this.designationDao
						.isExists(this.designation, "designationName",
								designationName);
				if (isDesignationAvailable)
					out.write(Constants.TRUE);
				else
					out.write(Constants.FALSE);
			} else if (action.equals(Constants.CHANGE_STATUS)) {
				/*
				 * LOGGER.info("Change status called"); final long countryId =
				 * Long.parseLong(request.getParameter("countryId")); final int
				 * status = Integer.parseInt(request.getParameter("status"));
				 * this.country = (Country) this.context.getBean("country");
				 * this.country = this.countryDao.read(countryId);
				 * this.country.setStatus(status);
				 * this.countryDao.update(this.country); this.out =
				 * response.getWriter(); if(status==1){
				 * this.out.write("de-active"); }else{ this.out.write("active");
				 * }
				 */

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
