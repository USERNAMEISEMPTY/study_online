package servlertpackage;

import bean.User;
import bean.postcomment;
import dao.CommentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "addPostCommentsServlet",value = "/addPostCommentsServlet")
public class addPostCommentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("join in addPostCommentsServlet");
        postcomment pc=new postcomment();
        User user= (User) request.getSession().getAttribute("user");
        System.out.println(user.getUserid());
        String cmct=request.getParameter("content1");
        System.out.println(cmct);
        String pid=request.getParameter("pid");
        CommentDao dao =new CommentDao();
        pc.setUserid(user.getUserid());
        System.out.println(user.getUserid());
        pc.setUsername(user.getUsername());
        pc.setCommentcontent(cmct);
        pc.setPostid(pid);
        try{
            dao.addComment(pc);
            response.sendRedirect(request.getContextPath()+"/ShowPostContent?pid="+pc.getPostid());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
