package com.example.app;

import android.content.Context;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private List<String> users;
    private Context context;
    
    public UserManager(Context context) {
        this.context = context;
        this.users = new ArrayList<>();
    }
    
    public void addUser(String username) {
        if (username != null && !username.isEmpty()) {
            users.add(username);
            showMessage("User added: " + username);
        } else {
            showMessage("Invalid username");
        }
    }
    
    public void removeUser(String username) {
        if (users.remove(username)) {
            showMessage("User removed: " + username);
        } else {
            showMessage("User not found");
        }
    }
    
    public boolean userExists(String username) {
        return users.contains(username);
    }
    
    public List<String> getAllUsers() {
        return new ArrayList<>(users);
    }
    
    public int getUserCount() {
        return users.size();
    }
    
    public void clearAllUsers() {
        users.clear();
        showMessage("All users cleared");
    }
    
    private void showMessage(String message) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    }
}
