package servlertpackage;

import bean.Post;
import bean.User;
import service.PostService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ShowMyPostServlet",value="/ShowMyPostServlet")
public class ShowMyPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user =(User) request.getSession().getAttribute("user");
        PostService ps =new PostService();
        try {
            ArrayList<Post> mp = ps.getPostByUserID(user.getUserid());
            request.setAttribute("showpost",1);
            request.setAttribute("MyPost",mp);
            request.getRequestDispatcher("/usercenter/usercenter.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
