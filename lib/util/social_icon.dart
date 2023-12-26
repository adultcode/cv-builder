import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../model/social_model.dart';

Future<String> SocialIcon(SocialType socialType)async{

  // return pw.Container();
  switch(socialType){
    case SocialType.linkedin:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.github:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.telegram:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.dribble:
      return  await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    // case SocialType.other:
    //   await rootBundle.loadString('assets/linkedin_fill.svg');
    //   break;
    default:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
  }
}