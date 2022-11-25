package controller.MSTKOKYAKU;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KokyakuDAO;
import model.Mstkokyaku;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/DeleteMSTKOKYAKU")
public class DeleteMSTKOKYAKU extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userid") == null) {
			response.sendRedirect("/20220915kaihatsu/Login");
		}else {
		String id=request.getParameter("KOKYAKU_CODE");
		if(id !=null) {
			KokyakuDAO dao=new KokyakuDAO();
			dao.deleteOne(id);
			 
			String dummyname = ("");
			List<Mstkokyaku> list3=dao.searchAll(id,dummyname);
			session.setAttribute("list3", list3);
			if(list3.size() == 0) {
				session.setAttribute("kanryomessage",("削除が完了しました。"));
			}else {
				session.setAttribute("errormessage",("子レコードがあるため削除できません！"));
			}
			
		}
		response.sendRedirect("/20220915kaihatsu/ReadMSTKOKYAKU");
		}
	}
}