package com.example.myapp;

import android.content.Context;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private Context context;
    private List<String> users;
    private static final String TAG = "UserManager";

    public UserManager(Context context) {
        this.context = context;
        this.users = new ArrayList<>();
    }

    public void addUser(String userName) {
        if (userName != null && !userName.isEmpty()) {
            users.add(userName);
            showToast("User added: " + userName);
        } else {
            showToast("Invalid user name");
        }
    }

    public void removeUser(String userName) {
        if (users.remove(userName)) {
            showToast("User removed: " + userName);
        } else {
            showToast("User not found");
        }
    }

    public List<String> getAllUsers() {
        return new ArrayList<>(users);
    }

    public int getUserCount() {
        return users.size();
    }

    public boolean userExists(String userName) {
        return users.contains(userName);
    }

    public void clearAllUsers() {
        users.clear();
        showToast("All users cleared");
    }

    private void showToast(String message) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }
}
