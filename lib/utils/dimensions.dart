import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height padding and margin(top/bottom/height/width)
  static double height10 = screenHeight / 84.4;
  static double height40 = screenHeight / 20.0;
  static double height268 = screenHeight / 2.98;
  static double height345 = screenHeight / 2.28;
  static double width370 = screenHeight / 2.16;
  static double width350 = screenHeight / 2.28;

  //dynamic width padding and margin(left/right)
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;

  //font size
  static double fontBigS16 = screenHeight / 51.75;
  static double fontBigS20 = screenHeight / 42.2;
  static double fontBigS26 = screenHeight / 30.76;
}
