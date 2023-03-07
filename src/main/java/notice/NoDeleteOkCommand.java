package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoDeleteOkCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 정상적인 경로를 통해서 삭제하지 않았을경우를 대비해서 세션아이디와 현재 글의 아이디를 비교해서 같으면 삭제, 그렇지 않으면 홈으로 돌려보낸다.
		HttpSession session = request.getSession();
		String sId = (String) session.getAttribute("sId");
		int sLevel = (int) session.getAttribute("sLevel");
		String id = request.getParameter("id");
		
		if(sLevel != 0) {
			if(!sId.equals(id)) {
				request.setAttribute("msg", "userCheckNO");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		NoticeDAO dao = new NoticeDAO();
		
		// 현재글의 댓글이 없다면 삭제처리한다.
		int res = dao.setNoDeleteOk(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "noDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/noList.no?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "noDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/noContent.no?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}

}
