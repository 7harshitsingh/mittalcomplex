import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/widgets.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: Column(
        children: [
          Center(
            child: heading(title: "Take premium"),
          ),
          12.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 165,
                width: 165,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text('ORS', style: boldTextStyle(color: Colors.white)),
                    Text('Rs.69/3-month', style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                  ],
                )
              ),
              30.width,
              Container(
                height: 165,
                width: 165,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text('ORS + BSA IITD', style: boldTextStyle(color: Colors.white)),
                    Text('Rs.169/3-month', style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                  ],
                )
              ),
            ],
          ).paddingAll(24)
        ],
      ),
    );
  }
}
