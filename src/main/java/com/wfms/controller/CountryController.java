package com.wfms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CountryDao;
import com.wfms.dao.impl.CountryDaoImpl;
import com.wfms.model.Country;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/CountryController")
public class CountryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Country country = null;
	
	private CountryDao countryDao = null;
	
	private ApplicationContext context = null;
       
	private List<Country> countryList = null;
	
	private PrintWriter out = null;
	
	private static final Logger LOGGER = Logger.getLogger(CountryController.class
			.getName());
	/**
     * @see HttpServlet#HttpServlet()
     */
    public CountryController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.countryDao = (CountryDaoImpl) this.context.getBean("countryDao");
		this.country = (Country) this.context.getBean("country");
		
		if(action.equals(Constants.ADD)){
			final String countryName = request.getParameter("countryName");
			
			this.country.setCountryName(countryName);
			this.country.setStatus(Constants.ACTIVE);
			this.countryDao.save(this.country);
			
			// Populating active country list
			getServletContext().setAttribute("activeCountryList", this.countryDao.getListByCriteria(this.country, "countryName", 1));
			
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Country");
		}else if(action.equals(Constants.VIEW)){
			int id = -1;
			final String status = request.getParameter("status");
			if(status!=null){
				id = Integer.parseInt(status);
				this.countryList = this.countryDao.getListByCriteria(this.country, "countryName", id);
			}else{
				this.countryList = this.countryDao.getListByCriteria(this.country, "countryName", id);
			}
			request.setAttribute("countryList", this.countryList);
			request.getRequestDispatcher("view-country-list.jsp").forward(request, response);
		}else if(action.equals(Constants.EDIT)){
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			this.country = this.countryDao.read(countryId);
			request.setAttribute("country", this.country);
			request.getRequestDispatcher("edit-country.jsp").forward(request, response);
		}else if(action.equals(Constants.UPDATE)){
			LOGGER.info("Updating country details");
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			final String countryName = request.getParameter("countryName");
			LOGGER.info("country name is " + countryName);
			this.country = this.countryDao.read(countryId);
			this.country.setCountryName(countryName);
			this.countryDao.update(this.country);
			
			// Populating active country list
			getServletContext().setAttribute("activeCountryList", this.countryDao.getListByCriteria(this.country, "countryName", 1));
			
			response.sendRedirect(request.getContextPath() + "/update-successfully.jsp?entity=Country");
		}else if(action.equals(Constants.DELETE)){
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			this.country = this.countryDao.read(countryId);
			this.countryDao.delete(this.country);
		}else if (action.equals(Constants.EXISTS)) {
			LOGGER.info("Checking whether countryname is available or not");
			final String countryname = request.getParameter("countryName");
			this.country = (Country) this.context.getBean("country");
			this.out = response.getWriter();
			final boolean isCountryNameAvailable = this.countryDao.isExists(this.country, "countryName", countryname);
			if (isCountryNameAvailable)
				out.write(Constants.TRUE);
			else
				out.write(Constants.FALSE);
		}
		else{
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



