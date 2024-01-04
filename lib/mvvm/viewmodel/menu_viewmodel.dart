import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/mvvm/data_source/menu_data_source.dart';
import 'package:cv_builder/mvvm/repository/menu_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuVM extends ChangeNotifier implements MenuActionInterface{

  List<Widget> menu_list_widget=[];
  int active_item = 0; // by default first item is active

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
    menu_list_widget = menuRepo.FetchMenu(this,menu_list: menuDataSource.menu_list,clicked: 0);
    notifyListeners();
  }

  @override
  void onMenuItemTap(int index
      ) {
    // TODO: implement onMenuItemTap
    print("menu clicked: $index");

    /*
    check if user not clicked on active menu item
     */
    if(index!=active_item){
      /*
      update menu item list with [ChangeActiveMenu]
      and update the [active_item] to the clicked item
       */
      menu_list_widget = menuRepo.FetchMenu(this,menu_list: menuDataSource.ChangeActiveMenu(clicked: index,current: active_item));
      active_item = index;

      notifyListeners();

    }
  }
}