package released;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductUpdateOkCommand implements ReleasedInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx")) ;  
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int price = request.getParameter("price") == null ? 0 : Integer.parseInt(request.getParameter("price")) ;  
		int width = request.getParameter("width") == null ? 0 : Integer.parseInt(request.getParameter("width")) ;  
		int length = request.getParameter("length") == null ? 0 : Integer.parseInt(request.getParameter("length")) ;  
		int hight = request.getParameter("hight") == null ? 0 : Integer.parseInt(request.getParameter("hight")) ;  
		int weight = request.getParameter("weight") == null ? 0 : Integer.parseInt(request.getParameter("weight")) ;
		
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO();

		vo.setIdx(idx);
		vo.setName(name);
		vo.setPrice(price);
		vo.setWidth(width);
		vo.setLength(length);
		vo.setHight(hight);
		vo.setWeight(weight);
		
		int res = dao.updateProduct(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "updateProductOk");
			request.setAttribute("url", request.getContextPath()+"/productList.re");
		}
		else {
			request.setAttribute("msg", "updateProductNo");
			request.setAttribute("url", request.getContextPath()+"/productList.re");
		}
	}

}
