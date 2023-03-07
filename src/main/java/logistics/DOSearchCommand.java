package logistics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DOSearchCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		int pageSize = request.getParameter("pageSize")=="" ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		LogisticsDAO dao = new LogisticsDAO();
		ArrayList<LogisticsVO> vos = dao.getDOList(search, searchString);
		
		request.setAttribute("vos", vos);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
