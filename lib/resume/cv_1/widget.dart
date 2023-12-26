import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../util/constant/color.dart';
import '../../util/constant/font_size.dart';
import '../../util/constant/text_style.dart';

Widget RightBody(var text, {double? margin_top}){
  return pw.Container(
      alignment: pw.Alignment.topRight,
      margin: pw.EdgeInsets.only(top: margin_top??top_margin_body_1),
      child: pw.Text(text,
          textDirection: pw.TextDirection.rtl,
          textAlign: pw.TextAlign.justify,

          style: body_style_1
      )

  );
}

Widget TitleText(var text, {double? margin_top}){
  return pw.Container(
      alignment: pw.Alignment.topRight,
      margin: pw.EdgeInsets.only(top: margin_top??top_margin_title_1),
      child: pw.Text(text,
          textDirection: pw.TextDirection.rtl,
          style: title_style_1
      )

  );
}