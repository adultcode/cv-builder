import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../cv/pdf_page.dart';

class HomeBigPage extends StatefulWidget {
  const HomeBigPage({Key? key}) : super(key: key);

  @override
  State<HomeBigPage> createState() => _HomeBigPageState();
}

class _HomeBigPageState extends State<HomeBigPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).GetUserModel() ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: sl<ScreenSize>().height,
        decoration: panel_container_decoration,
        padding: EdgeInsets.symmetric(
            vertical: sl<ScreenSize>().height * 0.02,
            horizontal: sl<ScreenSize>().width * 0.02),
        child: SingleChildScrollView(
          child: Consumer<UserViewModel>(
            builder: (context, value, child) {
              //    if(value.selected_workmodel!=null && value.selected_workmodel?.title!=null){
              //   PopulateInputs(value.selected_workmodel!);
              //  }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  SizedBox(
                    height: sl<ScreenSize>().height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: panel_green,
                          padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10)
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(userModel: value.userModel),));
                        },
                        child: Text("دریافت رزومه",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                      ),
                      Text(
                        'پروفایل ',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'قالب رزومه مورد نظر خود را از لیست زیر انتخاب نمایید ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if(value.userModel?.infoModel!=null)
                    Text("user name: ${value.userModel?.infoModel?.name}")
                ],
              );
            },
          ),
        ));
  }
}
