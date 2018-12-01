package servlertpackage;

import bean.Post;
import service.PostService;
import bean.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "PostSubmitServlet",value = "/PostSubmitServlet")
public class PostSubmitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("join in PostSubmitServlet");
        User user= (User) request.getSession().getAttribute("user");
        //subject,userid,username,postcontent,posttitle
        String username=user.getUsername();
        String userid=user.getUserid();
        String postcontent=request.getParameter("content1");
        String subject=request.getParameter("subject");
        String posttitle=request.getParameter("posttitle");
        System.out.println(username+"\n"+userid+"\n"+postcontent+"\n"+subject+"\n"+posttitle+"\n");
        Post ps=new Post();
        ps.setPostcontent(postcontent);
        ps.setUserid(userid);
        ps.setUsername(username);
        ps.setPosttitle(posttitle);
        ps.setSubject(subject);
        PostService psv=new PostService();
        response.sendRedirect(request.getContextPath()+"/usercenter/usercenter.jsp");
        try{
            psv.addPost(ps);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
