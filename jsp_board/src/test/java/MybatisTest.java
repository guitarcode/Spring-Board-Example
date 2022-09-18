import com.example.jsp_board.post.CategoryDAO;
import com.example.jsp_board.post.CategoryVO;

import java.util.List;

public class MybatisTest {
    @org.junit.jupiter.api.Test
    public void mybatisTest() {
        CategoryDAO categoryDAO = new CategoryDAO();
        List<CategoryVO> categoryList = categoryDAO.categoryList();

        for (CategoryVO categoryVO : categoryList) {
            System.out.println("categoryVO.getName() = " + categoryVO.getName());
        }
    }


}
