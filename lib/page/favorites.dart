import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_diary/page/main_page.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  List<Place> places = [
    Place("Colosseum of Rome", "Italy",
        "https://st0.dancf.com/gaoding-material/2020-06-08/1591580687-pPI2Q.jpg?x-oss-process=image/resize,w_800/interlace,1,image/format,webp"),
    Place("Leaning Tower of Pisa", "Italy",
        "https://preview.redd.it/5f01kxd61mi51.png?auto=webp&s=38b4e5a400b045a188916cd64e74169c48994d1e"),
    Place("Stonehenge", "England",
        "http://4.bp.blogspot.com/-kCIerlBLofY/T8VQDxQOOpI/AAAAAAAAAAo/UpRHzazkjEo/w1200-h630-p-k-no-nu/Stonehenge+1.JPG"),
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Taj_Mahal_in_India_-_Kristian_Bertel.jpg/1200px-Taj_Mahal_in_India_-_Kristian_Bertel.jpg"),
    Place("Eiffel Tower", "Paris",
        "https://www.cnet.com/a/img/A7WJsx7lIYfvN3ieKCey-rACzjU=/940x0/2015/02/25/49752f72-14d6-4033-af9c-88d40611d3c7/eiffel1.jpg"),
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
    Place("Taj Mahal", "India",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Ulstein-Church-2020.jpg/454px-Ulstein-Church-2020.jpg"),
    Place("Nusa Penida Island", "Paris, France", "https://cdn.theatlantic.com/assets/media/img/mt/2014/04/RTR208HE-2/lead_720_405.jpg"),

  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Favorites",
              style: GoogleFonts.quicksand(
                  fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: places.length,
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
                            places[index].imageUrl,
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
                                  child: Text(places[index].name,
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
                                        child: Text(places[index].location,
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
