import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  CustomButtonWidget({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(buttonTitle),
    );
  }
}
