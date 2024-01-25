import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/viewmodel/education_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/radius_size.dart';


class EducationItem extends StatelessWidget {


  EducationModel educationModel;

  EducationItem({required this.educationModel});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: work_background,
          borderRadius: BorderRadius.all(Radius.circular(inner_radius))
      ),
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          /*
          row for edit and delete icons
           */
          Row(
            children: [

              // edit icon
              IconButton(onPressed: () {
                Provider.of<EducationVM>(context,listen: false).SelectEducationModel(educationModel);

              }, icon: Icon(Icons.wrap_text_rounded,color: work_text,)) ,
              // delete icon
              IconButton(onPressed: () {
                Provider.of<EducationVM>(context,listen: false).DeleteWork(educationModel);

              }, icon: Icon(Icons.delete_forever_rounded,color: work_text,))
            ],
          ),
          // company field
          Expanded(child: Text(educationModel.university!,textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: work_text),),),
          // work title
          Expanded(child: Text("${educationModel.title!} - ${educationModel.grade!}", textAlign: TextAlign.right ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: work_text),)),



        ],
      ),
    );
  }

}
