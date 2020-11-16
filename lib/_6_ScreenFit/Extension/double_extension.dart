import 'package:flutter_learn/_6_ScreenFit/screen_fit_share.dart';

extension doubleFit on double {
  double get px {
    return MJSizeFit.setPx(this);
  }

  double get rpx {
    return MJSizeFit.setrPx(this);
  }
}
