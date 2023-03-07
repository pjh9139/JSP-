package shipment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logistics.LogisticsDAO;
import logistics.LogisticsVO;

public class CheckDOsearchCommand implements ShipmentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		int pageSize = request.getParameter("pageSize")=="" ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		LogisticsDAO dao = new LogisticsDAO();
		ArrayList<LogisticsVO> vos = dao.checkDOsearch(search, searchString);
		
		request.setAttribute("vos", vos);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
