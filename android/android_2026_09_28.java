package com.example.app;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ImageView;

public class CustomCardView extends LinearLayout {
    
    private TextView titleTextView;
    private TextView descriptionTextView;
    private ImageView iconImageView;
    
    public CustomCardView(Context context) {
        super(context);
        init();
    }
    
    public CustomCardView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }
    
    public CustomCardView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }
    
    private void init() {
        setOrientation(VERTICAL);
        setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        setPadding(16, 16, 16, 16);
        
        iconImageView = new ImageView(getContext());
        addView(iconImageView);
        
        titleTextView = new TextView(getContext());
        titleTextView.setTextSize(18);
        addView(titleTextView);
        
        descriptionTextView = new TextView(getContext());
        descriptionTextView.setTextSize(14);
        addView(descriptionTextView);
    }
    
    public void setTitle(String title) {
        titleTextView.setText(title);
    }
    
    public void setDescription(String description) {
        descriptionTextView.setText(description);
    }
    
    public void setIcon(int drawableId) {
        iconImageView.setImageResource(drawableId);
    }
    
    public String getTitle() {
        return titleTextView.getText().toString();
    }
}
