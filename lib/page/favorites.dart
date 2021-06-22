import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorites",
            style: GoogleFonts.quicksand(
                fontSize: 30, fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 14,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  child: Container(
                    height: 220,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.network(
                            "https://cdn.theatlantic.com/assets/media/img/mt/2014/04/RTR208HE-2/lead_720_405.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            margin: EdgeInsets.all(20),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              color: Color(0xffDBDBD9).withOpacity(0.8)
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("Nusa Penida Island",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.75)
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_location_rounded,
                                      size: 16,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text("Paris, France",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54
                                        ),),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: IconButton(
                              color: Colors.red.shade200,
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
