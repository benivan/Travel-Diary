import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_diary/page/favorites.dart';
import 'package:travel_diary/page/main_page.dart';
import 'package:travel_diary/page/profile.dart';

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

      // TODO: Change bottom navigation bar [https://github.com/BilalShahid13/PersistentBottomNavBar]
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
      body: navigateToScreen(),
    );
  }

  navigateToScreen() {
    switch (currentItem) {
      case 0:
        return MainPage();
        break;
      case 2:
        return Favorites();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
        return DemoPage();
    }
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
      icon: FaIcon(FontAwesomeIcons.compass),
      activeIcon: FaIcon(FontAwesomeIcons.solidCompass),
      title: Text("Map")),
  BottomNavigationBarItem(
      icon: Icon(SFSymbols.heart),
      activeIcon: Icon(SFSymbols.heart_fill),
      title: Text("Favorites")),
  BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.user,
        size: 20,
      ),
      activeIcon: FaIcon(
        FontAwesomeIcons.solidUser,
        size: 20,
      ),
      title: Text("Account")),
];
