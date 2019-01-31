package com.example.flutterpoc;

import android.os.Bundle;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;
import io.flutter.app.FlutterActivity;

public class NativeActivityDemo extends FlutterActivity {
    private static final String CHANNEL = "phoenix.flutter.io/info";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native_demo);
        Intent intent = getIntent();
        String message = intent.getStringExtra("message");
        TextView textView = findViewById(R.id.textView2);
        textView.setText(message);
    }

    public void sendResult(View view){
//        getIntent().putExtra("message", "Hello From Native!!!");
//        setResult(RESULT_OK, getIntent());
         finish();
    }
}
