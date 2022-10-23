import 'package:flutter/material.dart';
import 'package:paymentapp/component/colors.dart';
import 'package:paymentapp/widgets/app_button.dart';
import 'package:paymentapp/widgets/app_lage_button.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(

        padding: EdgeInsets.only(top: 60,left: 20,right: 20),
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/paymentbackground.png")
            )
        ),
        child:Column(
          children: [
          Container(
            height: height*0.1,

          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/success.png"),
              )
          ),
          ),
          SizedBox(height: 15,),
          Text("Success !",
          style: TextStyle(fontSize: 25,color: AppColor.mainColor,),),
          SizedBox(height: 15,),
          Text("payment is completed for 2 bills",
          style: TextStyle(fontSize: 18,color: Colors.grey,),),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1,),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(icon: Icons.check_circle , iconColor: AppColor.green, iconSize: 50),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text("KenGen Power",style: TextStyle(color:AppColor.mainColor,fontWeight: FontWeight.w700 ),),
                          SizedBox(height: 5),
                          Text("ID:123456789",style: TextStyle(color:AppColor.idColor,fontWeight: FontWeight.w700 ),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Text("\$5.1254",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700 ),),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: 1,width: double.infinity,color: Colors.grey,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppButton(icon: Icons.check_circle , iconColor: AppColor.green, iconSize: 50),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text("KenGen Power",style: TextStyle(color:AppColor.mainColor,fontWeight: FontWeight.w700 ),),
                          SizedBox(height: 5),
                          Text("ID:123456789",style: TextStyle(color:AppColor.idColor,fontWeight: FontWeight.w700 ),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Text("\$5.1254",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700 ),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 35,),
            Text("Total Amount",style: TextStyle(color:AppColor.idColor, ),),
            SizedBox(height: 20,),
            Text("\$8.1284",style: TextStyle(color:AppColor.mainColor,fontWeight: FontWeight.w700,fontSize: 35 ),),

            SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(icon: Icons.share,
                  iconColor: Colors.white,
                  iconSize: 20,
                  background: AppColor.mainColor,
                text: "Share",textColor: AppColor.mainColor),
                SizedBox(width: 50,),
                AppButton(icon: Icons.print_outlined,
                  iconColor: Colors.white,
                  iconSize: 20,
                  background: AppColor.mainColor,
                text: "Share",textColor: AppColor.mainColor),
              ],
            ),
          SizedBox(height: 50,),
          AppLargeButton(width: 300,textSize: 30,color: Colors.white, onpressed: (){},text: "Done ",textColor: AppColor.mainColor, heightSize: 10)

      ],
        ) ,
      ),
    );
  }
}
