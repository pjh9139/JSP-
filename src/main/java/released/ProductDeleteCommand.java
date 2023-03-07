package released;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductDeleteCommand implements ReleasedInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idx = request.getParameter("idx")=="" ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ProductDAO dao = new ProductDAO();
		
		if(idx != 0) {
			int res = dao.productDelete(idx);
			if(res == 1) {
				request.setAttribute("msg", "guDeleteOk");
			}
			else {
				request.setAttribute("msg", "guDeleteNo");
			}
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
	}

}
