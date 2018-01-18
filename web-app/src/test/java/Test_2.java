
import org.apache.commons.lang.StringUtils;
import org.junit.Ignore;


public class Test_2 {

    @Ignore
    @org.junit.Test
    public void test() {

        String images = "abr_2_detail_1.png|abr_2_detail_2.png|abr_2_detail_3.png|abr_2_detail_4.png";
        String[] ss = StringUtils.split(images,"|");
        for(String s : ss){
            System.out.println(s);
        }



    }
}
