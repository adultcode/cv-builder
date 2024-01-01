import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/mvvm/repository/menu_repo.dart';
import 'package:flutter/cupertino.dart';

class MenuVM extends ChangeNotifier{

  List<Widget> menu_list_widget=[];
  List<MenuModel> menu_items=[];

 late MenuRepo menuRepo;

  MenuVM(){
    menuRepo = MenuRepo();
}

/*
get menu items from repository
 */
  void GetMenuList(){

    menu_list_widget = menuRepo.FetchMenu();
    notifyListeners();
  }
}