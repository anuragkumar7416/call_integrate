package com.anurag.call_integrate




import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** CallIntegratePlugin */
class CallIntegratePlugin: FlutterPlugin, MethodCallHandler,ICall,ActivityAware {


  private lateinit var context: Context
  private lateinit var activity: Activity
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext

    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "call_integrate")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {


    PermissionManager.callPermission(activity, this, call, result)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }


  private fun makePhoneCall(phoneNo:Long):Boolean{
    return try{

      val intent = Intent(Intent.ACTION_DIAL)
      intent.data = Uri.parse("tel:$phoneNo")
      activity.startActivity(intent)

      true

    }catch (e: Exception){

      false

    }


  }

  override fun callMethod(call: MethodCall, result: Result) {
    if(call.method == "makePhoneCall"){

      val contactNo =  call.argument<String>("phoneNo")
      val phoneNo =  (contactNo ?:"000").toLong()


      val callStatus = makePhoneCall(phoneNo)

      if(callStatus) {

        result.success(callStatus)
      } else {
        result.error("UNAVAILABLE", "Something went wrong", null)
      }
    }else{
      result.notImplemented()

    }
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }
}
