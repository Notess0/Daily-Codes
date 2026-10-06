package com.example.app;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;
import android.view.LayoutInflater;

public class CounterView extends LinearLayout {
    private TextView counterText;
    private Button incrementButton;
    private Button decrementButton;
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
        setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        counterText = new TextView(context);
        counterText.setText("Count: 0");
        counterText.setTextSize(24);
        addView(counterText);

        incrementButton = new Button(context);
        incrementButton.setText("Increment");
        incrementButton.setOnClickListener(v -> increment());
        addView(incrementButton);

        decrementButton = new Button(context);
        decrementButton.setText("Decrement");
        decrementButton.setOnClickListener(v -> decrement());
        addView(decrementButton);
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
