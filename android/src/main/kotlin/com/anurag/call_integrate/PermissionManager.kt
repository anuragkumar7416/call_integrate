package com.anurag.call_integrate



import android.Manifest
import android.app.Activity
import android.os.Build
import android.util.Log
import com.karumi.dexter.Dexter
import com.karumi.dexter.MultiplePermissionsReport
import com.karumi.dexter.PermissionToken
import com.karumi.dexter.listener.multi.MultiplePermissionsListener
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object PermissionManager {

    fun callPermission(
        activity: Activity,
        callbacks: ICall,
        call: MethodCall,
        result: MethodChannel.Result
    ) {



        val permission : MutableList<String> = ArrayList()
        permission.add(Manifest.permission.CALL_PHONE)




        Dexter.withContext(activity).withPermissions(permission)
            .withListener(object : MultiplePermissionsListener {

                override fun onPermissionsChecked(report: MultiplePermissionsReport) {

                    var d = report.deniedPermissionResponses

                    d?.forEach {
                        Log.i("DENIED", "IS ALL ${it.permissionName}")
                    }

                    var g = report.grantedPermissionResponses
                    g?.forEach {
                        Log.i("GRANTED", "IS ALL ${it.permissionName}")
                    }

                    val isAll = report.areAllPermissionsGranted()
                    Log.i("ALL GRANTED", "IS ALL ${isAll}")


                    callbacks.callMethod(call, result)

                }

                override fun onPermissionRationaleShouldBeShown(
                    p0: MutableList<com.karumi.dexter.listener.PermissionRequest>?,
                    token: PermissionToken?
                ) {

                    Log.i("AAAAA", "onPermissionRationaleShouldBeShown")
                    token?.continuePermissionRequest()

                }
            }).withErrorListener {

            }
            .onSameThread()
            .check()
    }



}