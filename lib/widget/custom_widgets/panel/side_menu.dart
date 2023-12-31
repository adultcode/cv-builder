import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: ScreenSize.height,
      padding: EdgeInsets.symmetric(vertical: ScreenSize.height*0.02),
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
          color: Color(0xffeff0f3),
                //width: 3
              ),
        boxShadow: [
          BoxShadow(
          color:  Colors.black12.withOpacity(0.1),
            offset: Offset(2,2),
            spreadRadius: 1,
            blurRadius: 10
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person,size: 30,color: Color(0xffb5bdd1),)
        ],
      ),
    );
  }
}
