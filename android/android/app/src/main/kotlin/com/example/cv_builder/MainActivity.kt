package com.example.cv_builder

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    val channel_name = "com.platform"




    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channel_name)


        var osversion = Build.VERSION.SDK_INT

        channel.invokeMethod("GetVersion",osversion,object:MethodChannel.Result{
            override fun success(result: Any?) {

            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                TODO("Not yet implemented")
            }

            override fun notImplemented() {
                TODO("Not yet implemented")
            }


        })
    }
}


