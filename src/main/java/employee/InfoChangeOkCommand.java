package employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoChangeOkCommand implements EmployeeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String rank = request.getParameter("rank") == null ? "" : request.getParameter("rank");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String com_tel = request.getParameter("com_tel") == null ? "" : request.getParameter("com_tel");
		String fax = request.getParameter("fax") == null ? "" : request.getParameter("fax");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		
		EmployeeDAO dao = new EmployeeDAO();
		
		int res = dao.infochange(idx,name,rank,email,tel,com_tel,fax,content);
		
		if(res==1) {
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
			request.setAttribute("msg", "infochangeOk");
		}
		else {
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
			request.setAttribute("msg", "infochangeNo");
		}
		
	}

}
