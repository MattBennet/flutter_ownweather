import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ownweather/utils/Colors.dart';
import 'package:flutter_ownweather/utils/Images.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final onClick;
  final int textSize;
  final bool isEnabled;
  final bool isVisible;
  final bool isLoading;
  final Color bgColor;
  final Color textColor;

  PrimaryButton({
    this.text,
    this.onClick,
    this.textSize,
    this.isEnabled = true,
    this.isVisible = true,
    this.isLoading = false,
    this.bgColor = CColors.primary,
    this.textColor = Colors.white,
  });

  @override
  State<StatefulWidget> createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton>
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
    if (widget.isVisible) {
      return Material(
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            color: widget.isLoading || !widget.isEnabled
                ? CColors.greyText
                : widget.bgColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              if (!widget.isLoading) {
                widget.onClick();
              }
            },
            child: Center(
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.isLoading
                            ? Colors.transparent
                            : widget.textColor,
                        fontSize: widget.textSize ?? 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.isLoading
                        ? RotationTransition(
                      turns:
                      Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: Image.asset(
                        Images.icButtonLoader,
                      ),
                    )
                        : Container(
                      width: 0,
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
