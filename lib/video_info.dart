// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoInfo extends StatefulWidget {
  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  // load data from json file
  List info = [];
  bool _playArea = false;

  Future _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        info = jsonDecode(value);
      });
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
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF5564d8),
          Color(0xFF5564d8).withOpacity(.7)
        ])),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 65, right: 25, left: 25),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.white)),
                            Expanded(child: Container()),
                            Icon(Icons.info_outline, color: Colors.white),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      Text('60 min',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 35, left: 10, right: 10),
                          height: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.info_outline,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        playView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'الجولة الاولي : تمارين الساق',
                            style: GoogleFonts.cairo(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: info.length,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_playArea == false) {
                                    _playArea = !_playArea;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                                height: 135,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    info[i]["thumbnail"])),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              info[i]["title"],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              info[i]["time"],
                                              style: TextStyle(
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  playView(BuildContext context) {}
}
