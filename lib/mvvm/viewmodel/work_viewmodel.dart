import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:flutter/cupertino.dart';

import '../repository/work_repo.dart';

class WorkVM extends ChangeNotifier{


  // SocialModel? socialModel;
  WorklList? worklList;
  late WorkRepository  workRepository;
  SocialVM(){
    workRepository = WorkRepository();
  }

  void SaveSocialList({required WorklList work})async{
  this.worklList  = work;
  var result = await workRepository.SaveWorkDataList(worklList: work);
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
  var result = await workRepository.GetWorkListData();
  worklList = result;
  notifyListeners();
  print("Get Data: $result");

  }catch(e){
  print("Get Data:  ${e.toString()}");
  }

  }


  }