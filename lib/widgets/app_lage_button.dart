import 'package:flutter/material.dart';

class AppLargeButton extends StatelessWidget {
  Function() onpressed;
  Color color;
  double heightSize;
  Color textColor;
  String text;
  double textSize;
  double? width;
   AppLargeButton({Key? key,this.width,required this.textSize,required this.color,required this.text,required this.textColor,required this.onpressed,required this.heightSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
    height: heightSize,
    minWidth: width,
    color: color,
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Text(text,style: TextStyle(color: textColor,fontSize: textSize),),
    );
  }
}
