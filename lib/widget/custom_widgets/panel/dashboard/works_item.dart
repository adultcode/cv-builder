import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {

  WorkModel workModel;

  WorkItem(this.workModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(workModel.title!),
    );
  }
}
