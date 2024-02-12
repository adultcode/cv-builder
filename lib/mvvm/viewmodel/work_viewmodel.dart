import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/works_item.dart';
import 'package:flutter/cupertino.dart';

import '../repository/work_repo.dart';

class WorkVM extends ChangeNotifier{


  // SocialModel? socialModel;
  WorklList? worklList;
  List<Widget>? work_items=[];
  WorkModel? selected_workmodel;
  bool isForEdit = false;
  late WorkRepository  workRepository;

  /// controllers
     var title_controller = TextEditingController();
    var company_controller = TextEditingController();
    var start_controller = TextEditingController();
    var end_controller = TextEditingController();
    var desc_controller = TextEditingController();
  WorkVM(){
    workRepository = WorkRepository();
    worklList = WorklList();

  }

  void ClearControllers(){
      title_controller.clear();
      company_controller.clear();
      start_controller.clear();
      end_controller.clear();
      desc_controller.clear();

      notifyListeners();
  }

  void PopulateInputs(){
      title_controller.text = selected_workmodel!.title!;
      company_controller.text = selected_workmodel!.company!;
      start_controller.text = selected_workmodel!.start_date!;
      end_controller.text = selected_workmodel!.end_date!;
      desc_controller.text = selected_workmodel!.description!;
   //   notifyListeners();

  }
void SelectWorkModel(WorkModel workModel){

    print("Selected work model clicked");
  selected_workmodel = workModel;
    PopulateInputs();
    isForEdit = true;
}


// delete workmodel from list
  void DeleteWork(WorkModel workModel){

    print("Selected work model clicked");
    selected_workmodel = workModel;
    worklList?.workModels?.remove(workModel);

    // proccess list agained
    work_items?.clear();
    work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

    isForEdit = false;
    selected_workmodel = null;
    notifyListeners();


  }

  /*
  add new workmodel in list
   */
  void AddWork()async{

  var temp_work = WorkModel(title:title_controller.text,
        company: company_controller.text,
        description: desc_controller.text,
        start_date: start_controller.text,
        end_date: end_controller.text);
    print('length: ${worklList?.workModels}');
    if(worklList?.workModels==null || worklList?.workModels?.isEmpty==true){
      print("WOrk list is empty");
      temp_work.id = 1;
      worklList?.workModels=[temp_work];

    }
    else{
      var last_id = (worklList?.workModels?.last!.id!)! ;
      last_id= last_id + 1;
      // check isForEdit is true or not
      // if true, it's edit not new item
      if(isForEdit==true){
        //find index

        int? _index = worklList?.workModels?.indexWhere((item) => item?.id == selected_workmodel?.id);

        print("index for edit is $_index");
        if(_index!=null) {
          temp_work.id = selected_workmodel?.id;
          worklList!.workModels?[_index] = temp_work;
        }

      }else{
        temp_work.id =last_id;
        worklList?.workModels?.add(temp_work);

      }

    }

   // worklList?.workModels?.add(work);

      work_items?.clear();
     work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();

      print("Data added");
    isForEdit = false;
    selected_workmodel = null;
    ClearControllers();
  }

  /*
  save list of work models
   */
  Future<bool> SaveWorkList()async{
    var result;
    // if list is empty delete all saved data
    if(worklList==null || worklList?.workModels?.isEmpty==true){
      print("List is empty delete all works");
       result = await workRepository.ClearWorklist();

    }else{
      //this.worklList  = work;
      print("Saving data:");
       result = await workRepository.SaveWorkDataList(worklList: worklList!);

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

    return result;
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
  isForEdit = false;
  }


  }