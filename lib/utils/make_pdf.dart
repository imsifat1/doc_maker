import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:text_to_pdf/model/invoice_model.dart';

Future<Uint8List> makePdf(String textEditingController) async {
  final pdf = Document();
  // final imageLogo = MemoryImage((await rootBundle.load('assets/logo.png')).buffer.asUint8List());
  pdf.addPage(pw.Page(build: (context) {
    return pw.SizedBox(

      child: pw.Text(
        textEditingController
      ),
    );
  }));

  return pdf.save();
  }
//
// Widget PaddedText(
//     final String text, {
//       final TextAlign align = TextAlign.left,
//     }) =>
//     Padding(
//       padding: EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: align,
//       ),
//     );