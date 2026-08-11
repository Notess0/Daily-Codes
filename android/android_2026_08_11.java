package com.example.app;

import android.content.Context;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    
    private EditText inputField;
    private Button submitButton;
    private TextView resultText;
    private UserPreferences preferences;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        preferences = new UserPreferences(this);
        initializeViews();
        setupClickListeners();
        loadSavedData();
    }
    
    private void initializeViews() {
        inputField = findViewById(R.id.input_field);
        submitButton = findViewById(R.id.submit_button);
        resultText = findViewById(R.id.result_text);
    }
    
    private void setupClickListeners() {
        submitButton.setOnClickListener(v -> handleSubmit());
    }
    
    private void handleSubmit() {
        String userInput = inputField.getText().toString().trim();
        
        if (userInput.isEmpty()) {
            showToast("Please enter some text");
            return;
        }
        
        String result = processInput(userInput);
        resultText.setText(result);
        preferences.saveUserInput(userInput);
        showToast("Data saved successfully");
    }
    
    private String processInput(String input) {
        return "Processed: " + input.toUpperCase();
    }
    
    private void loadSavedData() {
        String savedInput = preferences.getUserInput();
        if (savedInput != null && !savedInput.isEmpty()) {
            inputField.setText(savedInput);
        }
    }
    
    private void showToast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }
}
