package servlertpackage;

import bean.Post;
import service.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ShowPostContext",value = "/ShowPostContext")
public class ShowPostContext extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostService ps =new PostService();
        String pid = request.getParameter("pid");
        try{
            Post psc = ps.getPostByPID(pid);
            request.setAttribute("Post",psc);
            request.getRequestDispatcher("/post/showpost.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
