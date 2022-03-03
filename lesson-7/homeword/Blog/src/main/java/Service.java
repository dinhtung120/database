import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

public class Service {
    ConnectDatabase connectDatabase = new ConnectDatabase();
    Connection connection = connectDatabase.connection();
    Scanner scanner = new Scanner(System.in);

    public ArrayList<Post> getAllPost() {
        String query = "SELECT * FROM post";
        ArrayList<Post> posts = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String description = resultSet.getString("description");
                String thumnail = resultSet.getString("thumnail");
                int idCategory = resultSet.getInt("id_category");
                int idAuthor = resultSet.getInt("id_author");
                LocalDate createAt = LocalDate.parse(resultSet.getString("create_at"));
                String status = resultSet.getString("status");

                posts.add(new Post(id, title, content, description, thumnail, idCategory, idAuthor, createAt, status));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public void show(ArrayList<?> list){
        for (Object o : list){
            System.out.println(o);
        }
    }

    public void getPostById(Post post){
        String query = "SELECT p.id , p.title , p.content ,p.create_at, a.name,\n" +
                "\t(SELECT JSON_ARRAYAGG(t.name) FROM tag t \n" +
                "\t\tINNER JOIN post_tag pt ON t.id =pt.id_tag  \n" +
                "\t\tINNER JOIN post p  ON pt.id_post =p.id  WHERE p.id = "+post.getId()+") AS tag_name\n" +
                "\tFROM post p \n" +
                "\tINNER JOIN author a ON a.id  = p.id_author \n" +
                "\tWHERE p.id = " + post.getId();
        ArrayList<Post> posts = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()){
                System.out.println(resultSet.getString("p.id")+" - " + resultSet.getString("p.title")
                        +" - " + resultSet.getString("p.content")+" - " + resultSet.getString("a.name")
                        +" - " + resultSet.getString("tag_name")+" - " + resultSet.getString("p.create_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void updateByID(Post post){
        System.out.println("Nhập title cần thay đổi");
        String newTitle = scanner.nextLine();
        System.out.println("Nhập content cần thay đổi");
        String newContent = scanner.nextLine();

        String query = "UPDATE `post` SET `title`='123',`content`='123' WHERE id = " + post.getId();

        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("Sửa lại thành công: ");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteByID(Post post){
        String query = "DELETE FROM post WHERE id ="+post.getId();

        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("Xóa thành công");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addNewPost(ArrayList<Post> posts){
        System.out.println("Nhập tiêu đề bài viết: ");
         String title = scanner.nextLine();
        System.out.println("Nhập nội dung bài viết: ");
         String content = scanner.nextLine();
        System.out.println("Nhập mô tả bài viết: ");
         String description = scanner.nextLine();
        System.out.println("Nhập hình ảnh giới thiệu bài viết: ");
         String thumnail = scanner.nextLine();
        System.out.println("Nhập id thể loại ( 4-5) của bài viết: ");
         int idCategory = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập id tác giả (25-44) của bài viết: ");
         int idAuthor = Integer.parseInt(scanner.nextLine());
        System.out.println("Nhập trạng thái bài viết (public, hidden, draft)");
         String status = scanner.nextLine();

        String query = "INSERT INTO `post`(`id`, `title`, `content`, `description`, `thumnail`, `id_category`, `id_author`, `create_at`, `status`)" +
                " VALUES (NULL,'"+title+"','"+content+"','"+description+"','"+thumnail+"',"+idCategory+","+idAuthor+",CURRENT_DATE,'"+status+"')";

        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            System.out.println("thêm thành công");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}
