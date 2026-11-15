package com.example.app;

import android.content.Context;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private Context context;
    private List<User> userList;
    private static UserManager instance;

    private UserManager(Context context) {
        this.context = context;
        this.userList = new ArrayList<>();
    }

    public static synchronized UserManager getInstance(Context context) {
        if (instance == null) {
            instance = new UserManager(context);
        }
        return instance;
    }

    public void addUser(User user) {
        if (user != null && !user.getName().isEmpty()) {
            userList.add(user);
            showToast("User added: " + user.getName());
        }
    }

    public void removeUser(int index) {
        if (index >= 0 && index < userList.size()) {
            User removed = userList.remove(index);
            showToast("User removed: " + removed.getName());
        }
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(userList);
    }

    public User getUserById(int index) {
        if (index >= 0 && index < userList.size()) {
            return userList.get(index);
        }
        return null;
    }

    public int getUserCount() {
        return userList.size();
    }

    private void showToast(String message) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }

    public static class User {
        private String name;
        private String email;

        public User(String name, String email) {
            this.name = name;
            this.email = email;
        }

        public String getName() {
            return name;
        }

        public String getEmail() {
            return email;
        }
    }
}
