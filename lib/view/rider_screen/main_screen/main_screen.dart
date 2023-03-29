import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/home_screen/home_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text("2"),
    Text("3"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(Assets.iconHome),
                label: 'home'.tr,
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Image.asset(Assets.imageBell,scale: 15,),
                label: 'new_order'.tr,
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
              icon:Image.asset(Assets.iconStatus),
              label: 'status'.tr,
                backgroundColor: Colors.white
            ),
          ],
          showUnselectedLabels: true,

          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: appRedColor,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    ));
  }
}

