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
import com.wfms.dao.StateDao;
import com.wfms.dao.impl.CountryDaoImpl;
import com.wfms.dao.impl.StateDaoImpl;
import com.wfms.model.Country;
import com.wfms.model.State;
import com.wfms.util.Constants;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/StateController")
public class StateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StateDao stateDao = null;
	
	private CountryDao countryDao = null;
	
	private State state = null;
	
	private Country country = null;
	
	private List<State> stateList = null;
	
	ApplicationContext context = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StateController() {
        super();
    }
	private static final Logger LOGGER = Logger.getLogger(StateController.class
		      .getName());
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter(Constants.ACTION);
		this.context = new ClassPathXmlApplicationContext("application-context.xml");
		this.stateDao = (StateDaoImpl) this.context.getBean("stateDao");
		this.countryDao = (CountryDaoImpl) this.context.getBean("countryDao");
		this.country = (Country) this.context.getBean("country");
		this.state = (State) this.context.getBean("state");
		if(action.equals(Constants.ADD)){
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			final String stateName = request.getParameter("stateName");
			this.country = this.countryDao.read(countryId);
			this.state.setCountry(country);
			this.state.setStateName(stateName);
			this.state.setStatus(Constants.ACTIVE);
			this.stateDao.save(state);
			response.sendRedirect(request.getContextPath() + "/save-successfully.jsp?entity=State");
		}else if(action.equals(Constants.VIEW)){
			int id = -1;
			final String status = request.getParameter("status");
			if(status!=null){
				id = Integer.parseInt(status);
				this.stateList = this.stateDao.getListByCriteria(this.state, "stateName", id);
			}else{
				this.stateList = this.stateDao.getListByCriteria(this.state, "stateName", id);
			}
			request.setAttribute("stateList", this.stateList);
			request.getRequestDispatcher("view-state-list.jsp").forward(request, response);
		}else if(action.equals(Constants.DELETE)){
		}else if(action.equals(Constants.GET_STATE_LIST)){
			final long countryId = Long.parseLong(request.getParameter("countryId"));
			PrintWriter out = response.getWriter();
			this.country = this.countryDao.read(countryId);
			StringBuilder sb = new StringBuilder();
			sb.append(Constants.DOUBLE_QUOTE)
				.append(Constants.COLLON)
				.append(Constants.SELECT)
				.append(Constants.COLLON);
			for(State state : this.country.getStates()){
				sb.append(state.getStateId()).append(Constants.COLLON)
				.append(state.getStateName()).append(Constants.COLLON);
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



