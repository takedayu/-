package controller.TURIAGE;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KokyakuDAO;
import dao.SeihinDAO;
import dao.UriageDAO;
import model.Mstkokyaku;
import model.Mstseihin;
import model.Turiage;

	@WebServlet("/ReadTURIAGE")
	public class ReadTURIAGE extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession(false);
			if(session == null || session.getAttribute("userid") == null) {
				session = request.getSession(true);
				session.setAttribute("loginfailedmessage",("認証できませんでした。ログインしてください。")); 
				response.sendRedirect("/20220915kaihatsu/Login");
			}else {
			UriageDAO dao=new UriageDAO();
			List<Turiage> list=dao.findAll();
			
			KokyakuDAO dao2=new KokyakuDAO();
			List<Mstkokyaku> list2=dao2.listAll();
			
			SeihinDAO dao3=new SeihinDAO();
			List<Mstseihin> list3=dao3.listAll();
			
			
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);

			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/turiage/readturiage.jsp");
			rd.forward(request, response);
			session.removeAttribute("kanryomessage");
//			session.invalidate();
			}
		}

	}
