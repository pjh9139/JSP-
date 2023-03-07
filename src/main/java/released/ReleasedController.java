package released;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.re")
public class ReleasedController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReleasedInterface command = null;
		String viewPage = "/WEB-INF/released";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/releasedMain")) {
			viewPage += "/releasedMain.jsp";
		}
		else if(level >= 5) {	// 세션이 끈겼다면 작업의 진행을 중시시키고 홈으로 전송시켜준다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/makePL")) {
			viewPage += "/packinglist.jsp";
		}
		else if(com.equals("/product")) {
			viewPage += "/product.jsp";
		}
		else if(com.equals("/productOk")) {
			command = new ProductOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/productList")) {
			command = new ProductListCommand();
			command.execute(request, response);
			viewPage += "/productList.jsp";
		}
		else if(com.equals("/productUpdate")) {
			command = new ProductUpdateCommand();
			command.execute(request, response);
			viewPage += "/productUpdate.jsp";
		}
		else if(com.equals("/productUpdateOk")) {
			command = new ProductUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/productDelete")) {
			command = new ProductDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
