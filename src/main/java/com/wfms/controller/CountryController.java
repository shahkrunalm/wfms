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

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CountryDao;
import com.wfms.dao.StateDao;
import com.wfms.dao.impl.CountryDaoImpl;
import com.wfms.dao.impl.StateDaoImpl;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Country;
import com.wfms.model.State;
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
		}else if(action.equals(Constants.DELETE)){
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			Country country = this.countryDao.read(countryId);
			this.countryDao.delete(country);
		}else if (action.equals(Constants.COUNTRY_EXISTS)) {
			LOGGER.info("Checking whether countryname is available or not");
			final String countryname = request.getParameter("countryName");
			PrintWriter out = response.getWriter();
			final boolean isCountryNameAvailable = this.countryDao.isCountryNameAvailable(countryname);
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



