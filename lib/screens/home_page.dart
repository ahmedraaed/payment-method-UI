import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentapp/component/colors.dart';
import 'package:paymentapp/models/data_model.dart';
import 'package:paymentapp/widgets/app_button.dart';
import 'package:paymentapp/widgets/app_lage_button.dart';
import 'package:paymentapp/widgets/text_size.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller=Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    print(_controller.info);
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        width: w,
        child: Stack(
          children: [
            _headerSection(),
            Obx(() => _controller.loading==false?_listpayment():Center(child: CircularProgressIndicator(),)),
            _buttonPay(),
          ],
        ),
      ),
    );
  }
  _headerSection()
  {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveIamge(),
          _floatBottom(),
          _titleHeader(),
        ],
      ),
    );
  }
  _mainBackground()
  {
    return Positioned(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png")
          )
        ),
      ),
    );

  }
  _curveIamge()
  {
    return Positioned(
      left: 0,
      right: -3,
      bottom: 10,
        child: Container(
        height: MediaQuery.of(context).size.height*0.1,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/curve.png")
          )
      ),
    ),
    );
  }
  _floatBottom()
  {
    return Positioned(
      right: 55,
      bottom: 20,
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet<dynamic>(
              barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context)=>Container(
                height: 590,
                color: Colors.transparent,
                child: Stack(
                  children: [
                   Positioned(
                     bottom: 0,
                     child: Container(
                         height:MediaQuery.of(context).size.height-300,
                       width: MediaQuery.of(context).size.width,
                       color: Colors.white.withOpacity(0.6),
                     ),
                   ),
                    Positioned(
                      right: 50,
                        child:Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 200,
                          width: 55,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              AppButton(
                                  icon: Icons.cancel,
                                  ontap: (){
                                    Navigator.pop(context);
                                  },
                                  background: Colors.white,
                                  iconColor: AppColor.mainColor,
                                  iconSize: 35),
                              SizedBox(height: 10,),
                              AppButton(text: "add Bill",
                                  textColor: Colors.white,
                                  icon: Icons.add,
                                  ontap: (){},
                                  background: Colors.white,
                                  iconColor: AppColor.mainColor,
                                  iconSize: 35),
                              SizedBox(height: 10,),
                              AppButton(
                                  text: "History",
                                  textColor: Colors.white,
                                  icon: Icons.history,
                                  ontap: (){},
                                  background: Colors.white,
                                  iconColor: AppColor.mainColor,
                                  iconSize: 35),
                            ],
                          ),
                        ), ),
                  ],
                ),

          ));
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0,5),
                color: Colors.black26,
              ),
            ],
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/lines.png"),
            )
          ),

        ),
      ),
    );
  }

  _listpayment()
  {
    return Positioned(
      top: 325,
        right: 0,
        bottom: 0,
        left: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.separated(
            itemCount: _controller.info.length,
            itemBuilder: (context,index)=> Container(
              margin: EdgeInsets.only(right: 40,top:15 ),
              padding:EdgeInsets.only(top: 10,left: 15,bottom: 10) ,
              height: 120,
              width: MediaQuery.of(context).size.width-40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                boxShadow:[
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      spreadRadius: 1
                  ),
                ],
              ),
              child:
              Row(
                  children:
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3,color: AppColor.green),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                      NetworkImage("http://flutter.bslmeiyu.com/uploads/"+_controller.info[index].brandLogo!)
                                    // AssetImage("images/brand1.png"),
                                  )
                              ),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              children: [
                                Text(_controller.info[index].brandName!,style: TextStyle(color:AppColor.mainColor,fontWeight: FontWeight.w700 ),),
                                SizedBox(height: 5),
                                Text("ID:123456789",style: TextStyle(color:AppColor.idColor,fontWeight: FontWeight.w700 ),),
                              ],
                            ),
                          ],
                        ),
                        TextSize(text: _controller.info[index].dueInfo!, color: AppColor.idColor),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(_controller.info[index].status==0)
                              {
                                _controller.info[index].status=1;
                              }else
                                {
                                  _controller.info[index].status=0;
                                }
                            // _controller.info[index]["status"]=!_controller.info[index]["status"];
                            _controller.info.refresh();

                            print(_controller.newList.length());
                          },
                          child: Container(
                            height: 25,
                            width: 65,
                            decoration: BoxDecoration(
                              color:_controller.info[index].status==1? AppColor.selectBackground:AppColor.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text("Select",style: TextStyle(color:_controller.info[index].status==1 ? AppColor.selectColor:Colors.white,),)),
                          ),
                        ),
                        Expanded(child: Container()),
                        Text("\$${_controller.info[index].due}",style: TextStyle(color: Colors.black,),),
                        SizedBox(height: 4,),
                        Text("Due in 4 days",style: TextStyle(color: AppColor.idColor,fontWeight: FontWeight.w400,fontSize: 11),),

                      ],
                    ),
                    SizedBox(width: 8,),
                    Container(
                      height: 35,
                      width: 5,
                      decoration: BoxDecoration(
                        color: AppColor.cancelColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft:Radius.circular(5) ),
                      ),
                    ),
                  ]
              ),
            ),
            separatorBuilder:(context,index)=>Container(height: 15,) ,
          ),
        ));
  }
  
  _buttonPay()
  {
    return Positioned(
      bottom: 20,
        left: 40,
        right: 40,
        child: AppLargeButton(textSize: 20,color: AppColor.mainColor, onpressed: (){},text: "pay now ",textColor: Colors.white, heightSize: 10));
  }
  _titleHeader()
  {
    return Stack(
    children: [
      Positioned(
        top: 100,
    child: Text("My Bills",
      style: TextStyle(fontSize: 70,color: Colors.grey.withOpacity(0.2),
          fontWeight: FontWeight.bold),),),
 Positioned(
        top: 85,
    left: 40,
    child: Text("My Bills",
      style: TextStyle(fontSize: 45,color: Colors.white,
          fontWeight: FontWeight.bold),)),
    ],
    );
  }
}
