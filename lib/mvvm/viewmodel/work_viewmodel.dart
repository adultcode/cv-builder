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

// delete workmodel from list
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

    print('length: ${worklList?.workModels}');
    if(worklList?.workModels==null){
      print("WOrk list is empty");
      work.id = 1;
      worklList?.workModels=[work];

    }
    else{
      var last_id = (worklList?.workModels?.last!.id!)! ;
      last_id= last_id + 1;
      work.id =last_id;
      worklList?.workModels?.add(work);

    }
   // worklList?.workModels?.add(work);

      work_items?.clear();
     work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

      print("Data added");
      notifyListeners();

  }

  /*
  save list of work models
   */
  void SaveWorkList({required WorklList work})async{
    var result;
    if(work.workModels?.isEmpty==true){
      print("List is empty delete all works");
       result = await workRepository.ClearWorklist();

    }else{
      this.worklList  = work;
      print("Saving data:");
       result = await workRepository.SaveWorkDataList(worklList: work);


    }

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
    if(result!=null){
      print("Key exist");
      work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
    }else{
      print("Data is null key nit exist");
      work_items = null;
    }
  print("Get size: ${result.workModels}");


  }catch(e){
    work_items = null;

    print("Get Data:  ${e.toString()}");
  }

  notifyListeners();

  }


  }