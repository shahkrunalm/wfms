package com.wfms.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CompanyDao;
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
       
	private List<Company> companyList = null;
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
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.companyDao = (CompanyDaoImpl) this.context.getBean("companyDao");
		this.company = (Company) this.context.getBean("company");
		
		if(action.equals(Constants.ADD)){
			this.company = this.populateCompany(request);
			this.companyDao.save(this.company);
			
			// Populating active company list
			getServletContext().setAttribute("activeCompanyList", this.companyDao.getListByCriteria(this.company, "companyName", 1));
			
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=Company");
		}else if(action.equals(Constants.VIEW)){
			int id = -1;
			final String status = request.getParameter("status");
			if(status!=null){
				id = Integer.parseInt(status);
				this.companyList = this.companyDao.getListByCriteria(this.company, "companyName", id);
			}else{
				this.companyList = this.companyDao.getListByCriteria(this.company, "companyName", id);
			}
			request.setAttribute("companyList", this.companyList);
			request.getRequestDispatcher("view-company-list.jsp").forward(request, response);
		}else if(action.equals(Constants.DELETE)){
			final long companyId = Long.parseLong(request.getParameter("companyId"));
			this.company = this.companyDao.read(companyId);
			this.companyDao.delete(company);
		}else if(action.equals(Constants.DETAIL)){
			final long companyId = Long.parseLong(request.getParameter("companyId"));
			this.company = this.companyDao.read(companyId);
			request.setAttribute("company", this.company);
			request.getRequestDispatcher("view-company-detail.jsp").forward(request, response);

		}else{
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private Company populateCompany(HttpServletRequest request){
		Company company = (Company) this.context.getBean("company");
		Address address = (Address) this.context.getBean("address");
		final String companyName = request.getParameter("companyName");
		company.setCompanyName(companyName);
		company.setStatus(Constants.ACTIVE);
		
		address.setStreet("street");
		address.setCountry("india");
		address.setState("gujarat");
		address.setCity("ahmedabad");
		address.setZipcode("zipcode");
		company.setAddress(address);
		
		return company;
	}
}



