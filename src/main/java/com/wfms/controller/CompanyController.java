package com.wfms.controller;

import java.io.IOException;
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
import com.wfms.dao.CompanyDao;
import com.wfms.dao.CountryDao;
import com.wfms.dao.StateDao;
import com.wfms.dao.impl.CompanyDaoImpl;
import com.wfms.model.Address;
import com.wfms.model.Company;
import com.wfms.model.Contact;
import com.wfms.model.User;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/CompanyController")
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Company company = null;
	
	private CompanyDao companyDao = null;
	
	private ApplicationContext context = null;
       
	private List<Company> companyList = new ArrayList<Company>();
	
	private static final Logger LOGGER = Logger.getLogger(CompanyController.class
			.getName());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			final User user = (User) session.getAttribute("userssn");
			
			final String action = request.getParameter(Constants.ACTION);
			this.context = new ClassPathXmlApplicationContext("application-context.xml");
			this.companyDao = (CompanyDaoImpl) this.context.getBean("companyDao");
			this.company = (Company) this.context.getBean("company");
			
			if(action.equals(Constants.ADD)){
				this.company = this.populateCompany(request, user.getUsername());
				this.companyDao.save(this.company);
				
				// Populating active company list
				getServletContext().setAttribute("activeCompanyList", this.companyDao.getListByCriteria(this.company, "companyName", 1));
				
				response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Company");
			}else if(action.equals(Constants.VIEW)){
				this.companyList = this.companyDao.getListByCriteria(this.company, "companyName", Integer.parseInt(request.getParameter("status")));
				request.setAttribute("companyList", this.companyList);
				request.getRequestDispatcher("view-company-list.jsp").forward(request, response);
			}else if(action.equals(Constants.DELETE)){
				final long companyId = Long.parseLong(request.getParameter("companyId"));
				LOGGER.info("DELETE METHOD CALLED FOR COMPANY ID " + companyId);
				this.company = (Company) this.context.getBean("company");
				this.company = this.companyDao.read(companyId);
				this.companyDao.delete(this.company);
				this.companyList = this.companyDao.getListByCriteria(this.company, "companyName", Integer.parseInt(request.getParameter("status")));
				request.setAttribute("companyList", this.companyList);
				request.getRequestDispatcher("view-company-list.jsp").forward(request, response);
			}else if(action.equals(Constants.DETAIL)){
				final long companyId = Long.parseLong(request.getParameter("companyId"));
				this.company = this.companyDao.read(companyId);
				request.setAttribute("company", this.company);
				request.getRequestDispatcher("view-company-detail.jsp").forward(request, response);

			}else{
				
			}

		}else{
			response.sendRedirect(request.getContextPath()
					+ "/login.jsp?code=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private Company populateCompany(HttpServletRequest request, final String username){
		Company company = (Company) this.context.getBean("company");
		Address address = (Address) this.context.getBean("address");
		Contact contact = (Contact) this.context.getBean("contact");
		
		company.setCompanyName(request.getParameter("companyName"));
		
		company.setStatus(Constants.ACTIVE);
		
		address.setStreet(request.getParameter("street"));
		
		final long countryId = Long.parseLong(request.getParameter("countryId"));
		CountryDao countryDao = (CountryDao) this.context.getBean("countryDao");
		address.setCountry(countryDao.getCountryName(countryId));
		
		final long stateId = Long.parseLong(request.getParameter("stateId"));
		StateDao stateDao = (StateDao) this.context.getBean("stateDao");
		address.setState(stateDao.getStateName(stateId));
		
		final long cityId = Long.parseLong(request.getParameter("cityId"));
		CityDao cityDao = (CityDao) this.context.getBean("cityDao");
		address.setCity(cityDao.getCityName(cityId));
		
		address.setZipcode(request.getParameter("zipcode"));
		
		company.setAddress(address);
		
		company.setAddedOn(new Date());
		
		company.setAddedBy(username);
		
		contact.setEmergencyContactName(request.getParameter("emergencyContactName"));
		
		contact.setWebsite(request.getParameter("website"));
		
		contact.setPersonalEmail(request.getParameter("personalEmail"));
		
		contact.setWorkPhone(request.getParameter("workPhone"));
		
		company.setContact(contact);
		return company;
	}
}



