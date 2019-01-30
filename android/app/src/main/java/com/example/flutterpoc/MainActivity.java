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
    private static final String CHANNEL = "phoenix.flutter.io/info";
    public static final String EXTRA_MESSAGE = "com.example.flutterpoc.MESSAGE";
    public static final String BAR_CODE_SCANNER = "com.example.flutterpoc.BARCODE";
    public static Result result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall call, Result _result) {
                result = _result;
                if (call.method.equals("hello")) {
                    result.success("Hi from Android Native");
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
                else if (call.method.equals("scanBarcode")) {
                    sendMessage();
//                    result.success("Hi scanBarcode");
                }
                else {
                    result.notImplemented();
                }
            }
        });
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

    public void sendMessage(){
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        intent.putExtra(BAR_CODE_SCANNER, "Scan Bar Code Please...");
        this.startActivityForResult(intent,100);
    }

    @Override
    public void onActivityResult(int code, int resultCode, Intent data){
        if (code == 100) {
            if (resultCode == Activity.RESULT_OK) {
                String barcode = data.getStringExtra(BAR_CODE_SCANNER);
                this.result.success(barcode);
            } else {
                this.result.success("Scan ERR!");
            }
        }
    }
}
