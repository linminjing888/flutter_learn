import 'package:flutter_learn/_1_widget/17_screen_fit_share.dart';

extension doubleFit on double {
  double get px {
    return MJSizeFit.setPx(this);
  }

  double get rpx {
    return MJSizeFit.setrPx(this);
  }
}
