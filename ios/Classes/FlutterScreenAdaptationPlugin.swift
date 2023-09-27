import Flutter
import UIKit

public class FlutterScreenAdaptationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_screen_adaptation", binaryMessenger: registrar.messenger())
    let instance = FlutterScreenAdaptationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getScreenSize":
        let screenSize = UIScreen.main.bounds.size
//             let screenScale = UIScreen.main.scale
             let screenWidthInPoints = screenSize.width
             let screenHeightInPoints = screenSize.height
//             print("scall:\(screenScale),width：\(screenWidthInPoints),height:\(screenHeightInPoints)")
             let screenWidthInDp = Float(screenSize.width)
             let screenHeightInDp = Float(screenSize.height)
             result(["width": screenWidthInDp, "height": screenHeightInDp])
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    
}
