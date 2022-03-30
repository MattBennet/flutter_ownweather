import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ownweather/widget/primary_button.dart';

class RetryWidget extends StatelessWidget {
  String message;
  final Function callback;
  Color textColor;

  RetryWidget.withMessage({this.message, this.callback, this.textColor});

  RetryWidget({this.callback});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                message ?? "Error",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor ?? Color(0xff323643),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              height: 52,
              width: screenSize.width,
              child: PrimaryButton(
                onClick: () {
                  callback?.call();
                },
                text: "Попробовать еще раз",
              ),
            ),
          ),
        )
      ],
    );
  }
}
