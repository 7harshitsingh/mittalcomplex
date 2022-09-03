import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/widgets.dart';

class MySlotFragment extends StatefulWidget {
  const MySlotFragment({Key? key}) : super(key: key);

  @override
  State<MySlotFragment> createState() => _MySlotFragmentState();
}

class _MySlotFragmentState extends State<MySlotFragment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  child: Text('My Slots'),
                ).paddingLeft(16),
                GestureDetector(
                  onTap: () {
                    //const ().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                  },
                  child: const Icon(
                    Icons.notifications,
                    size: 28,
                    color: whiteColor,
                  ),
                ).paddingRight(20),
              ],
            ),
            24.height,
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              decoration: boxDecorationRoundedWithShadow(16,
                  backgroundColor: mcPrimaryColorDark),
              child: Column(
                children: [
                  myslotlist('Kabbadi', 'Slot: 7:00pm', Icons.event_available,
                      Colors.green, 'Confirm'),
                  myslotlist('Basket Ball', 'Slot: 5:00pm', Icons.event_available,
                      Colors.green, 'Confirm'),
                  myslotlist('Squash', 'Slot: 9:00pm', Icons.event_busy,
                      Colors.red, 'Failed'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Each member can book at max 3 slots', style: secondaryTextStyle(color: Colors.white54,),)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
