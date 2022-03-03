import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class Post {

    private int id;
    private String title;
    private String content;
    private String description;
    private String thumnail;
    private int idCategory;
    private int idAuthor;
    private LocalDate createAt;
    private String status;

    public Post(String title, String content, String description, String thumnail, int idCategory, int idAuthor, String status) {
        this.title = title;
        this.content = content;
        this.description = description;
        this.thumnail = thumnail;
        this.idCategory = idCategory;
        this.idAuthor = idAuthor;
        this.status = status;
    }

    @Override
    public String toString() {
        return id + " - " +title + " - " +description + " - " +thumnail + " - " +createAt;
    }
}
