package dao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataSourceUtils;
import java.sql.SQLException;
import java.util.ArrayList;
import bean.User;
import bean.subject;


public class UserDao {

	//根据用户名与密码查找用户
	public User findUserByUserIDAndPassword(String userid, String password) throws SQLException {
		String sql="select * from user where userid=? and userpassword=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class),userid,password);
	}

	public ArrayList<subject> getstudentsubject(String classname) throws SQLException{
		String sql="select subjectname from class_subject where classname=?";
		QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
		ArrayList<subject> list= (ArrayList<subject>) runner.query(sql, new BeanListHandler<subject>(subject.class),classname);
		System.out.println(classname);
		System.out.println(list.size());
		return list;
	}

	public ArrayList<subject> getteachersubject(String username) throws SQLException{
		String sql="select subjectname from teacher_subject  where tc_username = ?";
		QueryRunner runner =new QueryRunner(DataSourceUtils.getDataSource());
		ArrayList<subject> list = (ArrayList<subject>) runner.query(sql, new BeanListHandler<subject>(subject.class),username);
		return list;
	}

}
