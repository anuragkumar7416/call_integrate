package com.anurag.call_integrate

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

interface ICall {


    fun callMethod(call: MethodCall,
                     result: MethodChannel.Result)
}