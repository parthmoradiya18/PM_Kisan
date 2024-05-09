
import 'package:flutter/material.dart';
import 'package:pm_kisan/Unit/PM_Kisan_websited.dart';

class PM_KISAN_Page extends StatefulWidget {
  const PM_KISAN_Page({Key? key}) : super(key: key);

  @override
  State<PM_KISAN_Page> createState() => _PM_KISAN_PageState();
}

class _PM_KISAN_PageState extends State<PM_KISAN_Page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      PreferredSize(child:  AppBar(
        title: const Text(
          "PM KISAN SAMMAN NIDHI",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
      ), preferredSize: Size(0, 50)),

      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child:  MaterialButton(
              shape: Border.all(color: Colors.lightGreen.shade900,width: 5),
              color: Colors.red[900],
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PM_KISAN_web(),
                      settings: const RouteSettings(
                        arguments: "https://pmkisan.gov.in/",
                      ),
                    ),
                  );
                });
              },
              child: const Text(
                "PM KISAN SAMMAN NIDHI",
                style: TextStyle(color: Colors.white,letterSpacing: 0.5,fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),

          ),
        ),
      ],),

    );
  }
}