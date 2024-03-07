import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../../config/localize/languages.dart';
import '../../../../../config/locator.dart';
import '../../../../../mvvm/viewmodel/privacy_viewmodel.dart';
import '../../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/radius_size.dart';
import '../../../../../util/constant/screen_size.dart';
import '../../../../../util/warning/snack_bar.dart';
class PrivacyModal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<PrivacyVM>(context).GetPrivacyText(1);

    return Container(
      height: sl<ScreenSize>().height*0.7,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15,
          vertical: sl<ScreenSize>().height*0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(outer_radius))

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.cancel_outlined,size: 28,color: black_title,)),
              Text("حریم خصوصی",
                style: Theme.of(context).textTheme.bodyLarge,)
              // Text(AppLocale.accept_privacy.getString(context))
            ],
          ),
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            //  color:Colors.amberAccent,
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topRight,
                //     color:Colors.amberAccent,
                child: Consumer<PrivacyVM>(
                  builder: (context, value, child) {
                    if(value.privacy_text==null){
                      return Text("Loading..");
                    }else{
                      return  Text(value.privacy_text!,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,);
                    }
                  },
                ),
              ),
            ),
          )),
          Container(
            // color:Colors.amberAccent,
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child:     ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  primary_container,
              ),
              onPressed: () async{
              if(await  Provider.of<PrivacyVM>(context,listen: false).ChangeParivacy(true)==true){
                    if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
                    // DownloadCV(value.userModel!);
                    var result = await Provider.of<TemplateVM>(context, listen: false).DownloadCV();
                    if(result){
                    SuccessSnack(context: context,title: AppLocale.home_cv_downloaded.getString(context));

                    }else{
                    ErrorSnack(context: context,title: AppLocale.home_cv_error.getString(context));

                    }

                }
                else{
                    ErrorSnack(context: context,title: AppLocale.home_no_template_choosed.getString(context));
                    }
                }

              Navigator.pop(context);

              },
              child: Text(
                "تایید شرایط",
                  //AppLocale.accept_privacy.getString(context),
                  style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title)),
            ),
          )
        ],
      ),
    );
  }
}
