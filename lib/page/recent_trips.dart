import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_diary/page/main_page.dart';

class RecentTrips extends StatefulWidget {
  const RecentTrips({Key? key}) : super(key: key);

  @override
  _RecentTripsState createState() => _RecentTripsState();
}

class _RecentTripsState extends State<RecentTrips> {
  List<PlaceTrip> trips = [
    PlaceTrip("Paris, France",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/1200px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg"),
    PlaceTrip("Toyko, Japan",
        "https://d1ix9yerv4y8lr.cloudfront.net/blog/wp-content/uploads/2019/07/tokyo-ops-7-19-750x375.jpg"),
    PlaceTrip("New York, USA",
        "https://indochinalines.com/wp-content/uploads/2020/07/van-chuyen-hang-hoa-di-my-1024x576.jpg"),
    PlaceTrip("Rio, Brazil",
        "https://www.planetware.com/photos-large/BRA/brazil-rio-cristo-redentor.jpg"),
    PlaceTrip("Dubai, UAE",
        "https://namit.ir/upload/2020/11/08/a1f4f532232cd-a270dc92c4393b0-05361cacc989c.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Recent trips",
                  style: GoogleFonts.quicksand(
                      fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                child: Image.network(
                                  trips[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 120,
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      trips[index].name,
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700),
                                    ))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceTrip {
  String name;
  String imageUrl;

  PlaceTrip(this.name, this.imageUrl);
}


