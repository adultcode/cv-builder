import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_list.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/repository/education_repo.dart';
import 'package:cv_builder/mvvm/repository/skill_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/custom_widgets/panel/dashboard/items/education_item.dart';
import '../../widget/custom_widgets/panel/dashboard/items/skill_item.dart';

class SkillVM extends ChangeNotifier{


  // SocialModel? socialModel;
  SkillList? skillList;
  List<Widget>? skill_items=[];
  SkillModel? selected_skill;
  bool isForEdit = false;
  late SkillRepository  skillRepository;

  SkillVM(){
    skillRepository = SkillRepository();
    skillList = SkillList();
    //  skillList?.skillList = [];

  }

  void SelectEducationModel(SkillModel skillModel){

    print("Selected work model clicked");
    selected_skill = skillModel;
    notifyListeners();
    isForEdit = true;
  }


// delete workmodel from list
  void DeleteWork(SkillModel skillModel){

    print("Selected work model e");
    selected_skill = skillModel;
    skillList?.skill_list?.remove(skillModel);

    // proccess list again
    skill_items?.clear();
    skill_items = skillList?.skill_list?.map((e) => SkillItem(skillModell: e!)).toList();

    isForEdit = false;
    selected_skill = null;
    notifyListeners();


  }


  /*
  add new workmodel in list
   */
  void AddEducation({required SkillModel skillModel})async{

    print('length: ${skillList?.skill_list}');
    if(skillList?.skill_list==null){
      print("education list is empty");
      skillModel.id = 1;
      print("education $skillModel");

      skillList?.skill_list=[skillModel];
      // skillList?.skillList?.add(educationModel);
      print('length2: ${skillList?.skill_list}');


    }
    else{
      var last_id = (skillList?.skill_list?.last!.id!)! ;
      last_id= last_id + 1;
      // check isForEdit is true or not
      // if true, it's edit not new item
      if(isForEdit==true){
        //find index

        int? _index = skillList?.skill_list?.indexWhere((item) => item?.id == selected_skill?.id);

        print("index for edit is $_index");
        if(_index!=null) {
          skillModel.id = selected_skill?.id;
          skillList?.skill_list?[_index] = skillModel;

        }

      }else{
        skillModel.id =last_id;
        skillList?.skill_list?.add(skillModel);

      }

    }

    // worklList?.workModels?.add(work);

    skill_items?.clear();
    skill_items = skillList?.skill_list?.map((e) => SkillItem(skillModell: e!)).toList();

    print("Data added");
    isForEdit = false;
    selected_skill = null;
    notifyListeners();

  }

  /*
  save list of work models
   */
  void SaveWorkList({required SkillList skillList})async{
    var result;
    if(skillList.skill_list?.isEmpty==true){
      print("List is empty delete all works");
      result = await skillRepository.ClearSkillList();

    }else{
      this.skillList  = skillList;
      print("Saving data:");
      result = await skillRepository.SaveSkillDataList(skillList: skillList);


    }

    if(result==true){
      skill_items?.clear();
      skill_items = skillList.skill_list?.map((e) => SkillItem(skillModell: e!)).toList();

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
  void GetskillListData()async{
    try{
      var result = await skillRepository.GetSkillListData();

      skillList = result;
      skill_items?.clear();
//  skill_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
      if(result!=null){
        print("Key exist");
        skill_items = skillList?.skill_list?.map((e) => SkillItem(skillModell: e!)).toList();
      }else{
        print("Data is null key nit exist");
        skill_items = null;
      }
      //print("Get size: ${result.workModels}");


    }catch(e){
      skill_items = null;

      print("Get Data:  ${e.toString()}");
    }

    notifyListeners();
    isForEdit = false;
  }

}