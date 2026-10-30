import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Button;

public class CustomCardView extends LinearLayout {
    private TextView titleTextView;
    private TextView descriptionTextView;
    private Button actionButton;
    
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
        setOrientation(LinearLayout.VERTICAL);
        setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        setPadding(16, 16, 16, 16);
        
        titleTextView = new TextView(getContext());
        titleTextView.setTextSize(18);
        titleTextView.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        addView(titleTextView);
        
        descriptionTextView = new TextView(getContext());
        descriptionTextView.setTextSize(14);
        descriptionTextView.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        addView(descriptionTextView);
        
        actionButton = new Button(getContext());
        actionButton.setText("Action");
        actionButton.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
        addView(actionButton);
    }
    
    public void setTitle(String title) {
        titleTextView.setText(title);
    }
    
    public void setDescription(String description) {
        descriptionTextView.setText(description);
    }
    
    public Button getActionButton() {
        return actionButton;
    }
}
