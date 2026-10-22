package com.example.myapp;

import android.content.Context;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private Context context;
    private List<User> users;
    private static final String TAG = "UserManager";

    public UserManager(Context context) {
        this.context = context;
        this.users = new ArrayList<>();
    }

    public void addUser(User user) {
        if (user != null && !user.getName().isEmpty()) {
            users.add(user);
            showMessage("User added: " + user.getName());
        } else {
            showMessage("Invalid user data");
        }
    }

    public void removeUser(int index) {
        if (index >= 0 && index < users.size()) {
            User removed = users.remove(index);
            showMessage("User removed: " + removed.getName());
        }
    }

    public User getUser(int index) {
        if (index >= 0 && index < users.size()) {
            return users.get(index);
        }
        return null;
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(users);
    }

    public int getUserCount() {
        return users.size();
    }

    public void clearUsers() {
        users.clear();
        showMessage("All users cleared");
    }

    private void showMessage(String message) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }

    public static class User {
        private String name;
        private String email;

        public User(String name, String email) {
            this.name = name;
            this.email = email;
        }

        public String getName() { return name; }
        public String getEmail() { return email; }
    }
}
