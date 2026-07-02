package com.example.myapp;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;
import android.view.LayoutInflater;

public class CounterView extends LinearLayout {
    private TextView counterText;
    private Button incrementBtn;
    private Button decrementBtn;
    private int count = 0;

    public CounterView(Context context) {
        super(context);
        init(context);
    }

    public CounterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public CounterView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    private void init(Context context) {
        setOrientation(VERTICAL);
        setPadding(16, 16, 16, 16);

        counterText = new TextView(context);
        counterText.setText("Count: " + count);
        counterText.setTextSize(24);
        addView(counterText);

        incrementBtn = new Button(context);
        incrementBtn.setText("Increment");
        incrementBtn.setOnClickListener(v -> increment());
        addView(incrementBtn);

        decrementBtn = new Button(context);
        decrementBtn.setText("Decrement");
        decrementBtn.setOnClickListener(v -> decrement());
        addView(decrementBtn);
    }

    private void increment() {
        count++;
        updateText();
    }

    private void decrement() {
        count--;
        updateText();
    }

    private void updateText() {
        counterText.setText("Count: " + count);
    }

    public int getCount() {
        return count;
    }
}
