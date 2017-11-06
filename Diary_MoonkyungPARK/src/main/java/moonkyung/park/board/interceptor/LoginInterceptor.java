package moonkyung.park.board.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginid");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String str = "";

		if (loginid == null) {
			response.sendRedirect(request.getContextPath() + "/customer/login");
			str += "<script language='javascript'>";
			str += "alert('Please log-in and use our service')";
			str += "</script>";
			out.print(str);
			System.out.println("LoginInterceptor is working..");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
