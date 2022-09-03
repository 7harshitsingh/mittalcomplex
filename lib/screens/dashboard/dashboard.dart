import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mittalcomplex/fragment/explore.dart';
import 'package:mittalcomplex/fragment/livescore.dart';
import 'package:mittalcomplex/fragment/myslots.dart';
import 'package:mittalcomplex/fragment/slotbooking.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mittalcomplex/widgets/bottombar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  List<Widget> dashBoardScreenList = [
    ExploreFragment(),
    const MySlotFragment(),
    const BookFragment(),
    const LiveScoreFragment(),
  ];

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColor,
      body: dashBoardScreenList[_currentIndex],
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        curve: Curves.easeIn,
        backgroundColor: mcPrimaryColorDark,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavyBarItem(
              icon: const Icon(FontAwesome.home),
              title: Text('Explore',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.list_alt),
              title: Text('My Slots',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.add_box_outlined),
              title: Text('Book',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.circle_rounded, color: Colors.red),
              title: Text('Live',
                  style: boldTextStyle(color: Colors.red, size: 16))),
        ],
      ).paddingTop(12),
    );
  }
}
