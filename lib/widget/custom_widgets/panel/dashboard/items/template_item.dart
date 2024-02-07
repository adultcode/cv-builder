import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../../util/constant/color.dart';

class TemplateItem extends StatelessWidget {

  TemplateModel templateModel;
  TemplateItem({required this.templateModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TemplateVM>(context, listen: false).TemplateClick(templateModel) ;

      },
      child: Container(
      //  height: 180,
         //   width: 150,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all( 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
          color: templateModel.selected==true?primary_container:Color(0xffefefef),
        ),
        child: Image.asset(templateModel.img_path!,width: 80,height: 80,fit: BoxFit.fill,),
      ),
    );

  }
}
