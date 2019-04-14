package dao;
import bean.Post;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.ArrayList;

public class PostDao {
    public void addPost(Post ps) throws SQLException {
        String sql = "insert into posts(subject,userid,username,postcontent,posttitle) values(?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql,ps.getSubject(),ps.getUserid(),ps.getUsername(),ps.getPostcontent(),ps.getPosttitle());
        if (row == 0) {
            throw new RuntimeException();
        }
    }
    public Post getPostByPID(String pid)throws SQLException{
        String sql="update posts set look_num = look_num + 1 where postid =?;";
        QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql,pid);
        sql="select * from posts where postid=?";
        Post ps= runner.query(sql, new BeanHandler<Post>(Post.class),pid);
        return ps;
    }
    public ArrayList<Post> getPostByUserID(String uid)throws SQLException{
        String sql="select * from posts where userid=?";
        QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
        ArrayList<Post> ps= (ArrayList<Post>) runner.query(sql, new BeanListHandler<Post>(Post.class),uid);
        return ps;
    }
    public ArrayList<Post> getPostByUsername(String username)throws SQLException{
        String sql="select * from posts where username=?";
        QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
        ArrayList<Post> ps= (ArrayList<Post>) runner.query(sql, new BeanListHandler<Post>(Post.class),username);
        return ps;
    }
    public ArrayList<Post> getPostsBysubject(String sub)throws SQLException{
        String sql="select * from posts where subject=?";
        QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
        ArrayList<Post> ps= (ArrayList<Post>) runner.query(sql, new BeanListHandler<Post>(Post.class),sub);
        return ps;
    }
    public boolean deletepost(String pid)throws SQLException{
        String sql="delete from post where postid=?";
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        int row= runner.update(sql,pid);
        if (row>0){
            return true;
        }
        return false;
    }
}
