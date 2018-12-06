package dao;

import bean.postcomment;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDao {
    public void addComment(postcomment pc)throws SQLException {
        String sql = "insert into postcomment(postid, userid, username, commentcontent)values(?,?,?,?);";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql,pc.getPostid(),pc.getUserid(),pc.getUsername(),pc.getCommentcontent());
        if (row == 0) {
            throw new RuntimeException();
        }
    }
    public ArrayList<postcomment> getCommentsByPid(String pid) throws SQLException{
        String sql="select * from postcomment where postid =?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        ArrayList<postcomment> pcs= (ArrayList<postcomment>) runner.query(sql, new BeanListHandler<postcomment>(postcomment.class),pid);
        System.out.println(pid);
        System.out.println(pcs.size());
        return pcs;
    }
    public void deleteCommentByCid(String id)throws SQLException{
        String sql = "delete from postcomment where commentid=?;";
        QueryRunner runner= new QueryRunner(DataSourceUtils.getDataSource());
        int row =runner.update(sql,id);
        if (row==0){
            throw new RuntimeException();
        }
    }
}
