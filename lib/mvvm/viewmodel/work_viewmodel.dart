import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/works_item.dart';
import 'package:flutter/cupertino.dart';

import '../repository/work_repo.dart';

class WorkVM extends ChangeNotifier{


  // SocialModel? socialModel;
  WorklList? worklList;
  List<Widget>? work_items=[];
  WorkModel? selected_workmodel;
  late WorkRepository  workRepository;
  WorkVM(){
    workRepository = WorkRepository();
    worklList = WorklList();

  }


void SelectWorkModel(WorkModel workModel){

    print("Selected work model clicked");
  selected_workmodel = workModel;
  notifyListeners();
}
  void DeleteWork(WorkModel workModel){

    print("Selected work model clicked");
    selected_workmodel = workModel;
    worklList?.workModels?.remove(workModel);

    // proccess list again
    work_items?.clear();
    work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

    notifyListeners();
  }

  /*
  add new workmodel in list
   */
  void AddWork({required WorkModel work})async{

    worklList?.workModels?.add(work);
   // var result = await workRepository.SaveWorkDataList(worklList: work);
//var result;
    //if(result==true){
      work_items?.clear();
      work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

      print("Data added");
      notifyListeners();

  }

  /*
  save list of work models
   */
  void SaveSocialList({required WorklList work})async{

  this.worklList  = work;
  print("Saving data: ${work.workModels}");
  var result = await workRepository.SaveWorkDataList(worklList: work);
//var result;
  if(result==true){
    work_items?.clear();
    work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

    print("Data saved");
  notifyListeners();

  }else{
  // show snackbar error
  print("this is an error");
  }
  }

  /*
  get list of work models save in shared prefences
   */
  void GetWorkListData()async{
  try{
  var result = await workRepository.GetWorkListData();

  worklList = result;
  work_items?.clear();
//  work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
    if(result.workModels!=null){
      work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
    }
  notifyListeners();
  print("Get size: ${result.workModels}");


  }catch(e){
  print("Get Data:  ${e.toString()}");
  }

  }


  }