import 'package:flutter/material.dart';
import 'package:paymentapp/component/colors.dart';

class TextSize extends StatelessWidget {

  String text;
  Color color;

   TextSize({Key? key,required this.text,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size textSize=_getTextSize();
    return Container(
      child: Column(
        children: [
          Text(text,
          style: TextStyle(color: color,),maxLines: 1,overflow: TextOverflow.clip,softWrap: false),
          SizedBox(height: 5,),
          Row(
            children: [
              for(int i=0;i<=textSize.width/5;i++)
                i.isEven?
                Container(width: 5,height: 1,color: color,)
                    :
                Container(width: 5,height: 1,color: Colors.white,)

            ],
          ),
        ],
      ),
    );
  }
  Size _getTextSize()
  {
    TextPainter textPainter= TextPainter(text:TextSpan(text: text,style: TextStyle(color: color,),),
        maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0,maxWidth: double.infinity);
    return textPainter.size;

  }
}
