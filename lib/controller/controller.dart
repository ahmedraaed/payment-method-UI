import 'package:get/get.dart';
import 'package:paymentapp/data/data_api.dart';
import 'package:paymentapp/models/data_model.dart';
class Controller extends GetxController
{
  final service= DataServices();
  RxList<DataModel> info=<DataModel>[].obs;
  var _loading=false.obs;
   get loading=>_loading.value;

   var _select=false.obs;
   get select=>_select.value;

   get newList=>info.where((e) => e.status==0).map((e) => e).toList();
  @override
  onInit()
  {
    _loadingData();

    super.onInit();
  }


  _loadingData()async
  {
    _loading.value=false;
    try{
      _loading.value=true;
      var jsondata= await service.getDataFromJson();
      List<DataModel> list =await jsondata.map((e) => DataModel.fromJson(e)).toList();
      info.addAll(list);
    }catch(e)
    {
      print("error is ${e}");

    }finally{
      _loading.value=false;
  }


  }






}