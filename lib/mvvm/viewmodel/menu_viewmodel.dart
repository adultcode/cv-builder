import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/mvvm/repository/menu_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/custom_widgets/panel/menu/unactive_menu.dart';
import '../model/model_menu.dart';

class MenuVM extends ChangeNotifier implements MenuActionInterface{

  List<Widget> menu_list_widget=[];
  List<MenuModel> menu_items=[];
  int active_item = 0; // by default first item is active

 late MenuRepo menuRepo;

  MenuVM(){
    menuRepo = MenuRepo();
}

/*
Change active menu
 */
  void ChangeActiveItem(){
    ModelMenu.MenuItemClick();
    menu_items[active_item].active = false; // make active item to not active
    menu_list_widget[active_item] =UnActiveMenuItem(menu_items[active_item]);
    ChangeNotifier();
  }

/*
get menu items from repository
 */
  void GetMenuList(){
    menu_list_widget = menuRepo.FetchMenu(this);
    notifyListeners();
  }

  @override
  void onMenuItemTap(int index
      ) {
    // TODO: implement onMenuItemTap
    print("menu clicked: $index");
  }
}