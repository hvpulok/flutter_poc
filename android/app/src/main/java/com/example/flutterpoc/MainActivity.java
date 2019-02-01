package com.example.flutterpoc;

import android.app.Activity;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;

public class MainActivity extends FlutterActivity {
    public static Result result;
    public static final String CHANNEL = "phoenix.flutter.io/info";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall call, Result _result) {
                result = _result;
                if (call.method.equals("hello")) {
                    openNativeActivity();
                    //result.success("Hi from Android Native");
                } 
                // start: Battery plugin code starts here
                else if (call.method.equals("getBatteryLevel")) {
                    int batteryLevel = getBatteryLevel();

                    if (batteryLevel != -1) {
                        result.success(Integer.toString(batteryLevel) + "%");
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null);
                    }
                }
                // End: Battery plugin code starts here
                else {
                    result.notImplemented();
                }
            }
        });
    }

    public void openNativeActivity(){
        Intent intent = new Intent(this, NativeActivityDemo.class);
        intent.putExtra("message", "Hello from Flutter");
        // this.startActivityForResult(intent,1000000);
        this.startActivity(intent);
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null,
                    new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100)
                    / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

//    @Override
//    public void onActivityResult(int code, int resultCode, Intent data){
//        if (code == 1000000) {
//            if (resultCode == Activity.RESULT_OK) {
//                String barcode = data.getStringExtra("message");
//                this.result.success(barcode);
//            } else {
//                this.result.success("Message ERR!");
//            }
//        }
//    }
}
