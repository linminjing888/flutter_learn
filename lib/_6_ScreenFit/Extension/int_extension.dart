import 'package:flutter_learn/_6_ScreenFit/screen_fit_share.dart';

extension intFit on int {
  double get px {
    return MJSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return MJSizeFit.setrPx(this.toDouble());
  }
}
