import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        children: [
          Text(
            "Profile",
            style: GoogleFonts.quicksand(
                fontSize: 30, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
