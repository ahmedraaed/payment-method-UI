import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Function()? ontap;
  String? text;
  Color? background;
  IconData icon;
  Color iconColor;
  double iconSize;
  Color? textColor;
  double? fontSize;

   AppButton({Key? key,
   required this.icon,
    this.ontap,
    this.background,
   required this.iconColor,
   required this.iconSize,
   this.text,
   this.fontSize,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: background,
              ),
           child: Icon(icon,color: iconColor,size: iconSize,),
            ),
            SizedBox(width: 3),
            text!=null?Text(text!,style: TextStyle(color: textColor,fontSize: fontSize,),):Container(),
          ],
      ),
    );
  }
}
