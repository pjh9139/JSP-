package shipment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.sh")
public class ShipmentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShipmentInterface command = null;
		String viewPage = "/WEB-INF/shipment";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/shipmentMain")) {
			viewPage += "/shipmentMain.jsp";
		}
		else if(level >= 5) {	// 세션이 끈겼다면 작업의 진행을 중시시키고 홈으로 전송시켜준다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/checkDO")) {
			command = new CheckDOCommand();
			command.execute(request, response);
			viewPage += "/checkDO.jsp";
		}
		else if(com.equals("/checkDOsearch")) {
			command = new CheckDOsearchCommand();
			command.execute(request, response);
			viewPage += "/checkDO.jsp";
		}
		else if(com.equals("/detailDOCheck")) {
			command = new DetailDOCheckCommand();
			command.execute(request, response);
			viewPage += "/detailDOCheck.jsp";
		}
		else if(com.equals("/DOstateUpdate")) {
			command = new DOstateUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/makeBL")) {
			viewPage += "/bl.jsp";
		}
		else if(com.equals("/makeAWB")) {
			viewPage += "/awb.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
