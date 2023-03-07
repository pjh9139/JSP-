package employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.em")
public class EmployeeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");

		if(com.equals("/login")) {
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(level >= 5) {	
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/home")) {
			viewPage = "/index.jsp";
		}
		else if(com.equals("/adminMain")) {
			viewPage += "/admin/adminMain.jsp";
		}
		else if(com.equals("/join")) {
			viewPage += "/admin/join.jsp";
		}
		else if(com.equals("/joinOk")) {
			command = new JoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/information")) {
			command = new InformationCommand();
			command.execute(request, response);
			viewPage += "/logistics/information.jsp";
		}
		else if(com.equals("/infoChange")) {
			command = new InfoChangeCommand();
			command.execute(request, response);
			viewPage += "/admin/infochange.jsp";
		}
		else if(com.equals("/infoChangeOk")) {
			command = new InfoChangeOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/information2")) {
			command = new InformationCommand();
			command.execute(request, response);
			viewPage += "/shipment/information2.jsp";
		}
		else if(com.equals("/information3")) {
			command = new InformationCommand();
			command.execute(request, response);
			viewPage += "/released/information3.jsp";
		}
		else if(com.equals("/employee_list")) {
			command = new EmployeelistCommand();
			command.execute(request, response);
			viewPage += "/admin/employee_list.jsp";
		}
		else if(com.equals("/employee_detail")) {
			command = new InformationAdminCommand();
			command.execute(request, response);
			viewPage += "/logistics/information.jsp";
		}
		else if(com.equals("/pwdChange")) {
			command = new PwdChangeCommand();
			command.execute(request, response);
			viewPage += "/admin/changepwd.jsp";
		}
		
		else if(com.equals("/pwdChangeOk")) {
			command = new PwdChangeOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
