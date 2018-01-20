import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Order;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.OrderService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.goods.service.StockService;
import com.springmvc.user.bean.Address;
import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.CookieService;
import com.springmvc.user.service.UserService;
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
    private GoodsService goodsService;
    @Autowired
    private StockService stockService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private OrderService orderService;

    @org.junit.Test
    public void insertTest(){

        Order order = new Order();
        User user = new User();
        user.setId("123456");
        Goods goods = new Goods();
        goods.setId("123456");
        Address address = new Address();
        address.setId("123456");
        order.setUser(user)
                .setGoods(goods)
                .setAddress(address);

        orderService.query(order);

    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
