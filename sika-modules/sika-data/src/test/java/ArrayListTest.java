import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 吴畅
 * @创建时间 2023/4/28 - 19:54
 */
public class ArrayListTest {
    @Test
    public void testFastFailed() {
        List<String> list = new ArrayList<>(Arrays.asList("A", "B", "C"));
        List<String> list1 = Arrays.asList("D", "E", "F");
        for (String s : list) {
            System.out.println(list.size());
            for (String s1 : list1) {
                list.addAll(list1);
            }
        }
    }

    @Test
    public void testAddOne() {
        new ArrayList<>();
        List<String> list = new ArrayList<>(Arrays.asList("A", "B", "C"));
        for (String s : list) {
            list.add("E");
        }
    }

    @Test
    public void testConcurrentModify() {
        List<String> list = new ArrayList<>();
        list.addAll(Arrays.asList("A", "B", "C"));
        for (String s : list) {
            list.add("E");
        }
    }
}
