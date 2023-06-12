/**
 * @author 吴畅
 * @创建时间 2023/4/21 - 17:00
 */
public class StringTest {
    public static void main(String[] args) {
        String localFilePath = "D:/sika/uploadPath";
        System.out.println(localFilePath.substring(localFilePath.lastIndexOf("/")+1));
    }
}
