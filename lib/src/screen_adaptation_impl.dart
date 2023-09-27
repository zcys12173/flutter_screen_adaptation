import 'package:flutter/services.dart';

class ScreenAdaptation {
  static late double physicalHeight;
  static late double physicalWidth;
  static late double widthScale;
  static late double heightScale;
  static late double _designHeight;
  static late double _designWidth;
  static const _methodChannel = MethodChannel('flutter_screen_adaptation');

  ScreenAdaptation._();

  static Future<Map<String,double>> _getScreenSize() async{
    final map = await _methodChannel.invokeMethod<Map>('getScreenSize');
    return {"height":map?["height"],"width":map?["width"]};
  }

  static Future init(double designWidth,double designHeight) async {
    _designHeight = designHeight;
    _designWidth = designWidth;
    var sizeMap = await _getScreenSize();
    physicalHeight = sizeMap["height"] ?? 0.0;
    physicalWidth = sizeMap["width"] ?? 0.0;
    widthScale =  ScreenAdaptation.physicalWidth/ScreenAdaptation._designWidth;
    heightScale =  ScreenAdaptation.physicalHeight/ScreenAdaptation._designHeight;
  }
}


extension NumberConvert on num{
  double get wdp => this * ScreenAdaptation.widthScale;
  double get hdp => this * ScreenAdaptation.heightScale;
}
