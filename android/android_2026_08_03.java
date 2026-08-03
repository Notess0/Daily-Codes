package com.example.app;

import android.content.Context;
import android.widget.Toast;

public class MessageHandler {
    private Context context;
    private String message;
    private int duration;

    public MessageHandler(Context context) {
        this.context = context;
        this.duration = Toast.LENGTH_SHORT;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void showMessage() {
        if (message != null && !message.isEmpty()) {
            Toast.makeText(context, message, duration).show();
        }
    }

    public void showMessage(String msg) {
        if (msg != null && !msg.isEmpty()) {
            Toast.makeText(context, msg, duration).show();
        }
    }

    public void showMessage(String msg, int customDuration) {
        if (msg != null && !msg.isEmpty()) {
            Toast.makeText(context, msg, customDuration).show();
        }
    }

    public String getMessage() {
        return message;
    }

    public int getDuration() {
        return duration;
    }

    public void clear() {
        message = null;
        duration = Toast.LENGTH_SHORT;
    }

    public boolean hasMessage() {
        return message != null && !message.isEmpty();
    }
}
