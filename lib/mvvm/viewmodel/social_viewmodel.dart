import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:cv_builder/mvvm/repository/social_repo.dart';
import 'package:flutter/cupertino.dart';

class SocialVM extends ChangeNotifier{

  SocialModel? socialModel;
  SocialList? socialList;
 late SocialRepository  socialRepository;
  SocialVM(){
    socialRepository = SocialRepository();
  }

  void SaveSocialList({required SocialList social})async{
    this.socialList  = social;
    var result = await socialRepository.SaveSocialDataList(socialModel: social);
    if(result==true){
      print("Data saved");
      notifyListeners();

    }else{
      // show snackbar error
      print("this is an error");
    }
  }

  void GetSocialListData()async{
    try{
      var result = await socialRepository.GetSocialListData();
      socialList = result;
      notifyListeners();
      print("Get Data: $result");

    }catch(e){
      print("Get Data:  ${e.toString()}");
    }

  }


  void SaveSocialData({required SocialModel social})async{
    this.socialModel  = social;
    var result = await socialRepository.SaveSocialData(socialModel: social);
    if(result==true){
      print("Data saved");
      notifyListeners();

    }else{
      // show snackbar error
      print("this is an error");
    }
  }

  // fetch data
  void GetSocialModelData()async{
    try{
      var result = await socialRepository.GetSocialData();
      socialModel = result;
      notifyListeners();
      print("Get Data: $result");

    }catch(e){
      print("Get Data:  ${e.toString()}");
    }

  }
}