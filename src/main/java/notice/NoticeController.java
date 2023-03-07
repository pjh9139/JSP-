package notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.no")
public class NoticeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeInterface command = null;
		String viewPage = "/WEB-INF/notice";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 세션이 끈겼다면 작업의 진행을 중시시키고 홈으로 전송시켜준다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level >= 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		
		else if(com.equals("/noList")) {
			command = new NoListCommand();
			command.execute(request, response);
			viewPage += "/noList.jsp";
		}
		else if(com.equals("/noInput")) {
			command = new NoInputCommand();
			command.execute(request, response);
			viewPage += "/noInput.jsp";
		}
		else if(com.equals("/noInputOk")) {
			command = new NoInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/noContent")) {
			command = new NoContentCommand();
			command.execute(request, response);
			viewPage += "/noContent.jsp";
		}
		else if(com.equals("/noDeleteOk")) {
			command = new NoDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/noUpdate")) {
			command = new NoUpdateCommand();
			command.execute(request, response);
			viewPage += "/noUpdate.jsp";
		}
		else if(com.equals("/noUpdateOk")) {
			command = new NoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/noSearch")) {
			command = new NoSearchCommand();
			command.execute(request, response);
			viewPage += "/noSearch.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
