import com.springmvc.backstage.bean.Admin;
import com.springmvc.backstage.service.AdminService;
import com.springmvc.goods.bean.*;
import com.springmvc.goods.service.*;
import com.springmvc.user.bean.Address;
import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.bean.ShippingAddress;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.CookieService;
import com.springmvc.user.service.ShippingAddressService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class Test {

    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private StockService stockService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ShippingAddressService shippingAddressService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private AdminService adminService;

    @org.junit.Test
    public void insertTest(){

        Admin admin = new Admin();
        admin.setAccount("123456");
        admin.setPassword("123456");
        admin.setAdminLevel(1);
        System.out.println(adminService.query(admin));
    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
