package employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCommand implements EmployeeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id")==null ? "" : request.getParameter("id");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		int sw = 0;
		
		if(pwd.equals("0000")) {
			sw = 1;
		}

		conn.SecurityUtil security = new conn.SecurityUtil();
		pwd = security.encryptSHA256(pwd);

		EmployeeDAO dao = new EmployeeDAO();
		EmployeeVO vo = dao.getLoginCheck(id);
		
		if(vo == null || !pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "loginNo");
			request.setAttribute("url", request.getContextPath()+"/index.jsp");
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("sIdx", vo.getIdx());
		session.setAttribute("sName", vo.getName());
		session.setAttribute("sId", vo.getId());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sRank", vo.getRank());
		
		request.setAttribute("val", vo.getName());
		
		if(sw==1) {
			request.setAttribute("url", request.getContextPath()+"/pwdChange.em?id="+id);
			request.setAttribute("msg", "firstlogin");
		}
		else if(vo.getLevel()==0) {
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
			request.setAttribute("msg", "adminLoginOk");
		}
		else {
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
			request.setAttribute("msg", "loginOk");
		}
	}

}
