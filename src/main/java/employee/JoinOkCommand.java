package employee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class JoinOkCommand implements EmployeeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String realPath = request.getServletContext().getRealPath("/data/employee");
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장할 최대용량을 10MByte로 한다.(1회 저장)
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String filesystemName = multipartRequest.getFilesystemName("fName");			// 실제 서버에 저장된 파일명.
		
		String id = "";
		String pwd = "0000";
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		String email = multipartRequest.getParameter("email")==null ? "" : multipartRequest.getParameter("email");
		String tel = multipartRequest.getParameter("tel")==null ? "" : multipartRequest.getParameter("tel");
		String startdate = multipartRequest.getParameter("startdate")==null ? "" : multipartRequest.getParameter("startdate");
		int level = multipartRequest.getParameter("level")==null ? -1 : Integer.parseInt(multipartRequest.getParameter("level"));
		int res = 0;
		
		EmployeeDAO dao = new EmployeeDAO();
		
		//사번 만들기 (입사년도,직급,순번)
		for(int i = 1 ; i<1000 ; i++) {
			String tempid = startdate.substring(2,4) + String.valueOf(level) + String.valueOf(i);
			EmployeeVO vo = dao.getLoginCheck(tempid);
			if(vo==null) {
				id = tempid;
				break;
			}
			else res = 2;
		}	
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 모든 체크가 완료되었다면 회원정보를 vo에 담아서 DB(DAO객체)로 넘겨준다.
		EmployeeVO vo = new EmployeeVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setPhoto(filesystemName);
		vo.setStartdate(startdate);
		vo.setLevel(level);
		
		res = dao.setJoinOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "joinOk");
			request.setAttribute("url", request.getContextPath()+"/adminMain.em");
		}
		else if (res == 0) {
			request.setAttribute("msg", "joinNo1");
			request.setAttribute("url", request.getContextPath()+"/join.em");
		}
		else if (res == 2) {
			request.setAttribute("msg", "joinNo2");
			request.setAttribute("url", request.getContextPath()+"/join.em");
		}
	}


}
