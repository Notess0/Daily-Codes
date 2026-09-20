package com.example.app;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;

public class CustomUserCard extends LinearLayout {
    
    private TextView userNameText;
    private TextView userEmailText;
    private Button actionButton;
    private OnActionClickListener listener;
    
    public CustomUserCard(Context context) {
        super(context);
        init(context);
    }
    
    public CustomUserCard(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }
    
    public CustomUserCard(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }
    
    private void init(Context context) {
        setOrientation(VERTICAL);
        LayoutInflater.from(context).inflate(R.layout.user_card_layout, this, true);
        
        userNameText = findViewById(R.id.user_name);
        userEmailText = findViewById(R.id.user_email);
        actionButton = findViewById(R.id.action_btn);
        
        actionButton.setOnClickListener(v -> {
            if (listener != null) {
                listener.onActionClick();
            }
        });
    }
    
    public void setUserData(String name, String email) {
        userNameText.setText(name);
        userEmailText.setText(email);
    }
    
    public void setActionListener(OnActionClickListener listener) {
        this.listener = listener;
    }
    
    public interface OnActionClickListener {
        void onActionClick();
    }
}
