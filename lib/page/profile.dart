import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_diary/page/recent_trips.dart';
import 'package:travel_diary/page/upcoming_trips.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: GoogleFonts.quicksand(
                fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: Column(
                children: [
                  Material(
                    elevation: 20,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        "https://avatars.githubusercontent.com/u/15737675?v=4",
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Prakash Kumar",
                    style: GoogleFonts.quicksand(
                        fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: Color(0xffF7EBE5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "10",
                        style: GoogleFonts.quicksand(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 20),
                        child: Text("Countries"),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(0xffE9F5EA),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1",
                        style: GoogleFonts.quicksand(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 20),
                        child: Text("Continent"),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(0xffEAEBFA),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "10",
                        style: GoogleFonts.quicksand(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 20),
                        child: Text("Countries"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => RecentTrips()));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF75C1E).withOpacity(0.15),
                ),
                child: Icon(Icons.flight_land_rounded)),
            title: Text("Recent trips"),
            subtitle: Text("includes all your past trips"),
            trailing: Container(
                padding: EdgeInsets.all(15),
                decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Icon(Icons.arrow_forward)),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => UpcomingTrips()));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff48F4F6).withOpacity(0.15),
                ),
                child: Icon(Icons.flight_takeoff_rounded)),
            title: Text("Upcoming trips"),
            subtitle: Text("includes all your past trips"),
            trailing: Container(
                padding: EdgeInsets.all(15),
                decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Icon(Icons.arrow_forward)),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF65959).withOpacity(0.15),
                ),
                child: Icon(Icons.person)),
            title: Text("Prakash Kumar"),
            subtitle: Text("Personal Info"),
            trailing: Container(
                padding: EdgeInsets.all(15),
                decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Icon(Icons.arrow_forward)),
          ),
        ],
      ),
    );
  }
}
