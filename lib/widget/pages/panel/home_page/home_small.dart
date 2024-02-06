import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/model/entity/template_model.dart';
import '../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../mvvm/viewmodel/user_viewmodel.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({Key? key}) : super(key: key);

  @override
  State<HomePageSmall> createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {


  List<TemplateModel> template_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).GetUserModel() ;
      Provider.of<TemplateVM>(context, listen: false).GetTemplateList() ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
    );
  }
}
