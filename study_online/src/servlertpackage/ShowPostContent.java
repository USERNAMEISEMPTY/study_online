package servlertpackage;

import bean.Post;
import bean.postcomment;
import dao.CommentDao;
import service.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ShowPostContent",value = "/ShowPostContent")
public class ShowPostContent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostService ps =new PostService();
        String pid = request.getParameter("pid");
        try{
            Post psc = ps.getPostByPID(pid);
            ArrayList<postcomment> pcs=new CommentDao().getCommentsByPid(pid);
            for (postcomment c:pcs
                 ) {
                System.out.println(c.getCommentcontent());
            }
            System.out.println(pcs.size());
            System.out.println(pid);
            request.setAttribute("Post",psc);
            request.setAttribute("commments",pcs);
            request.getRequestDispatcher("/post/showpost.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}