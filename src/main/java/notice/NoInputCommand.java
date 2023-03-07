package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import employee.EmployeeDAO;
import employee.EmployeeVO;

public class NoInputCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sId");
		
		EmployeeDAO dao = new EmployeeDAO();
		
		EmployeeVO vo = dao.getLoginCheck(id);
		
		request.setAttribute("photo", vo.getPhoto());
	}

}
