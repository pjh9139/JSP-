package shipment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logistics.LogisticsDAO;

public class DOstateUpdateCommand implements ShipmentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int state = request.getParameter("state")==null ? 0 : Integer.parseInt(request.getParameter("state"));
		
		LogisticsDAO dao = new LogisticsDAO();
		
		int res = dao.DOstateUpdate(idx,state);
		
		if(res == 1) {
			request.setAttribute("msg", "DOstateUpdatOk");
		}
		else {
			request.setAttribute("msg", "DOstateUpdatNo");
		}
		request.setAttribute("url", request.getContextPath()+"/shipmentMain.sh");
	}

}
