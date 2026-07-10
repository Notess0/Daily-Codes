package com.example.app;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;

public class CustomCard extends LinearLayout {
    private TextView titleText;
    private TextView descriptionText;
    private Button actionButton;

    public CustomCard(Context context) {
        super(context);
        init();
    }

    public CustomCard(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public CustomCard(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        setOrientation(VERTICAL);
        setPadding(16, 16, 16, 16);

        titleText = new TextView(getContext());
        titleText.setTextSize(18);
        titleText.setTextColor(0xFF000000);
        addView(titleText);

        descriptionText = new TextView(getContext());
        descriptionText.setTextSize(14);
        descriptionText.setTextColor(0xFF666666);
        addView(descriptionText);

        actionButton = new Button(getContext());
        actionButton.setText("Action");
        addView(actionButton);
    }

    public void setTitle(String title) {
        titleText.setText(title);
    }

    public void setDescription(String description) {
        descriptionText.setText(description);
    }

    public void setButtonText(String text) {
        actionButton.setText(text);
    }

    public Button getButton() {
        return actionButton;
    }
}
