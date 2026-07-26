package com.example.myapp;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;
import android.view.View;

public class CustomCard extends LinearLayout {
    private TextView titleView;
    private TextView descriptionView;
    private Button actionButton;
    private OnActionClickListener listener;

    public CustomCard(Context context) {
        super(context);
        init();
    }

    public CustomCard(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        setOrientation(LinearLayout.VERTICAL);
        setPadding(16, 16, 16, 16);

        titleView = new TextView(getContext());
        titleView.setTextSize(18);
        addView(titleView);

        descriptionView = new TextView(getContext());
        descriptionView.setTextSize(14);
        LayoutParams params = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        params.topMargin = 8;
        addView(descriptionView, params);

        actionButton = new Button(getContext());
        actionButton.setText("Action");
        params = new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.topMargin = 16;
        actionButton.setOnClickListener(v -> {
            if (listener != null) {
                listener.onActionClick();
            }
        });
        addView(actionButton, params);
    }

    public void setTitle(String title) {
        titleView.setText(title);
    }

    public void setDescription(String description) {
        descriptionView.setText(description);
    }

    public void setOnActionClickListener(OnActionClickListener listener) {
        this.listener = listener;
    }

    public interface OnActionClickListener {
        void onActionClick();
    }
}
