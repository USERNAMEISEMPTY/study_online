package service;

import bean.Post;
import dao.PostDao;

import java.sql.SQLException;
import java.util.ArrayList;

public class PostService {
    PostDao pd =new PostDao();
    public void addPost(Post ps) throws SQLException {
        try{
            pd.addPost(ps);
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException("添加帖子失败");
        }
    }
    public ArrayList<Post> getPostByUserID(String uid)throws SQLException{
        try {
            return pd.getPostByUserID(uid);
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException("获取帖子失败");
        }
    }
    public Post getPostByPID(String pid)throws SQLException{
        try {
            return pd.getPostByPID(pid);
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException("获取帖子失败");
        }
    }
    public ArrayList<Post> getPostBySubject(String sub)throws SQLException{
        try{
            return pd.getPostsBysubject(sub);
        }catch (SQLException e){
            e.printStackTrace();
            throw new SQLException("获取帖子失败");
        }
    }
}
