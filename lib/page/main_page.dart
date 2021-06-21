import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                            color: Color(0x4ac5c5c5),
                            blurRadius: 5,
                            spreadRadius: 8)
                      ]),
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/15737675?v=4",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        shadows: [
                          BoxShadow(
                              color: Color(0x4ac5c5c5),
                              blurRadius: 5,
                              spreadRadius: 8)
                        ]),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: Center(
                        child: IconButton(
                          iconSize: 25,
                          color: Colors.black,
                          icon: Icon(
                            Icons.notifications_none,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text("Discover \na new world",
                style: GoogleFonts.quicksand(
                    fontSize: 35, fontWeight: FontWeight.w900)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Material(
              shadowColor: Color(0xFFc5c5c5),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: TextField(
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(color: Colors.grey.shade800)),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
                        gapPadding: 0),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    hintText: "  Location, country...",
                    hintStyle: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w800,
                      height: 1.0,
                    )),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10),
            child: Text(
              "Popular",
              style: GoogleFonts.quicksand(
                  textStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            height: 86,
            padding: EdgeInsets.only(left: 8),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(width: 0, color: Colors.white),
                    ),
                    shadows: [
                      BoxShadow(
                          color: Color(0x32c5c5c5),
                          blurRadius: 3,
                          spreadRadius: 6)
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(9),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/15737675?v=4",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14, right: 8),
                        child: Text(
                          "Mountains",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10, top: 20),
            child: Row(
              children: [
                Text(
                  "Upcoming",
                  style: GoogleFonts.quicksand(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Recent",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey.shade300,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 260,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(width: 0, color: Colors.white),
                    ),
                    shadows: [
                      BoxShadow(
                          color: Color(0x32c5c5c5),
                          blurRadius: 3,
                          spreadRadius: 6)
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(9),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg",
                          height: 170,
                          fit: BoxFit.fill,
                          width: 170,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 5, right: 5),
                        child: Container(
                          width: 160,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Canada",
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "30 March",
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
