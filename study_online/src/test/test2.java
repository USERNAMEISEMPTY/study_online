package test;

import org.apache.commons.dbutils.QueryRunner;
import utils.DataSourceUtils;

import java.sql.SQLException;

public class test2 {
    public static void main(String[] args)throws SQLException {
        String sql = "insert into posts(postid,subject,userid,username,postcontent,posttitle) values(?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql, 123, "asd",12,"234123"," asd sa d","asd");
        if (row == 0) {
            throw new RuntimeException();
        }
    }
}
