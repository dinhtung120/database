import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class User {
    private int id;
    private String name;
    private String gender;
    private String address;
    private String mobile;
    private LocalDate create_at;

    public User(String name, String gender, String address, String mobile) {
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.mobile = mobile;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", mobile='" + mobile + '\'' +
                ", create_at='" + create_at + '\'' +
                '}';
    }
}
