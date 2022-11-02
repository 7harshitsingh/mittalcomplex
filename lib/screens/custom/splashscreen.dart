import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/dashboard/dashboard.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/slotsdata.dart';
import 'package:provider/provider.dart';

import '../../utils/defaultdata.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  Widget build(BuildContext context) {
    Defaultdata service = Provider.of<Defaultdata>(context);
    SlotsData slots = Provider.of<SlotsData>(context);
    Future.delayed(const Duration(seconds: 3), () async {
      service.getdefaultdataCollectionFromFirebase();
      slots.getSlotsDataCollectionFromFirebase();
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardScreen(),
        ),
        (route) => false,
      );
    }
  );

    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/ic.jpg',
              height: 70,
              width: 70,
            ),
          ),
        ],
      ),
    );
  }
}
