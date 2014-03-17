package com.wfms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wfms.dao.CityDao;
import com.wfms.dao.StateDao;
import com.wfms.dao.impl.CityDaoImpl;
import com.wfms.dao.impl.StateDaoImpl;
import com.wfms.model.City;
import com.wfms.model.State;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/CityController")
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private State state = null;
	
	private StateDao stateDao = null;
	
	private City city = null;
	
	private CityDao cityDao = null;
	
	ApplicationContext context = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.stateDao = (StateDaoImpl) this.context.getBean("stateDao");
		this.cityDao = (CityDaoImpl) this.context.getBean("cityDao");
		if(action.equals(Constants.ADD)){
			final long stateId = Long.parseLong(request.getParameter("stateId"));
			this.state = this.stateDao.read(stateId);
			final String cityName = request.getParameter("cityName");
			this.city = (City) this.context.getBean("city");
			this.city.setCityName(cityName);
			this.city.setState(this.state);
			this.city.setStatus(Constants.ACTIVE);
			this.cityDao.save(this.city);
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=City");
		}else if(action.equals(Constants.DELETE)){
		}else if(action.equals(Constants.GET_CITY_LIST)){
			final long stateId = Long.parseLong(request.getParameter("stateId"));
			PrintWriter out = response.getWriter();
			this.state = this.stateDao.read(stateId);
			StringBuffer sb = new StringBuffer();
			sb.append(Constants.DOUBLE_QUOTE)
				.append(Constants.COLLON)
				.append(Constants.SELECT)
				.append(Constants.COLLON);
			for(City city : this.state.getCities()){
				sb.append(city.getCityId()).append(Constants.COLLON)
				.append(city.getCityName()).append(Constants.COLLON);
			}
			out.print(sb);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}



