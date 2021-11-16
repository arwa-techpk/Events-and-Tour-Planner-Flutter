import 'package:flutter/material.dart';
import 'package:terhal/constants/constants_colors.dart';
import 'package:terhal/ui/screens/auth/profile.dart';
import 'package:terhal/ui/screens/explore_screen/explore_scree.dart';
import 'package:terhal/ui/screens/favorite/favorite_screen.dart';
import 'package:terhal/ui/screens/schedule/make_a_plan.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [


    Profile(),
  

    FavoriteScreen(),
    Planatrip(),
    ExploreScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        selectedItemColor: ConstantColor.medblue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
       

        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "profile",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule,
              ),
              label: "schedule"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Explore"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
