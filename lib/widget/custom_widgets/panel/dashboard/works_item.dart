import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mvvm/viewmodel/work_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';

class WorkItem extends StatelessWidget {

  WorkModel workModel;

  WorkItem(this.workModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: InkWell(
      //
      //   onTap: () {
      //     print("clicked");
      //     Provider.of<WorkVM>(context,listen: false).SelectWorkModel(workModel);
      //
      //   },
      //   child: Text(workModel.title!),
      // ),
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

              }, icon: Icon(Icons.wrap_text_rounded,color: work_text,)) ,
              // edit icon
              IconButton(onPressed: () {

              }, icon: Icon(Icons.delete_forever_rounded,color: work_text,))
            ],
          ),
          // company field
        Expanded(child: Text(workModel.company!,textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: work_text),),),
      // work title
          Expanded(child: Text(workModel.title!, textAlign: TextAlign.right ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: work_text),)),



        ],
      ),
    );
  }
}
