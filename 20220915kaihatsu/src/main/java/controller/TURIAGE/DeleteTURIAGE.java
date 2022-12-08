package controller.TURIAGE;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UriageDAO;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/DeleteTURIAGE")
public class DeleteTURIAGE extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userid") == null) {
			session = request.getSession(true);
			session.setAttribute("loginfailedmessage",("認証できませんでした。ログインしてください。")); 
			response.sendRedirect("/20220915kaihatsu/Login");
		}else {
		String id=request.getParameter("URIAGE_NO");
		if(id !=null) {
			session.setAttribute("kanryomessage",("削除が完了しました。"));
			UriageDAO dao=new UriageDAO();
			dao.deleteOne(id);
			
//			String dummyname = ("");
//			List<Mstseihin> list3=dao.searchAll(dummyname,id);
//			session.setAttribute("list3", list3);
			
		}
		response.sendRedirect("/20220915kaihatsu/ReadTURIAGE");
		}
	}


}
