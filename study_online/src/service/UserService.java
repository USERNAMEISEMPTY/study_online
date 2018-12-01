package service;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.security.auth.login.LoginException;
import bean.subject;
import dao.UserDao;
import bean.User;
public class UserService {
	private UserDao dao = new UserDao();

	// 登录操作
	public User login(String userid, String password) throws LoginException {
		try {
			//根据登录时表单输入的用户ID和密码，查找用户
			User user = dao.findUserByUserIDAndPassword(userid, password);
			//如果找到，还需要确定用户是老师还是学生
			if (user != null) {
					return user;
				}
			throw new LoginException("用户ID或密码错误");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
	//获取课程
	public ArrayList<subject>  getsubject(String name,int userstatus) throws LoginException{
		try{
			if(userstatus==0){
				ArrayList<subject> list = dao.getstudentsubject(name);
				for (subject ss:list
				) {
					System.out.println(ss.getSubjectname());
				}
				return list;
			}
			//userstatus不为0时
			return dao.getteachersubject(name);
		}catch (SQLException e){
			e.printStackTrace();
			throw new LoginException("查询课程失败");
		}
	}
}
