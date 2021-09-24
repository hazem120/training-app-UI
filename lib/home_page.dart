// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // load data from json file
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = jsonDecode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.fromLTRB(10, 70, 10, 0),
        child: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'التدريب',
                  style: GoogleFonts.tajawal(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Text(
                  'البرنامج التدريبي الخاص بك',
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'تفاصيل',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                )
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(7, 7),
                      color: Color(0xFF6985e8).withOpacity(.5),
                      blurRadius: 10,
                    ),
                  ],
                  gradient: LinearGradient(colors: [
                    Color(0xff0f17ad).withOpacity(.9),
                    Color(0xff0f17ad).withOpacity(.5),
                  ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80))),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 25, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'التمرين التالي',
                      style: GoogleFonts.cairo(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'تمارين الساق',
                      style: GoogleFonts.cairo(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('60 min', style: TextStyle(color: Colors.white))
                      ],
                    ),
                    Row()
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'المناطق التي يتم التركيز عليها',
                  style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
              ]),
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: (info.length.toDouble() / 2).toInt(),
                  itemBuilder: (_, i) {
                    int a = i * 2;
                    int b = i * 2 + 1;
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 170,
                          width: 190,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(info[a]["img"])),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    color: Color(0xFF6985e8).withOpacity(.2),
                                    blurRadius: 3),
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    color: Color(0xFF6985e8).withOpacity(.2),
                                    blurRadius: 3),
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 170,
                          width: 190,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(info[b]["img"])),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    color: Color(0xFF6985e8).withOpacity(.2),
                                    blurRadius: 3),
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    color: Color(0xFF6985e8).withOpacity(.2),
                                    blurRadius: 3),
                              ]),
                        ),
                      ],
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
