import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/mvvm/data_source/menu_data_source.dart';
import 'package:cv_builder/mvvm/repository/menu_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuVM extends ChangeNotifier {

  List<Widget> menu_list_widget=[];
  List<MenuModel> menu_list=[];
  int active_item = 0; // by default first item is active
  int pre_item = 0; // store previous active item

 late MenuRepo menuRepo;

 late MenuDataSource menuDataSource;
  MenuVM(){
    menuRepo = MenuRepo();
    menuDataSource = MenuDataSource();
}

/*
Change active menu
 */


/*
get menu items from repository
 */
  void GetMenuList(){
    menu_list = menuDataSource.menu_list;
    //menu_list_widget = menuRepo.FetchMenu(this,menu_list: menu_list,clicked: 0);
    notifyListeners();
  }

  void setActiveItem(int index) {
    if (index != active_item) {
      // Update only the active and previously active items.
      menu_list[active_item].active = false;
      menu_list[index].active = true;
      pre_item = active_item;
      active_item = index;

      notifyListeners();
    }
  }

}