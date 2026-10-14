package com.example.app;

import android.content.Context;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private Context context;
    private List<String> userList;
    private static UserManager instance;

    private UserManager(Context context) {
        this.context = context;
        this.userList = new ArrayList<>();
    }

    public static UserManager getInstance(Context context) {
        if (instance == null) {
            instance = new UserManager(context);
        }
        return instance;
    }

    public void addUser(String userName) {
        if (userName != null && !userName.isEmpty()) {
            userList.add(userName);
            showToast("User added: " + userName);
        }
    }

    public void removeUser(String userName) {
        if (userList.remove(userName)) {
            showToast("User removed: " + userName);
        }
    }

    public List<String> getAllUsers() {
        return new ArrayList<>(userList);
    }

    public int getUserCount() {
        return userList.size();
    }

    public boolean userExists(String userName) {
        return userList.contains(userName);
    }

    public void clearAllUsers() {
        userList.clear();
        showToast("All users cleared");
    }

    private void showToast(String message) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }
}
