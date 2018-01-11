import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.CookieService;
import com.springmvc.user.service.UserService;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class Test {

    @Autowired
    private UserService userService;
    @Autowired
    private CookieService cookieService;

    @org.junit.Test
    public void insertTest(){

        CookieBean cookieBean = new CookieBean();
        cookieBean.setSessionId("123");
        CookieBean ckb = cookieService.query(cookieBean);
        System.out.println(ckb);

    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
