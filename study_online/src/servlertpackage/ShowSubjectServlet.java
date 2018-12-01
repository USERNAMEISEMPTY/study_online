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

@WebServlet(name = "ShowSubjectServlet",value="/ShowSubjectServlet")
public class ShowSubjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostService ps =new PostService();
        String subj=(String) request.getParameter("subjectname");
        System.out.println(subj);
        try {
            ArrayList<Post> sp = ps.getPostBySubject(subj);
            request.setAttribute("subjectname",subj);
            request.setAttribute("SubjectPost",sp);
            request.getRequestDispatcher("/usercenter/usercenter.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }
         }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
