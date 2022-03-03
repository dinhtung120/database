import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Service {
    ConnectDatabase connectDatabase = new ConnectDatabase();
    Connection conn = connectDatabase.connection();

    public ArrayList<User> getAllUser() {
        String query = " SELECT * FROM users u ";
        ArrayList<User> users = new ArrayList<>();

        try {
            Statement stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(query);
            while (resultSet.next()) {
//                System.out.println(resultSet.getString("id") + "-" + resultSet.getString("name"));
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String mobile = resultSet.getString("mobile");
                LocalDate date = LocalDate.parse(resultSet.getString("create_at"));


                users.add(new User(id, name, gender, address, mobile, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        list.forEach(i-> System.out.println(i));
        return users;
    }

    public void show(ArrayList<User> list) {
        for (User user : list) {
            System.out.println(user);
        }
    }


    public User getUserById(int id) {
        User findUser = null;

        String query = " SELECT * FROM users u WHERE id =" + id;
        try {
            Statement stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(query);

            while (resultSet.next()) {
                int idUser = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String mobile = resultSet.getString("mobile");
                LocalDate date = LocalDate.parse(resultSet.getString("create_at"));

                findUser = new User(idUser, name, gender, address, mobile, date);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return findUser;
    }

    public ArrayList<User> getUserByName(String name) {
        ArrayList<User> users = new ArrayList<>();

        String query = " SELECT * FROM users u WHERE name LIKE '%" + name + "%'";
        try {
            Statement stm = conn.createStatement();
            ResultSet resultSet = stm.executeQuery(query);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameUser = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String mobile = resultSet.getString("mobile");
                LocalDate date = LocalDate.parse(resultSet.getString("create_at"));

                users.add(new User(id, nameUser, gender, address, mobile, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void addNewUser(User user) {
        String query = "INSERT INTO `users`(`id`, `name`, `gender`, `address`, `mobile`, `create_at`)" +
                " VALUES (null,'" + user.getName() + "','" + user.getGender() + "','" + user.getAddress() + "','" + user.getMobile() + "',CURRENT_DATE)";

        try {
            Statement statement = conn.createStatement();
            statement.executeUpdate(query);
            System.out.println("them thanh cong");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(User user){
        String query = "DELETE FROM users WHERE id ="+user.getId();

        try {
            Statement statement = conn.createStatement();
            statement.executeUpdate(query);
            System.out.println("Xoa thanh cong");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAddress(User user, String newAddress){
        String query = "UPDATE `users` SET `address`='"+newAddress+"' WHERE id =" + user.getId();

        try {
            Statement statement = conn.createStatement();
            statement.executeUpdate(query);
            System.out.println("Sua dia chi thanh cong");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
