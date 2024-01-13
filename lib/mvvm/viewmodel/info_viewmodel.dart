import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/mvvm/model/service/info_service.dart';
import 'package:flutter/cupertino.dart';

class InfoVM extends ChangeNotifier{

  InfoModel? infoModel;
  InfoService? infoService;

  InfoVM(){
    infoService = InfoService();
  }


  void SaveInfoData({required InfoModel infoModel})async{
    this.infoModel  = infoModel;
    var result = await infoService?.SaveInfoData(infoModel: infoModel);
    if(result==true){
      print("Data saved");
      notifyListeners();

    }else{
      // show snackbar error
      print("this is an error");
    }
  }

  // fetch data
  void GetInfoModelData()async{
    try{
      var result = await infoService?.GetInfoData();
      infoModel = result;
      notifyListeners();
      print("Get Data: $result");

    }catch(e){
      print("Get Data:  ${e.toString()}");
    }

  }


}