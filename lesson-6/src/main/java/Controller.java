import java.util.ArrayList;
import java.util.Scanner;

public class Controller {
    static Service service = new Service();
    static Scanner scanner = new Scanner(System.in);
    static ArrayList< User> users = service.getAllUser();
    public static void home(){
        boolean isContinue = true;
        while (isContinue){
            menu();
            System.out.println("Lua chon cua ban la");
            int choice = Integer.parseInt(scanner.nextLine());
            switch (choice){
                case 1:
                    service.show(users);
                    break;
                case 2:
                    System.out.println("nhap ten can tim");
                    String findName = scanner.nextLine();
                    ArrayList<User> users = service.getUserByName(findName);
                    service.show(users);
                    break;
                case 3:
                    System.out.println("Nhap id");
                    int id = Integer.parseInt(scanner.nextLine());
                    User user = service.getUserById(id);
                    System.out.println(user);
                    subMenu();
                    break;
                case 0:
                    System.exit(0);
                default:
                    System.out.println("Khong co lua chon nay");
            }
        }





    }

    public static void menu(){
        System.out.println("1 - Xem toan bo danh sach");
        System.out.println("2 - Tim theo ten");
        System.out.println("3 - Tim theo id");
        System.out.println("0 - Thoat chuong trinh");
    }

    public static void subMenu(){
        System.out.println("1 - Cap nhat dia chi");
        System.out.println("2 - Xoa");
    }
}
