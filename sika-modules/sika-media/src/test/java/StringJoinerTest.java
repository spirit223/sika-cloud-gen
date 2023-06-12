import java.util.StringJoiner;
import java.util.stream.Stream;

/**
 * @author 吴畅
 * @创建时间 2023/5/16 - 23:49
 */
public class StringJoinerTest {
    public static void main(String[] args) {
        String[] str1 = new String[]{"1122aa", "23cas5", "445566y", "7454f", "9865g"};
        String[] str2 = new String[] {"yyyyy"};
        String[] strings = new String[0];
        StringJoiner stringJoiner = new StringJoiner(",");
        for (String s : str1) {
            stringJoiner.add(s);
        }
        System.out.println(stringJoiner);
        System.out.println("--------");
        stringJoiner = new StringJoiner(",");
        for (String s : str2) {
            stringJoiner.add(s);
        }
        System.out.println(stringJoiner);
        System.out.println("--------");
        stringJoiner = new StringJoiner(",");
        for (String s : strings) {
            stringJoiner.add(s);
        }
        System.out.println(stringJoiner);
        System.out.println("end");
        String[] str4 = new String[]{"1122aa", "23cas5", "445566y", "7454f", "9865g"};
        stringJoiner = new StringJoiner(",");
        Stream.of(str4).forEach(stringJoiner::add);
        System.out.println(stringJoiner);
    }
}
