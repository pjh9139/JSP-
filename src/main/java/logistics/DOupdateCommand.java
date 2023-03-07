package logistics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DOupdateCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int recipient_idx = request.getParameter("recipient_idx") == null ? 0 : Integer.parseInt(request.getParameter("recipient_idx"));
		String recipient_company = request.getParameter("recipient") == null ? "" : request.getParameter("recipient");
		String recipient_location = request.getParameter("recipient_location") == null ? "" : request.getParameter("recipient_location");
		String recipient_country = request.getParameter("recipient_country") == null ? "" : request.getParameter("recipient_country");
		String recipient_tel = request.getParameter("recipient_tel") == null ? "" : request.getParameter("recipient_tel");
		String recipient_method = request.getParameter("recipient_method") == null ? "" : request.getParameter("recipient_method");
		int product_idx = request.getParameter("product_idx") == null ? 0 : Integer.parseInt(request.getParameter("product_idx"));
		String product_name = request.getParameter("product_name") == null ? "" : request.getParameter("product_name");
		int product_price = request.getParameter("product_price") == null ? 0 : Integer.parseInt(request.getParameter("product_price"));
		int product_weight = request.getParameter("product_weight") == null ? 0 : Integer.parseInt(request.getParameter("product_weight"));
		String product_size = request.getParameter("product_size") == null ? "" : request.getParameter("product_size");
		int product_quantity = request.getParameter("product_quantity") == null ? 0 : Integer.parseInt(request.getParameter("product_quantity"));
		
		HttpSession session = request.getSession();
		
		String writer = (String)session.getAttribute("sName") ;
		
		LogisticsVO vo = new LogisticsVO();
		LogisticsDAO dao = new LogisticsDAO();
		
		vo.setIdx(idx);
		vo.setRecipient_idx(recipient_idx);
		vo.setRecipient_company(recipient_company);
		vo.setRecipient_location(recipient_location);
		vo.setRecipient_country(recipient_country);
		vo.setRecipient_tel(recipient_tel);
		vo.setRecipient_method(recipient_method);
		vo.setProduct_idx(product_idx);
		vo.setProduct_name(product_name);
		vo.setProduct_price(product_price);
		vo.setProduct_weight(product_weight);
		vo.setProduct_size(product_size);
		vo.setProduct_quantity(product_quantity);
		vo.setWriter(writer);
		
		int res = dao.updateDO(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "updateDOOk");
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
		}
		else {
			request.setAttribute("msg", "updateDONo");
			request.setAttribute("url", request.getContextPath()+"/makeDO.log");
		}
		
	}

}
