package servlertpackage;
import java.io.IOException;
import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.User;
import bean.subject;
import service.UserService;
@WebServlet(value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.获取登录页面输入的用ID与密码
		String userid =request.getParameter("userid");
		String password = request.getParameter("password");
		//System.out.println(userid);
		//System.out.println(password);
		// 2.调用service完成登录操作。
		UserService service = new UserService();
		try {
			User user = service.login(userid, password);
			
			// 3.登录成功，将用户存储到session中.
			request.getSession().setAttribute("user", user);
			// 获取用户的角色，其中用户的角色分学生和老师两种
			int userstatus = user.getUserstatus();
			// 判断是否学生
			if (userstatus==0) {
				System.out.println("学生");
				//将subject设置进session域当中
				System.out.println("classname="+user.getClassname());
				System.out.println("userstatus="+userstatus);
				System.out.println("username="+user.getUsername());
				request.getSession().setAttribute("subject",service.getsubject(user.getClassname(),userstatus));
				response.sendRedirect(request.getContextPath()+"/usercenter/usercenter.jsp");
				//request.setAttribute("subject",service.getsubject(user.getClassname(),userstatus));
				//request.getRequestDispatcher("/usercenter/usercenter.jsp").forward(request,response);
				return;
			} else {
				System.out.println("老师");
				//将subject设置进session域当中
				request.getSession().setAttribute("subject",service.getsubject(user.getUsername(),userstatus));
				response.sendRedirect(request.getContextPath()+"/usercenter/usercenter.jsp");
				return;
			}
		} catch (LoginException e) {
			// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
			e.printStackTrace();
			request.setAttribute("error_status",1);
			request.setAttribute("register_message", e.getMessage());
			//response.sendRedirect("/Study_online/index.jsp#login");
			System.out.println("join in Exception");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
	}
}
