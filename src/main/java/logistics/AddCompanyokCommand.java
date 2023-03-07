package logistics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddCompanyokCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String country = request.getParameter("country")==null ? "" : request.getParameter("country");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String fax = request.getParameter("fax")==null ? "" : request.getParameter("fax");
		
		LogisticsDAO dao = new LogisticsDAO();
		CompanyVO vo = new CompanyVO();
		vo.setName(name);
		vo.setCountry(country);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setFax(fax);
		
		int res = dao.addcompany(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "addcompanyOk");
			request.setAttribute("url", request.getContextPath()+"/addCompany.log");
		}
		else {
			request.setAttribute("msg", "addcompanyNo");
			request.setAttribute("url", request.getContextPath()+"/addCompany.log");
		}
	}

}
