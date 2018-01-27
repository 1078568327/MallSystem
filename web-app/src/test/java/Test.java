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

    @org.junit.Test
    public void insertTest(){

        Goods goods = new Goods();
        Page page = PageUtil.createPage(null,36,1,36);
        goods.setPage(page);
        List<Goods> list = goodsService.queryByPage(goods);
        for(Goods g : list){
            Stock stock = new Stock();
            stock.setGoods(g)
                    .setGoodsStock(1000)
                    .setUpdateTime(new Date());
            stockService.save(stock);
        }


    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
