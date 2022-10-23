import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class DataServices
{

  String url="http://flutter.bslmeiyu.com/api";
  String endPoint="/billinfo";

 Future<List<dynamic>> getDataFromJson()async
  {
    var uri=Uri.parse(url+endPoint);


  try{
    http.Response response=await http.get(uri);
    if(response.statusCode==200)
      {
        List<dynamic> list= await jsonDecode(response.body);
        // print(list);
        return list.map((e) => e).toList();
      }else
        {
          print("error when get data");
          return [];
        }
  }catch(e)
    {
      print(e);
      print("server error");
      return [];
    }
    // var result= await rootBundle.loadString("json/json.json");
    //
    // List<dynamic> info=jsonDecode(result);
    //
    // return Future.delayed(Duration(seconds: 1),()=>info,);
    // return info.map((e) => e).toList();

  }
}