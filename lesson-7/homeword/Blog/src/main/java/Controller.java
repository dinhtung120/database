import java.util.ArrayList;
import java.util.Scanner;

public class Controller {

    static Service service = new Service();
    static ArrayList<Post> posts = service.getAllPost();
    static Scanner scanner = new Scanner(System.in);


    public static void home() {
        boolean isContinue = true;
        while (isContinue) {
            menu();
            int choice = Integer.parseInt(scanner.nextLine());
            switch (choice) {
                case 1:
                    showPulic(posts);
                    break;
                case 2:
                    Post post = searchById(posts);
                    subHome(post);
                    break;
                case 3:
                    service.addNewPost(posts);
                    break;
                case 0:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Không có lựa chọn này ");
            }
        }
    }

    public static void subHome(Post post) {
        boolean isContinue = true;
        while (isContinue) {
            subMenu();
            int choice = Integer.parseInt(scanner.nextLine());
            switch (choice) {
                case 1:
                    service.getPostById(post);
                    break;
                case 2:
                    service.updateByID(post);
                    break;
                case 3:
                    service.deleteByID(post);
                    break;
                case 0:
                    home();
                    break;
                default:
                    System.out.println("Không có lựa chọn này ");
            }
        }
    }

    public static void menu() {
        System.out.println("---------------------------------------");
        System.out.println("Chọn 1: Xem thông tin các bai viết pulic");
        System.out.println("Chọn 2: Xem thông tin bài viết theo id ");
        System.out.println("Chọn 3: Thêm bài viết mới");
        System.out.println("Chọn 0: Để đăng xuất");
        System.out.println("Lựa chọn của bạn là: ");
    }

    public static void subMenu() {
        System.out.println("---------------------------------------");
        System.out.println("Chọn 1: Xem thông tin bài viết");
        System.out.println("Chọn 2: Sửa thông tin title và content của bài viết");
        System.out.println("Chọn 3: Xóa bài viết");
        System.out.println("Chọn 0: Quay lại menu chính");
        System.out.println("Lựa chọn của bạn là: ");
    }

    public static void showPulic(ArrayList<Post> posts) {
        posts.stream().filter(post -> post.getStatus().equals("public"))
                .forEach(post -> System.out.println(post));
    }

    public static Post searchById(ArrayList<Post> posts) {
        Post p = null;
        System.out.println("Nhập ID bài viết muốn xem");
        int searchId = Integer.parseInt(scanner.nextLine());
        for (Post post : posts) {
            if (post.getId() == searchId) {
                p = post;
            }
        }
        return p;
    }
}
