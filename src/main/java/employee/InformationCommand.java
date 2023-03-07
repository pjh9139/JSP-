package employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InformationCommand implements EmployeeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int idx = (int) session.getAttribute("sIdx");
		
		EmployeeDAO dao = new EmployeeDAO();
		
		EmployeeVO vo = dao.information(idx);
		
		request.setAttribute("vo", vo);
	}

}
