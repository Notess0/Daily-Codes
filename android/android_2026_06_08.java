import android.content.Context;
import android.widget.Toast;

public class UserManager {
    private Context context;
    private String userName;
    private String userEmail;
    private int userId;

    public UserManager(Context context) {
        this.context = context;
        this.userId = -1;
    }

    public void setUserName(String name) {
        this.userName = name;
    }

    public void setUserEmail(String email) {
        this.userEmail = email;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getUserEmail() {
        return this.userEmail;
    }

    public void setUserId(int id) {
        this.userId = id;
    }

    public int getUserId() {
        return this.userId;
    }

    public boolean isUserValid() {
        return userName != null && !userName.isEmpty() &&
               userEmail != null && !userEmail.isEmpty() &&
               userId > 0;
    }

    public void displayUserInfo() {
        String message = "User: " + userName + "\nEmail: " + userEmail;
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }

    public void clearUser() {
        this.userName = null;
        this.userEmail = null;
        this.userId = -1;
    }
}
