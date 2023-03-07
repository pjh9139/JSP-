package logistics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IVokCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String COMPANY = request.getParameter("COMPANY") == null ? "" : request.getParameter("COMPANY"); 
		String ADRESS = request.getParameter("ADRESS") == null ? "" : request.getParameter("ADRESS"); 
		String COUNTRY = request.getParameter("COUNTRY") == null ? "" : request.getParameter("COUNTRY"); 
		String PHONE = request.getParameter("PHONE") == null ? "" : request.getParameter("PHONE"); 
		int weight = request.getParameter("weight") == null ? 0 : Integer.parseInt(request.getParameter("weight")); 
		String size = request.getParameter("size") == null ? "" : request.getParameter("size"); 
		String product_name = request.getParameter("product_name") == null ? "" : request.getParameter("product_name");
		int quantity = request.getParameter("quantity") == null ? 0 : Integer.parseInt(request.getParameter("quantity")); 
		int price = request.getParameter("price") == null ? 0 : Integer.parseInt(request.getParameter("price")); 
		int totprice = request.getParameter("totprice") == null ? 0 : Integer.parseInt(request.getParameter("totprice")); 
		int DOidx = request.getParameter("DOidx") == null ? 0 : Integer.parseInt(request.getParameter("DOidx")); 
		
		HttpSession session = request.getSession();
		
		String writer = (String)session.getAttribute("sName") ;
		
		LogisticsDAO dao = new LogisticsDAO();
		InVoiceVO vo = new InVoiceVO();
		
		vo.setCOMPANY(COMPANY);
		vo.setADRESS(ADRESS);
		vo.setCOUNTRY(COUNTRY);
		vo.setPHONE(PHONE);
		vo.setWeight(weight);
		vo.setSize(size);
		vo.setProduct_name(product_name);
		vo.setQuantity(quantity);
		vo.setPrice(price);
		vo.setTotprice(totprice);
		vo.setWriter(writer);
		
		int res = dao.addIV(vo);
		
		if(res == 1) {
			dao.DOstateUpdate(DOidx, 4);
			request.setAttribute("msg", "addIVOk");
			request.setAttribute("url", request.getContextPath()+"/logisticsMain.log");
		}
		else {
			request.setAttribute("msg", "addIVNo");
			request.setAttribute("url", request.getContextPath()+"/makeIV.log");
		}
		
	}

}
