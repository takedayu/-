package controller.MSTKOKYAKU;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KokyakuDAO;
import model.Mstkokyaku;

/**
 * Servlet implementation class Update
 */
@WebServlet("/UpdateMSTKOKYAKU")
public class UpdateMSTKOKYAKU extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userid") == null) {
//			response.sendRedirect("/20220915kaihatsu/Login");
			session = request.getSession(true);
			session.setAttribute("loginfailedmessage",("認証できませんでした。ログインしてください。")); 
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/mstkokyaku/kanryomstkokyaku.jsp");
			rd.forward(request, response);
		}else {
		String s_id=request.getParameter("KOKYAKU_CODE");
		if(s_id==null) {
			response.sendRedirect("/20220915kaihatsu/ReadMSTKOKYAKU");
		}else {
			KokyakuDAO dao=new KokyakuDAO();
			Mstkokyaku koushin=dao.findOne(s_id);
			request.setAttribute("koushin",koushin);
			request.getRequestDispatcher("/WEB-INF/lib/view/mstkokyaku/updatemstkokyaku.jsp").forward(request, response);
		}
	}
}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		request.setCharacterEncoding("UTF-8");

		if(session == null || session.getAttribute("userid") == null) {
//			response.sendRedirect("/20220915kaihatsu/Login");
			session = request.getSession(true);
			session.setAttribute("loginfailedmessage",("認証できませんでした。ログインしてください。")); 
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/mstkokyaku/kanryomstkokyaku.jsp");
			rd.forward(request, response);
		}else {
			
		}
		String kokyaku_code=request.getParameter("KOKYAKU_CODE");
		String kokyaku_name=request.getParameter("KOKYAKU_NAME");
		String kokyaku_address=request.getParameter("KOKYAKU_ADDRESS");
		String kokyaku_tel=request.getParameter("KOKYAKU_TEL");		
		
		Mstkokyaku koushin=new Mstkokyaku(kokyaku_code,kokyaku_name,kokyaku_address,kokyaku_tel);
		
		koushin.setKokyaku_code(kokyaku_code);
		koushin.setKokyaku_name(kokyaku_name);
		koushin.setKokyaku_address(kokyaku_address);
		koushin.setKokyaku_tel(kokyaku_tel);
		
		session.setAttribute("kanryomessage",("更新が完了しました。")); 
		
		KokyakuDAO dao=new KokyakuDAO();
		
		dao.updateOne(koushin);
		
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/mstkokyaku/kanryomstkokyaku.jsp");
		rd.forward(request, response);
		
	}

}

