package test;
import bean.Post;
import bean.postcomment;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.awt.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import bean.subject;
public class Test1 {

	public static void main(String[] args) throws SQLException {
		String uid ="123456789";
		String sql="select * from posts where userid=?";
		QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
		ArrayList<Post> ps= (ArrayList<Post>) runner.query(sql, new BeanListHandler<Post>(Post.class),uid);
		System.out.println(sql);
		System.out.println(ps.size());
	}
	}
	
