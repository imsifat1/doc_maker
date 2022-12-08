import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:text_to_pdf/pages/home_page.dart';

Future<void> main() async {

  runApp(const MaterialApp(home: HomePage(),));

}