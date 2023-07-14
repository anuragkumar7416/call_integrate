import Flutter
import UIKit

public class CallIntegratePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "call_integrate", binaryMessenger: registrar.messenger())
    let instance = CallIntegratePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          guard call.method == "makePhoneCall" else {
                      result(FlutterMethodNotImplemented)
                      return
                    }
                  guard let result = call.arguments else {
                                    return
                                }
                                let myResult = result as? [String: Any]
                                let phoneNo = myResult?["phoneNo"] as? String
                    self.makePhoneCall(phoneNo: phoneNo ?? "0")
  }


      private func makePhoneCall(phoneNo:String){


          if let url = URL(string: "tel://"+phoneNo),
             UIApplication.shared.canOpenURL(url) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)

          }
      }
}
