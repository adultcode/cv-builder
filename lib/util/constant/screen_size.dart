import 'dart:async';

class ScreenSizeStream{

 static StreamController<ScreenSize> controller = StreamController<ScreenSize>.broadcast();
}
class ScreenSize {
 static double smallwidth = 600.0;
  double width2 = 0.0;
 static  double width = 0.0;
  double height2 = 0.0;
 static double height = 0.0;
}