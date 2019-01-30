package com.example.flutterpoc;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import io.flutter.app.FlutterActivity;

public class DisplayMessageActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_message);
        Intent intent = getIntent();
        String message = intent.getStringExtra(MainActivity.BAR_CODE_SCANNER);
        TextView textView = findViewById(R.id.textView);
        textView.setText(message);
    }

    public void sendResult(View view){
        Intent data = new Intent();
        String scanResult = "01234567890";
        data.putExtra(MainActivity.BAR_CODE_SCANNER,scanResult);
        setResult(RESULT_OK, data);
        finish();
    }

}
