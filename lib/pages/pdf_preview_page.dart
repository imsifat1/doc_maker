import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:text_to_pdf/model/invoice_model.dart';
import 'package:text_to_pdf/pages/details_page.dart';
import 'package:pdf/pdf.dart';
import 'package:text_to_pdf/utils/make_pdf.dart';

class PdfPreviewPage extends StatelessWidget {
  final String text;
  const PdfPreviewPage({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(text),
      ),
    );
  }
}