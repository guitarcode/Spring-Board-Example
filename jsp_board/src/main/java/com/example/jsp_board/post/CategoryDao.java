package com.example.jsp_board.post;

import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public interface CategoryDao {
//    private final String dbURL = "jdbc:mysql://localhost:3306/board_study?allowPublicKeyRetrieval=true";
//    private final String dbUser = "root";
//    private final String dbPassword = "chltpals1!";


    List<CategoryVO> categoryList();
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
