package employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class PwdChangeOkCommand implements EmployeeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String id = request.getParameter("id")==null ? "" : request.getParameter("id");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		EmployeeDAO dao = new EmployeeDAO();
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		int res = dao.pwdchange(id,pwd);
		
		if(res==1) {
			request.setAttribute("url", request.getContextPath()+"/home.em");
			request.setAttribute("msg", "pwdchangeOk");
		}
		else {
			request.setAttribute("url", request.getContextPath()+"/home.em");
			request.setAttribute("msg", "pwdchangeNo");
		}
		
	}

}
