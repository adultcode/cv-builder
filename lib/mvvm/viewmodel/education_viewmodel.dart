import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/repository/education_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/custom_widgets/panel/dashboard/items/education_item.dart';

class EducationVM extends ChangeNotifier{


  // SocialModel? socialModel;
  EducationList? educationList;
  List<Widget>? work_items=[];
  EducationModel? selected_education;
  bool isForEdit = false;
  late EducationRepository  educationRepository;

  WorkVM(){
    educationRepository = EducationRepository();
    educationList = EducationList();

  }

  void SelectEducationModel(EducationModel educationModel){

    print("Selected work model clicked");
    selected_education = educationModel;
    notifyListeners();
    isForEdit = true;
  }


// delete workmodel from list
  void DeleteWork(EducationModel educationModel){

    print("Selected work model e");
    selected_education = educationModel;
    educationList?.educationList?.remove(educationModel);

    // proccess list again
    work_items?.clear();
    work_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

    isForEdit = false;
    selected_education = null;
    notifyListeners();


  }


  /*
  add new workmodel in list
   */
  void AddEducation({required EducationModel educationModel})async{

    print('length: ${educationList?.educationList}');
    if(educationList?.educationList==null){
      print("WOrk list is empty");
      educationModel.id = 1;
      educationList?.educationList=[educationModel];

    }
    else{
      var last_id = (educationList?.educationList?.last!.id!)! ;
      last_id= last_id + 1;
      // check isForEdit is true or not
      // if true, it's edit not new item
      if(isForEdit==true){
        //find index

        int? _index = educationList?.educationList?.indexWhere((item) => item?.id == selected_education?.id);

        print("index for edit is $_index");
        if(_index!=null) {
          educationModel.id = selected_education?.id;
          educationList?.educationList?[_index] = educationModel;
        }

      }else{
        educationModel.id =last_id;
        educationList?.educationList?.add(educationModel);

      }

    }

    // worklList?.workModels?.add(work);

    work_items?.clear();
    work_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

    print("Data added");
    isForEdit = false;
    selected_education = null;
    notifyListeners();

  }

  /*
  save list of work models
   */
  void SaveWorkList({required EducationList educationList})async{
    var result;
    if(educationList.educationList?.isEmpty==true){
      print("List is empty delete all works");
      result = await educationRepository.ClearEducationist();

    }else{
      this.educationList  = educationList;
      print("Saving data:");
      result = await educationRepository.SaveWorkDataList(educationList: educationList);


    }

    if(result==true){
      work_items?.clear();
      work_items = educationList.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

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
  void GetEducationListData()async{
    try{
      var result = await educationRepository.GetEducationListData();

      educationList = result;
      work_items?.clear();
//  work_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
      if(result!=null){
        print("Key exist");
        work_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();
      }else{
        print("Data is null key nit exist");
        work_items = null;
      }
      //print("Get size: ${result.workModels}");


    }catch(e){
      work_items = null;

      print("Get Data:  ${e.toString()}");
    }

    notifyListeners();
    isForEdit = false;
  }

}