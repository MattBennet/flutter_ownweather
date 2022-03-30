import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ownweather/utils/Colors.dart';
import 'package:flutter_ownweather/utils/Images.dart';

class LoaderWidget extends StatefulWidget {
  final Color color;

  LoaderWidget({this.color});

  @override
  State<StatefulWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: Image.asset(Images.icButtonLoader,
          color: widget.color ?? CColors.primary),
    );
  }
}
