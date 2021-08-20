import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_diary/auth/login.dart';
import 'package:travel_diary/page/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => {
          if (value.containsKey("auth"))
            {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Homepage()))
            }
          else
            {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text("Loading")
            ],
          ),
        ),
      ),
    );
  }
}
