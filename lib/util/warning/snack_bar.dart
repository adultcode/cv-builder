
/*
snack bar method for user alert
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';

/*
snackbar success design
 */
SuccessSnack({required BuildContext context,required String title}){
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
         duration: Duration(seconds: 2),
         showCloseIcon: true,

         content: Text(title,style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),backgroundColor: panel_green),
  );
}

/*
snack bar for error
 */
ErrorSnack({required BuildContext context,required String title}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
        duration: Duration(seconds: 2),
        content: Text(title,style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),backgroundColor: Colors.redAccent),
  );
}