package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoInputOkCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sId");
		String name = (String) session.getAttribute("sName");
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		NoticeVO vo = new NoticeVO();
		vo.setId(id);
		vo.setName(name);
		vo.setTitle(title);
		vo.setContent(content);
		
		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoinputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "noInputOk");
			request.setAttribute("url", request.getContextPath()+"/noList.no");
		}
		else {
			request.setAttribute("msg", "noInputNo");
			request.setAttribute("url", request.getContextPath()+"/noInput.no");
		}
	}

}
