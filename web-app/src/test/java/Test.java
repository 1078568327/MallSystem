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

    @org.junit.Test
    public void insertTest(){

        Order o = new Order();
        o.setId("13c2b843-1f61-443f-b56a-d8e381b2606c");
        Order order = orderService.query(o);

        User user = order.getUser();
        Goods goods = order.getGoods();

        Comment comment = new Comment();
        comment.setGoods(goods)
                .setUser(user)
                .setOrder(order)
                .setFitScore(new BigDecimal(5))
                .setSellerScore(new BigDecimal(5))
                .setLogisticsScore(new BigDecimal(5))
                .setGoodsComment("很好，不错")
                .setServiceComment("服务态度好")
                .setCreateTime(new Date());

        commentService.save(comment);

    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
