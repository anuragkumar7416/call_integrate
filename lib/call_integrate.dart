

import 'package:flutter/services.dart';

class CallIntegrate {

  static const platform = MethodChannel('call_integrate');

  Future<bool> makePhoneCall(String phoneNo) async {
    bool callStatus = await platform.invokeMethod('makePhoneCall', {'phoneNo': phoneNo});
    return callStatus;
  }
}

