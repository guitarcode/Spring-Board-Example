import com.example.jsp_board.post.CategoryDao;
import com.example.jsp_board.post.CategoryVO;
import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class MybatisTest {
    @org.junit.jupiter.api.Test
    public void mybatisTest() {
        SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

        SqlSession session = sqlSessionFactory.openSession(true);
        CategoryDao categoryDao = session.getMapper(CategoryDao.class);

        List<CategoryVO> categoryList = categoryDao.categoryList();

        for (CategoryVO categoryVO : categoryList) {
            System.out.println("categoryVO.getName() = " + categoryVO.getName());
        }
    }


}
