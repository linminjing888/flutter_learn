import 'package:flutter/material.dart';

// 星星评价
class MJStarRating extends StatefulWidget {
  final int count;
  final double maxRating;
  final double rating;
  final Color unselectedColor;
  final Color selectedColor;
  final double size;
  final Widget unselectedImg;
  final Widget selectedImg;

  MJStarRating({
    @required this.rating,
    this.count = 5,
    this.maxRating = 10.0,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.red,
    this.size = 50,
    Widget unselectedImg,
    Widget selectedImg,
  })  : unselectedImg = unselectedImg ??
            Icon(
              Icons.star_border,
              color: unselectedColor,
              size: size,
            ),
        selectedImg = selectedImg ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            );

  @override
  _MJStarRatingState createState() => _MJStarRatingState();
}

class _MJStarRatingState extends State<MJStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buidlSelectedStar(),
        ),
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImg;
    });
  }

  List<Widget> buidlSelectedStar() {
    List<Widget> stars = [];
    final star = widget.selectedImg;

    double oneValue = widget.maxRating / widget.count;
    int enetireCount = (widget.rating / oneValue).floor();
    for (var i = 0; i < enetireCount; i++) {
      stars.add(star);
    }

    double halfWidth =
        ((widget.rating / oneValue) - enetireCount) * widget.size;
    final halfStar = ClipRect(
      clipper: MJStarClipper(halfWidth),
      child: star,
    );
    stars.add(halfStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

// 裁剪
class MJStarClipper extends CustomClipper<Rect> {
  double width;
  MJStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
