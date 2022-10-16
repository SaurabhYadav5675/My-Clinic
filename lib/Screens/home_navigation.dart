import 'package:flutter/material.dart';
import 'package:my_clinic/Providers/home_provider.dart';
import 'package:my_clinic/Screens/home_screen.dart';
import 'package:my_clinic/Screens/job_schedules.dart';
import 'package:my_clinic/Screens/user_profile.dart';
import 'package:provider/provider.dart';

import '../Constants/custom_colors.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  final List<Widget> screens = [const HomeScreen(), const JobSchedules(), const UserProfile()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
      ],
      child: Scaffold(
        appBar: null,
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: CustomColors.colorBlue,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                icon: Image(
                  image: _currentIndex == 0
                      ? const AssetImage("assets/images/home_blue.png")
                      : const AssetImage("assets/images/home_grey.png"),
                  height: 30,
                  width: 30,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: _currentIndex == 1
                      ? const AssetImage("assets/images/schedule_blue.png")
                      : const AssetImage("assets/images/schedule_grey.png"),
                  height: 30,
                  width: 30,
                ),
                label: "Jobs",
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: _currentIndex == 2
                      ? const AssetImage("assets/images/home_blue.png")
                      : const AssetImage("assets/images/home_grey.png"),
                  height: 30,
                  width: 30,
                ),
                label: "Profile",
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}
