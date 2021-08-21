import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_diary/page/recent_trips.dart';

class UpcomingTrips extends StatefulWidget {
  const UpcomingTrips({Key? key}) : super(key: key);

  @override
  _UpcomingTripsState createState() => _UpcomingTripsState();
}

class _UpcomingTripsState extends State<UpcomingTrips> {
  List<PlaceTrip> trips = [
    PlaceTrip("London, UK",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall_%28cropped%29.jpg/1000px-Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall_%28cropped%29.jpg"),
    PlaceTrip("Seoul,South Korea",
        "https://www.onsemi.com/site/images/location-seoul-korea.png"),
    PlaceTrip("Moscow, Russia",
        "https://www.bursa.ro/_img/articole/mare/431783.jpg"),
    PlaceTrip("Los Angels, USA",
        "https://media.tacdn.com/media/attractions-splice-spp-674x446/07/71/39/f1.jpg"),

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
                  "Upcoming trips",
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
