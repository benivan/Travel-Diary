import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:travel_diary/page/main_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentItem;

  @override
  void initState() {
    super.initState();
    currentItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: BottomNavigationBar(
          items: items,
          selectedItemColor: Color(0xFF98B1AD),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentItem,
          onTap: (item) {
            setState(() {
              currentItem = item;
            });
          },
        ),
      ),
      body: currentItem == 0
      ? MainPage()
      : DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

var items = [
  BottomNavigationBarItem(
      icon: Icon(SFSymbols.house),
      activeIcon: Icon(SFSymbols.house_fill),
      title: Text("Home")),
  BottomNavigationBarItem(
      icon: Icon(SFSymbols.map),
      activeIcon: Icon(SFSymbols.map_fill),
      title: Text("Map")),
  BottomNavigationBarItem(
      icon: Icon(SFSymbols.heart),
      activeIcon: Icon(SFSymbols.heart_fill),
      title: Text("Favorites")),
  BottomNavigationBarItem(
      icon: Icon(SFSymbols.person_circle),
      activeIcon: Icon(SFSymbols.person_circle_fill),
      title: Text("Account")),
];
