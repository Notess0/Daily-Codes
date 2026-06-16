package com.example.app;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ImageView;
import android.view.LayoutInflater;

public class UserProfileCard extends LinearLayout {
    
    private TextView nameTextView;
    private TextView emailTextView;
    private ImageView profileImageView;
    
    public UserProfileCard(Context context) {
        super(context);
        init(context);
    }
    
    public UserProfileCard(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }
    
    private void init(Context context) {
        setOrientation(VERTICAL);
        setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        
        profileImageView = new ImageView(context);
        profileImageView.setLayoutParams(new LayoutParams(200, 200));
        addView(profileImageView);
        
        nameTextView = new TextView(context);
        nameTextView.setTextSize(18);
        nameTextView.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
        addView(nameTextView);
        
        emailTextView = new TextView(context);
        emailTextView.setTextSize(14);
        emailTextView.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
        addView(emailTextView);
    }
    
    public void setUserName(String name) {
        nameTextView.setText(name);
    }
    
    public void setUserEmail(String email) {
        emailTextView.setText(email);
    }
    
    public void setProfileImage(int imageResId) {
        profileImageView.setImageResource(imageResId);
    }
    
    public String getUserName() {
        return nameTextView.getText().toString();
    }
    
    public String getUserEmail() {
        return emailTextView.getText().toString();
    }
}
