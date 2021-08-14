import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_diary/utils/stepper.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> continents = [
    "All",
    "Asia",
    "Africa",
    "Europe",
    "Australia",
    "South America",
    "North America",
    "Antarctica"
  ];

  List<Category> popular = [
    Category("Mountains",
        "https://www.dunyaatlasi.com/wp-content/uploads/2021/02/himalayalar.jpg"),
    Category("Beaches",
        "https://media.cntraveler.com/photos/57fea9ec8584f8cd20e65f15/16:9/w_1600%2Cc_limit/Aerial-One%26OnlyReethiRah-Maldives-CRHotel.jpg"),
    Category("Hill Stations",
        "https://avatars.githubusercontent.com/u/15737675?v=4"),
    Category("Islands", "https://avatars.githubusercontent.com/u/15737675?v=4"),
    Category(
        "Snow World", "https://avatars.githubusercontent.com/u/15737675?v=4")
  ];

  List<Place> places = [
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Taj_Mahal_in_India_-_Kristian_Bertel.jpg/1200px-Taj_Mahal_in_India_-_Kristian_Bertel.jpg"),
    Place("Eiffel Tower", "Paris",
        "https://www.cnet.com/a/img/A7WJsx7lIYfvN3ieKCey-rACzjU=/940x0/2015/02/25/49752f72-14d6-4033-af9c-88d40611d3c7/eiffel1.jpg"),
    Place("Colosseum of Rome", "Italy",
        "https://st0.dancf.com/gaoding-material/2020-06-08/1591580687-pPI2Q.jpg?x-oss-process=image/resize,w_800/interlace,1,image/format,webp"),
    Place("Great wall of China", "China",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
    Place("Leaning Tower of Pisa", "Italy",
        "https://preview.redd.it/5f01kxd61mi51.png?auto=webp&s=38b4e5a400b045a188916cd64e74169c48994d1e"),
    Place("Stonehenge", "England",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 20,
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter:
                            new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: Colors.grey.shade200.withOpacity(0.3),
                          padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://avatars.githubusercontent.com/u/15737675?v=4",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Hi, Prakash!",
                      style: GoogleFonts.quicksand(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                    decoration: ShapeDecoration(
                        color: Colors.white38,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        shadows: [
                          BoxShadow(
                              color: Color(0x4ac5c5c5),
                              blurRadius: 10,
                              spreadRadius: 8)
                        ]),
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                          child: Center(
                            child: IconButton(
                                icon: Icon(
                                  SFSymbols.plus,
                                  color: Colors.black,
                                ),
                                onPressed: onPlusButtonPressed),
                          ),
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
                    color: Colors.grey.shade800,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
                cursorWidth: 3.3,
                cursorColor: Color(0xff98B1AD),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 18, bottom: 18),
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
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
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
              itemCount: popular.length,
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
                          popular[index].image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14, right: 8),
                        child: Text(
                          popular[index].name,
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
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: continents.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: FlatButton(
                    child: Text(
                      continents[index],
                      style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                    shape: StadiumBorder(),
                  )),
            ),
          ),
          Container(
            height: 220,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: places.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                      side: BorderSide(width: 0, color: Colors.white),
                    ),
                    shadows: [
                      BoxShadow(
                          color: Color(0x22c5c5c5),
                          blurRadius: 1,
                          spreadRadius: 2.5)
                    ],
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.network(
                          places[index].imageUrl,
                          height: 200,
                          fit: BoxFit.cover,
                          width: 170,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Container(
                            width: 160,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 5, 0, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    places[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    places[index].location,
                                    style: GoogleFonts.quicksand(
                                        color: Colors.grey.shade800
                                            .withOpacity(0.8),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21)),
                              color: Color(0xffdfdfe1).withOpacity(0.8)),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: IconButton(
                            color: Colors.red.shade200,
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  )),
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

  void onPlusButtonPressed() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 90,
                        height: 4,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          "Plan a trip",
                          style: GoogleFonts.quicksand(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.quicksand(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                        cursorWidth: 3.3,
                        cursorColor: Color(0xff98B1AD),
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 18, bottom: 18),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent),
                                gapPadding: 0),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "  Enter location.",
                            hintStyle: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                            )),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "No of days",
                              style: GoogleFonts.quicksand(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            CartStepper(
                              count: 2,
                              axis: Axis.horizontal,
                              didChangeCount: (int count) {},
                              size: 40,
                              activeBackgroundColor: Color(0xffEAECEC),
                              activeForegroundColor:
                                  Colors.black.withOpacity(0.7),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Next",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          onPressed: () {},
                          shape: StadiumBorder(),
                          color: Color(0xff98B1AD),
                        ),
                      )
                    ],
                  )),
            ));
  }
}

class Place {
  String name;
  String location;
  String imageUrl;

  Place(this.name, this.location, this.imageUrl);
}

class Category {
  String name;
  String image;

  Category(this.name, this.image);
}
