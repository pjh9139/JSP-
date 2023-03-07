package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoReplyInputCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardIdx = request.getParameter("boardIdx")==null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		String id = request.getParameter("id")== null ? "" : request.getParameter("id");
		String name = request.getParameter("name")== null ? "" : request.getParameter("name");
		String hostIp = request.getParameter("hostIp")== null ? "" : request.getParameter("hostIp");
		String content = request.getParameter("content")== null ? "" : request.getParameter("content");
		
		BoardReplyVO replyVo = new BoardReplyVO();
		
		replyVo.setBoardIdx(boardIdx);
		replyVo.setId(id);
		replyVo.setName(name);
		replyVo.setHostIp(hostIp);
		replyVo.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		
		String res = dao.setReplyInputOk(replyVo);
		
		response.getWriter().write(res);
	}

}
