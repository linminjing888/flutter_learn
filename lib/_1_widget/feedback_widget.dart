import 'dart:math';

import 'package:flutter/material.dart';

enum FeedMode {
  scale,
  fade,
  rotate,
}

class FeedbackWidget extends StatefulWidget {
  final Widget child;
  final FeedMode mode;
  final Duration duration;
  final VoidCallback onPressed;
  final a;

  FeedbackWidget({
    @required this.child,
    this.mode = FeedMode.scale,
    this.duration = const Duration(milliseconds: 150),
    @required this.onPressed,
    this.a = 0.9,
  });

  @override
  _FeedbackWidgetState createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double rate = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        setState(() {
          rate = (widget.a - 1) * _controller.value + 1;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
        widget.onPressed();
      },
      child: _buildAnimMode(widget.child, widget.mode),
    );
  }

  Widget _buildAnimMode(Widget child, FeedMode mode) {
    switch (mode) {
      case FeedMode.scale:
        return Transform.scale(scale: rate, child: child);
        break;
      case FeedMode.fade:
        return Opacity(opacity: rate, child: child);
        break;
      case FeedMode.rotate:
        return Transform.rotate(angle: rate * pi * 2, child: child);
        break;
      default:
    }
    return Container();
  }
}
