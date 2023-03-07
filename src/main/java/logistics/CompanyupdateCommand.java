package logistics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CompanyupdateCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String country = request.getParameter("country")==null ? "" : request.getParameter("country");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String fax = request.getParameter("fax")==null ? "" : request.getParameter("fax");
		int idx =request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		LogisticsDAO dao = new LogisticsDAO();
		CompanyVO vo = new CompanyVO();
		vo.setName(name);
		vo.setCountry(country);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setFax(fax);
		vo.setIdx(idx);
		
		int res = dao.companyupdate(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "company_updateOk");
			request.setAttribute("url", request.getContextPath()+"/company_list.log");
		}
		else {
			request.setAttribute("msg", "company_updateNo");
			request.setAttribute("url", request.getContextPath()+"/company_list.log");
		}
	}

}
