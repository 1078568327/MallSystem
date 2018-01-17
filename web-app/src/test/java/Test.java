import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.StockService;
import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.bean.User;
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

    @org.junit.Test
    public void insertTest(){

        /*Goods goods = new Goods();
        goods.setGoodsName("越南进口红心火龙果 5斤")
                .setGoodsPrice(new BigDecimal(38))
                .setOriginPrice(new BigDecimal(0))
                .setGoodsType("蔬菜")
                .setGoodsImages("images/abroad/abr_12_title.jpg")
                .setAddTime(new Date());

        goodsService.save(goods);*/

        Goods goods = new Goods();
        goods.setPage(PageUtil.createPage(null,28,1,28));
        goods.setIsSale(1);
        List<Goods> goodsList = goodsService.queryByPage(goods);
        for(Goods item : goodsList){
            Stock stock = new Stock();
            stock.setGoods(item)
                    .setGoodsStock(10000)
                    .setUpdateTime(new Date());
            stockService.save(stock);
        }

    }

    @Ignore
    @org.junit.Test
    public void test() {



    }


}
