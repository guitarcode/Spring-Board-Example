package com.example.jsp_board.post;

import com.example.jsp_board.util.MybatisSqlSessionFactory;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

@Slf4j
public class CategoryDAO {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public List<CategoryVO> categoryList(){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            List<CategoryVO> categoryList = session.selectList("categoryList");
            session.close();
            return categoryList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//        try {
//            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
//            String query = "select * from category order by name";
//            Statement statement =
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }

//    }
}
