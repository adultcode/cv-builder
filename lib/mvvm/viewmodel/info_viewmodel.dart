import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/mvvm/repository/info_repo.dart';
import 'package:flutter/cupertino.dart';

class InfoVM extends ChangeNotifier{

  InfoModel? infoModel;
  InfoRepository? infoService;

  /// text controllers //
  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var bio_controller = TextEditingController();
  var jobtitle_controller = TextEditingController();
  var city_controller = TextEditingController();
  var birth_controller = TextEditingController();

  InfoVM(){
    infoService = InfoRepository();
  }


  Future<bool> SaveInfoData()async{
    infoModel  = InfoModel(email: email_controller.text,
        name: name_controller.text,
            bio: bio_controller.text,
            job: jobtitle_controller.text,
            mobile: phone_controller.text,
            city: city_controller.text,
            birth: birth_controller.text,);
    var result = await infoService?.SaveInfoData(infoModel: infoModel!);
    if(result==true){
      print("Data saved");
      infoModel = null;
      return true;
      notifyListeners();

    }else{
      // show snackbar error
      print("this is an error");
      return false;
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


  // populate fields with data
void PopulateForm(){
  name_controller.text = infoModel!.name!;
  jobtitle_controller.text = infoModel!.job!;
  bio_controller.text = infoModel!.bio!;
  phone_controller.text = infoModel!.mobile!.toString();
  email_controller.text = infoModel!.email!;
  city_controller.text = infoModel!.city!;
  birth_controller.text = infoModel!.birth!;
  //notifyListeners();
}
}