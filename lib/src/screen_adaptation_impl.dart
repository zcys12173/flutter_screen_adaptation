import 'package:flutter_screen_adaptation/screen_adaptation_platform_interface.dart';

class ScreenAdaptation {
  static late double physicalHeight;
  static late double physicalWidth;
  static late double _designHeight;
  static late double _designWidth;

  static Future init(double designWidth,double designHeight) async {
    _designHeight = designHeight;
    _designWidth = designWidth;
    var sizeMap = await FlutterScreenAdaptationPlatform.instance
        .getScreenSize();
    physicalHeight = sizeMap["height"] ?? 0.0;
    physicalWidth = sizeMap["width"] ?? 0.0;
  }
}


extension NumberConvert on num{
  double get hDp =>  ScreenAdaptation.physicalHeight/ScreenAdaptation._designHeight
}
