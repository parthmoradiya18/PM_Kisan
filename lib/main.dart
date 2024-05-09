
import 'package:flutter/material.dart';
import 'package:pm_kisan/Unit/PM_Kisan_websited.dart';
import 'package:pm_kisan/View/PM_Kisan_Page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const PM_KISAN_Page(),
        'PM_KISAN': (context) => const PM_KISAN_web(),
      },
    ),
  );
}