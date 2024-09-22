package mobile.template


import android.content.Intent
import android.os.Build
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        WindowCompat.setDecorFitsSystemWindows(window, false)
//        OpenVPNFlutterPlugin.connectWhileGranted(requestCode == 24 && resultCode == RESULT_OK)
        super.onActivityResult(requestCode, resultCode, data)
    }
}
