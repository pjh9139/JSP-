package logistics;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.log")
public class LogisticsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogisticsInterface command = null;
		String viewPage = "/WEB-INF/logistics";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/logisticsMain")) {
			command = new LogisticsMainCommand();
			command.execute(request, response);
			viewPage += "/logisticsMain.jsp";
		}
		else if(level >= 5) {	// 세션이 끈겼다면 작업의 진행을 중시시키고 홈으로 전송시켜준다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/makeDO")) {
			viewPage += "/delivery_order.jsp";
		}
		else if(com.equals("/makeIV")) {
			viewPage += "/invoice.jsp";
		}
		else if(com.equals("/addCompany")) {
			viewPage += "/add_company.jsp";
		}
		else if(com.equals("/addCompanyok")) {
			command = new AddCompanyokCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/deleteCompany")) {
			viewPage += "/delete_Company.jsp";
		}
		else if(com.equals("/recipientCheck")) {
			command = new RecipientCheckCommand();
			command.execute(request, response);
			viewPage += "/recipientCheck.jsp";
		}
		else if(com.equals("/recipientSearch")) {
			command = new RecipientSearchCommand();
			command.execute(request, response);
			viewPage += "/recipientCheck.jsp";
		}
		else if(com.equals("/productCheck")) {
			command = new ProductCheckCommand();
			command.execute(request, response);
			viewPage += "/productCheck.jsp";
		}
		else if(com.equals("/productSearch")) {
			command = new ProductSearchCommand();
			command.execute(request, response);
			viewPage += "/productCheck.jsp";
		}
		else if(com.equals("/DOok")) {
			command = new DOokCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DOupdate")) {
			command = new DOupdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DOlist")) {
			command = new ListDOCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_list.jsp";
		}
		else if(com.equals("/DOCheck")) {
			command = new ListDOCheckCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_check.jsp";
		}
		else if(com.equals("/DOSearch")) {
			command = new DOSearchCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_check.jsp";
		}
		else if(com.equals("/DOSearch2")) {
			command = new DOSearchCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_list.jsp";
		}
		else if(com.equals("/IVok")) {
			command = new IVokCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DOerror")) {
			command = new DOerrorCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_error.jsp";
		}
		else if(com.equals("/DOmodify")) {
			command = new DOmodifyCommand();
			command.execute(request, response);
			viewPage += "/delivery_order_error_modify.jsp";
		}
		else if(com.equals("/invoice_list")) {
			command = new IVlistCommand();
			command.execute(request, response);
			viewPage += "/invoice_list.jsp";
		}
		else if(com.equals("/invoice_detail")) {
			command = new IVdetailCommand();
			command.execute(request, response);
			viewPage += "/invoice_detail.jsp";
		}
		else if(com.equals("/company_list")) {
			command = new RecipientCheckCommand();
			command.execute(request, response);
			viewPage += "/company_list.jsp";
		}
		else if(com.equals("/company_search")) {
			command = new RecipientSearchCommand();
			command.execute(request, response);
			viewPage += "/company_list.jsp";
		}
		else if(com.equals("/company_detail")) {
			command = new CompanydetailCommand();
			command.execute(request, response);
			viewPage += "/company_detail.jsp";
		}
		else if(com.equals("/company_modify")) {
			command = new CompanydetailCommand();
			command.execute(request, response);
			viewPage += "/company_modify.jsp";
		}
		else if(com.equals("/company_update")) {
			command = new CompanyupdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
