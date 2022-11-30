package controller.Login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import model.Loginmodel;

@WebServlet("/Login")
public class Login extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/login/login.jsp");
			rd.forward(request, response);
			HttpSession session = request.getSession(false);
			session.invalidate();

		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("UTF-8");
				
			String userid=request.getParameter("USER_ID");
			String userpassword=request.getParameter("USER_PASSWORD");
			request.setAttribute("userid",userid);
			request.setAttribute("userpassword",userpassword);
			
			LoginDAO dao=new LoginDAO();
			List<Loginmodel> list = dao.searchAll(userid,userpassword);
			
			RequestDispatcher rd;
			if(list.isEmpty()) {
				request.setAttribute("errormessage",("ユーザーIDもしくはパスワードが正しくありません！")); 
				rd=request.getRequestDispatcher("/WEB-INF/lib/view/login/login.jsp");
				rd.forward(request, response);
//				response.sendRedirect("/20220915kaihatsu/Login");
			}else {
				HttpSession session = request.getSession(true);
				session.setAttribute("userid", userid);
				session.setAttribute("userpassword", userpassword);
//				rd=request.getRequestDispatcher("/WEB-INF/lib/view/readmstseihin.jsp");
//				rd.forward(request, response);	
				response.sendRedirect("/20220915kaihatsu/ReadTURIAGE");
				
			}
		}
}
