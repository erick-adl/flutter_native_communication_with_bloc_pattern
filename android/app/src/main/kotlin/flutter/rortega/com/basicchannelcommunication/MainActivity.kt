package flutter.rortega.com.basicchannelcommunication

import android.content.Intent
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    companion object {
        const val CHANNEL = "flutter.rortega.com.basicchannelcommunication"
    }



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        val channel = MethodChannel(flutterView, CHANNEL)
        Thread({
            while (true) {

                channel.invokeMethod("message", "Ola, eu sou o android nativo.")
                Thread.sleep(1_000)  // wait for 1 second
                channel.invokeMethod("message", "Ola, eu sou o android nativo..")
                Thread.sleep(1_000)  // wait for 1 second
                channel.invokeMethod("message", "Ola, eu sou o android nativo...")
                Thread.sleep(1_000)  // wait for 1 second
            }
        }).start()

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "showNativeView") {
//                val intent = Intent(this, NativeViewActivity::class.java)
//                startActivity(intent)
            }
            if (call.method == "getData") {
                channel.invokeMethod("message", "Ola, eu sou o android nativo...")
                result.success(true)
                
            } else {
                result.notImplemented()
            }
        }





    }



}
