import 'package:flutter/material.dart';
import 'package:oks/contants.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double width;

  ButtonWidget({
    required this.buttonName,
    required this.onTap,
    this.margin = const EdgeInsets.all(0.0),
    this.buttonColor= PrimaryColor,
    this.textColor= White,
    this.width=300.0,
    this.height=60.0,
  });

  @override
  Widget build(BuildContext context) {
    final customButton = Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width,height: height),
        child: ElevatedButton(
            onPressed: onTap,
            child: Text(buttonName,style: TextStyle(color: textColor,fontSize: ButtonText),),
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor,)
        ),
      ),
    );
    return customButton;
  }
}