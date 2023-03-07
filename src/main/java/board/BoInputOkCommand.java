package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sId");
		String name = (String) session.getAttribute("sName") +" "+(String) session.getAttribute("sRank");
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String photo = request.getParameter("photo")==null ? "" : request.getParameter("photo");
		
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setName(name);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setPhoto(photo);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoinputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "boInputOk");
			request.setAttribute("url", request.getContextPath()+"/boList.bo");
		}
		else {
			request.setAttribute("msg", "boInputNo");
			request.setAttribute("url", request.getContextPath()+"/boInput.bo");
		}
	}

}
