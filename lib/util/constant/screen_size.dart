import 'dart:async';

class ScreenSizeStream{

  StreamController<ScreenSize> controller = StreamController<ScreenSize>.broadcast();
}
class ScreenSize {
 static double smallwidth = 700.0;
   double width = 0.0;
  double height = 0.0;
}