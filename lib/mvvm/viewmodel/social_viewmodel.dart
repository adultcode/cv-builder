import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:cv_builder/mvvm/repository/social_repo.dart';
import 'package:flutter/cupertino.dart';

class SocialVM extends ChangeNotifier{

 // SocialModel? socialModel;
  SocialList? socialList;
 late SocialRepository  socialRepository;
  List<SocialModel?> _social_list = List<SocialModel?>.filled(6,null);


  /// controllers
  var linkedin_controller = TextEditingController(); //0
  var github_controller = TextEditingController();   // 1
  var dribble_controller = TextEditingController();  // 2
  var website_controller = TextEditingController();  // 3
  var telegram_controller = TextEditingController(); // 4
  var instagram_controller = TextEditingController();  // 5

  SocialVM(){
    socialRepository = SocialRepository();
  }


  List<SocialModel?> GetInputData(){


    // check linkedin
    if(linkedin_controller.text.isNotEmpty) _social_list[0] = SocialModel(address: linkedin_controller.text,socialType: SocialType.linkedin);
    else _social_list[0] = null;

    // check github
    if(github_controller.text.isNotEmpty) _social_list[1] = SocialModel(address: github_controller.text,socialType: SocialType.github);
    else _social_list[1] = null;

    // check dribble
    if(dribble_controller.text.isNotEmpty) _social_list[2] = SocialModel(address: dribble_controller.text,socialType: SocialType.dribble);
    else _social_list[2] = null;

    // check website
    if(website_controller.text.isNotEmpty) _social_list[3] = SocialModel(address: website_controller.text,socialType: SocialType.other);
    else _social_list[3] = null;

    // check telegram
    if(telegram_controller.text.isNotEmpty) _social_list[4] = SocialModel(address: telegram_controller.text,socialType: SocialType.telegram);
    else _social_list[4] = null;

    // check telegram
    if(instagram_controller.text.isNotEmpty) _social_list[5] = SocialModel(address: instagram_controller.text,socialType: SocialType.instagram);
    else _social_list[5] = null;

    return _social_list;
  }

  void PopulateInput(){

    //linkedin
    linkedin_controller.text = socialList?.socialModels?[0]?.address??"";

    //github
    github_controller.text = socialList?.socialModels?[1]?.address??"";

    //dribble
    dribble_controller.text = socialList?.socialModels?[2]?.address??"";

    //website
    website_controller.text = socialList?.socialModels?[3]?.address??"";

    //telegram
    telegram_controller.text = socialList?.socialModels?[4]?.address??"";

    //instagram
    instagram_controller.text = socialList?.socialModels?[5]?.address??"";



  }


  // save social list in the db
  void SaveSocialList()async{
    socialList = SocialList(socialModels: GetInputData());

    var result = await socialRepository.SaveSocialDataList(socialModel: socialList!);
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
      PopulateInput();
      notifyListeners();
      print("Get Data: $result");

    }catch(e){
      print("Get Data:  ${e.toString()}");
    }

  }


}